-- Facut de Hancky#9804

local fontsLoaded = false
local fontId
local onlinePlayers = 0
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    RegisterFontFile('wmk')
    fontId = RegisterFontId('Freedom Font')
    fontsLoaded = true
    while true do
        TriggerServerEvent('getOnlinePly')
        Wait(20000)
    end
end)

RegisterNetEvent('getGlobalOnlinePly')
AddEventHandler('getGlobalOnlinePly', function(connectedPlayers)
    onlinePlayers = connectedPlayers
end)

local function drawTxt(text, thePos, scale, r, g, b)
    SetTextDropShadow(1, 5, 5, 5, 255)
    SetTextFont(8)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, 250)
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(thePos)
end

local totalTickets = 0
local isAdmin = false

function tvRP.setAdmin()
    isAdmin = true
end

RegisterNetEvent("hf:Tickets")
AddEventHandler("hf:Tickets", function(totalTickets)
end)

function tvRP.setAdmin()
	Citizen.CreateThread(function()
		Citizen.Wait(1)
		local pos = vector2(0.9, 0.93)
		local scale = 0.7
		while true do
			drawTxt(string.format("~g~%02d ~w~TICKETE ACTIVE", totalTickets), pos+vector2(-0.38, -0.918), 0.60*scale, 255, 255, 255,2)
			Citizen.Wait(1)
		end
	end)
end