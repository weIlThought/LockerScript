ESX = exports["es_extended"]:getSharedObject()

local ox_inventory = exports.ox_inventory
local qs_inventory = exports['qs-inventory']

Discord_url = ""

-- if Config.Framework == 'ESX' then
--   Core = exports['es_extended']:getSharedObject()
-- elseif Config.Framework == 'QBCore' then
--   Core = exports['qb-core']:GetCoreObject()
-- end

-- RegisterNetEvent('SickEvidence:createInventory')
-- AddEventHandler('SickEvidence:createInventory', function(evidenceID)
--     if Config.Framework == 'ESX' then
--       local xPlayer = ESX.GetPlayerFromId(source)
--       local name = xPlayer.getName()
--       local id = evidenceID
--       local label = evidenceID
--       local slots = 25
--       local maxWeight = 5000

--       -- Registering stash using Quasar Inventory system
--       TriggerServerEvent("inventory:server:OpenInventory", "stash", "Stash_"..id, {maxweight = maxWeight, slots = slots})
--       TriggerEvent("inventory:client:SetCurrentStash", "Stash_"..id)
--       sendCreateDiscord(source, name, "Created Evidence", evidenceID)
--     elseif Config.Framework == 'QBCore' then
--       local xPlayer = Core.Functions.GetPlayer(source)
--       local name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
--       local id = evidenceID
--       local label = evidenceID
--       local slots = 25
--       local maxWeight = 5000

--       -- Registering stash using Quasar Inventory system
--       TriggerServerEvent("inventory:server:OpenInventory", "stash", "Stash_"..id, {maxweight = maxWeight, slots = slots})
--       TriggerEvent("inventory:client:SetCurrentStash", "Stash_"..id)
--       sendCreateDiscord(source, name, "Created Evidence", evidenceID)
--     end

--     -- MySQL code to save locker to database
--     MySQL.Async.execute('INSERT INTO inventory_stash (id, stash, items) VALUES (@id, @stash, @items)', {
--         ['@id'] = evidenceID,
--         ['@stash'] = "Stash_"..evidenceID,
--         ['@items'] = json.encode({})
--     }, function(rowsChanged)
--         if rowsChanged > 0 then
--             print('Locker successfully saved to database.')
--         else
--             print('Failed to save locker to database.')
--         end
--     end)
-- end)

RegisterNetEvent('SickEvidence:createInventory')
AddEventHandler('SickEvidence:createInventory', function(evidenceID)
    if Config.Framework == 'ESX' then
      local xPlayer = ESX.GetPlayerFromId(source)
      local name = xPlayer.getName()
      local id = evidenceID
      local label = evidenceID
      local slots = 25
      local maxWeight = 5000

      qs_inventory:RegisterStash(name, label, slots, maxWeight)
      sendCreateDiscord(source, name, "Created Evidence", evidenceID)
    elseif Config.Framework == 'QBCore' then
      local xPlayer = Core.Functions.GetPlayer(source)
      local name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
      local id = evidenceID
      local label = evidenceID
      local slots = 25
      local maxWeight = 5000

      ox_inventory:RegisterStash(id, label, slots, maxWeight,nil)
      sendCreateDiscord(source, name, "Created Evidence", evidenceID)
    end
end)

lib.callback.register('SickEvidence:getInventory', function(source, evidenceID)
    local inv = exports['qs-inventory']:GetInventory(evidenceID, false)
    if inv then
      return true
    else
      return false
    end
end)

RegisterNetEvent('SickEvidence:deleteEvidence')
AddEventHandler('SickEvidence:deleteEvidence', function(evidenceID)
--[[     MySQL.update('DELETE FROM ox_inventory WHERE name = ?',
      {
        evidenceID
      },function(result)
        if result then
          --Notify(1, src, "Warrant was deleted Successfully!")
        else
          --Notify(3, src, "Warrant wasn\'t Deleted please try again!")
        end
    end)
    sendDeleteDiscord(source, name, "Deleted Evidence",evidenceID) ]]
end)

RegisterNetEvent('SickEvidence:createLocker')
AddEventHandler('SickEvidence:createLocker', function(lockerID)
    if Config.Framework == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        local id = lockerID
        local label = lockerID
        local slots = 25
        local maxWeight = 5000

        qs_inventory:RegisterStash(name, label, slots, maxWeight,nil)
        sendCreateDiscord(source, name, "Created Locker",label)
    elseif Config.Framework == 'QBCore' then
        local xPlayer = Core.Functions.GetPlayer(source)
        local name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
        local id = lockerID
        local label = lockerID
        local slots = 25
        local maxWeight = 5000

        ox_inventory:RegisterStash(id, label, slots, maxWeight,nil)
        sendCreateDiscord(source, name, "Created Locker",label)
    end
end)

lib.callback.register('SickEvidence:getOtherInventories', function(source, Otherlocker)
    local inv = exports['qs-inventory']:GetInventory(Otherlocker, false)
    if inv then
      return true
    else
      return false
    end
end)

