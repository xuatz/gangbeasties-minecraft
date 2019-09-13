docker stop minecraft_server || true;
docker rm minecraft_server || true;
docker run -d \
  --restart=always \
  --name=minecraft_server \
  -p 0.0.0.0:25565:25565 \
  -e EULA=TRUE \
  -e VERSION=1.14.4 \
  -e TYPE=FORGE \
  -e ONLINE_MODE=FALSE \
  -e OVERRIDE_SERVER_PROPERTIES=true \
  -e ALLOW_NETHER=true \
  -e ANNOUNCE_PLAYER_ACHIEVEMENTS=true \
  -e ENABLE_COMMAND_BLOCK=true \
  -e GENERATE_STRUCTURES=true \
  -e SNOOPER_ENABLED=false \
  -e ENABLE_RCON=true \
  -e RCON_PASSWORD= \
  -e RCON_PORT= \
  -v /path/to:/data \
  itzg/minecraft-server:20190824

docker stop mc_rcon || true;
docker rm mc_rcon || true;
docker run -d \
  --restart=always \
  --name=mc_rcon \
  -p 4326:4326 -p 4327:4327 \
  -v /path/to:/opt/rcon-web-admin/db \
  itzg/rcon
