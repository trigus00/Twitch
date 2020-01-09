-- Delete Table if exists 
drop table if exists stream;
-- Create Stream Table 
create table stream (
	time timestamp,
	device_id text,
	login text,
	channel text,
	country text,
	player text, 
	game text,
	stream_format text,
	subscriber text
)
-- Delete chat table if exsits 
drop table if exists chat;
-- Create Chat Table 
create table chat (
	time timestamp,
	device_id text,
	login text,
	channel text,
	country text,
	player text, 
	game text
	
)
-- -----------------------------------------------------------
-- looking at my tables 
SELECT *
FROM chat
LIMIT 20;

SELECT *
FROM stream
LIMIT 20;

-- Distinct function for table 
-- Unique in each table 
SELECT DISTINCT game
FROM stream;

SELECT DISTINCT channel 
from stream 

-- Aggergate Functions 
--What are the most popular games in the stream table? 
SELECT game, count(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;

-- Where are these LoL stream viewers located?

SELECT country, count(*) 
FROM  stream 
where game = 'League of Legends'
group by country
order by count DESC; 

-- Create a list of players and their number of streamers.

SELECT player, count(*)
FROM stream 
group by player  
order by count(*) DESC ; 

-- Group the games into their genres
SELECT game,
case
  WHEN game = 'Dota 2'
      THEN 'MOBA'
  WHEN game = 'League of Legends' 
      THEN 'MOBA'
  WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
  ELSE 'Other'
  END AS "genre",
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;

-- The view count for each hour
SELECT time
FROM stream
LIMIT 10;
-- 
SELECT extract(hour from time),COUNT(*)
FROM stream
GROUP BY 1
order by 1 ;
-- Joining  tables  

SELECT *
FROM stream
JOIN chat
  ON stream.device_id = chat.device_id;
  