-- RegisterNetEvent('SickEvidence:createOtherLocker')
-- AddEventHandler('SickEvidence:createOtherLocker', function(OtherlockerID)
--     -- Your code for creating other lockers here

--     -- MySQL code to save locker to database
--     MySQL.Async.execute('INSERT INTO inventory_stash (id, stash, items) VALUES (@id, @stash, @items)', {
--         ['@id'] = OtherlockerID,
--         ['@stash'] = "Stash_"..OtherlockerID,
--         ['@items'] = json.encode({})
--     }, function(rowsChanged)
--         if rowsChanged > 0 then
--             print('Other locker successfully saved to database.')
--         else
--             print('Failed to save other locker to database.')
--         end
--     end)
-- end)

RegisterNetEvent('SickEvidence:createOtherLocker')
AddEventHandler('SickEvidence:createOtherLocker', function(OtherlockerID)
    if Config.Framework == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        local id = OtherlockerID
        local label = OtherlockerID
        local slots = 25
        local maxWeight = 5000

        qs_inventory:RegisterStash(name, label, slots, maxWeight,nil)
        sendCreateDiscord(source, name, "Created Job Locker",label)
    elseif Config.Framework == 'QBCore' then
        local xPlayer = Core.Functions.GetPlayer(source)
        local name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
        local id = OtherlockerID
        local label = OtherlockerID
        local slots = 25
        local maxWeight = 5000

        ox_inventory:RegisterStash(id, label, slots, maxWeight,nil)
        sendCreateDiscord(source, name, "Created Job Locker",label)
    end
end)

-- lib.callback.register('SickEvidence:getLocker', function(source, lockerID)
--   -- Your code for getting locker information here

--   -- MySQL code to check if locker exists in database
--   MySQL.Async.fetchScalar('SELECT COUNT(*) FROM inventory_stash WHERE id = @id', {
--       ['@id'] = lockerID
--   }, function(result)
--       if result > 0 then
--           return true
--       else
--           return false
--       end
--   end)
-- end)

lib.callback.register('SickEvidence:getLocker', function(source, lockerID)
  local inv = exports['qs-inventory']:GetInventory(lockerID, false)
  if not inv then
    return true
  else
    return false
  end
end)

-- RegisterNetEvent('SickEvidence:deleteEvidence')
-- AddEventHandler('SickEvidence:deleteEvidence', function(evidenceID)
--     -- Your code for deleting evidence here

--     -- MySQL code to delete evidence from database
--     MySQL.Async.execute('DELETE FROM inventory_stash WHERE id = @id', {
--         ['@id'] = evidenceID
--     }, function(rowsChanged)
--         if rowsChanged > 0 then
--             print('Evidence successfully deleted from database.')
--         else
--             print('Failed to delete evidence from database.')
--         end
--     end)
-- end)

-- RegisterNetEvent('SickEvidence:deleteLocker')
-- AddEventHandler('SickEvidence:deleteLocker', function(lockerID)
--        MySQL.update('DELETE FROM ox_inventory WHERE name = ?',
--       {
--         lockerID
--       },function(result)
--         if result then
--           --Notify(1, src, "Warrant was deleted Successfully!")
--         else
--           --Notify(3, src, "Warrant wasn\'t Deleted please try again!")
--         end
--     end)
--     sendDeleteDiscord(source, name, "Deleted Locker",lockerID)
--     print(string.format("deleting locker for identifier '%s'",lockerID)) 
-- end)

sendDeleteDiscord = function(color, name, message, footer)
  local embed = {
        {
            ["color"] = 3085967,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer,
            },
            ["author"] = {
              ["name"] = 'Made by | SickJuggalo666',
              ['icon_url'] = 'https://i.imgur.com/arJnggZ.png'
            }
        }
    }

  PerformHttpRequest(Discord_url, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

sendCreateDiscord = function(color, name, message, footer)
  local embed = {
        {
            ["color"] = 3085967,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer,
            },
            ["author"] = {
              ["name"] = 'Made by | SickJuggalo666',
              ['icon_url'] = 'https://i.imgur.com/arJnggZ.png'
            }
        }
    }

  PerformHttpRequest(Discord_url, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

lib.callback.register('SickEvidence:getPlayerName', function(source)
    if Config.Framework == 'ESX' then
      local xPlayer = ESX.GetPlayerFromId(source)
      MySQL.query('SELECT `firstname`,`lastname` FROM `users` WHERE `identifier` = @identifier',{
          ['@identifier'] = xPlayer.identifier},
        function(results)
          if results[1] then
            local data = {
              firstname = results[1].firstname,
              lastname  = results[1].lastname,
            }
            return data
          else
            return nil
          end
      end)
    elseif Config.Framework == 'QBCore' then
      local xPlayer = Core.Functions.GetPlayer(source)
      local data = {
        firstname = xPlayer.PlayerData.charinfo.firstname,
        lastname  = xPlayer.PlayerData.charinfo.lastname,
      }
      print(json.encode(data,{indent=true}))
      return data
    end
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
  if eventData.secondsRemaining == 60 then
      CreateThread(function()
          Wait(45000)
          ExecuteCommand('saveinv')
      end)
  end
end)

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() == resourceName) then
      ExecuteCommand('saveinv')
  end
end)