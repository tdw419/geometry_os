# systems/network_boot/tectonic_sync.py
"""
TectonicSync - WebSocket-based tectonic state synchronization.

Streams orb positions and ripple events between connected peers.
"""

import asyncio
import json
import logging
from typing import Dict, Optional, Tuple, Any, Callable

logger = logging.getLogger("network_boot.sync")


class SyncMessage:
    """Factory for sync protocol messages."""

    @staticmethod
    def orb_update(node_id: str, path: str, pos: Tuple[float, float]) -> Dict:
        """Create an ORB_UPDATE message."""
        return {
            "type": "ORB_UPDATE",
            "node_id": node_id,
            "path": path,
            "pos": list(pos),
        }

    @staticmethod
    def ripple(
        node_id: str,
        epicenter: Tuple[float, float],
        energy: float,
        event_type: str
    ) -> Dict:
        """Create a RIPPLE message."""
        return {
            "type": "RIPPLE",
            "node_id": node_id,
            "epicenter": list(epicenter),
            "energy": energy,
            "event": event_type,
        }

    @staticmethod
    def heartbeat(node_id: str, orb_count: int) -> Dict:
        """Create a HEARTBEAT message."""
        return {
            "type": "HEARTBEAT",
            "node_id": node_id,
            "orb_count": orb_count,
        }


class TectonicSync:
    """
    WebSocket-based tectonic state synchronization.

    Listens on port 8080 for peer connections and streams
    orb positions and ripple events.
    """

    DEFAULT_PORT = 8080

    def __init__(self, node_id: str, port: int = None):
        self.node_id = node_id
        self.port = port or self.DEFAULT_PORT
        self.running = False

        # Connected peers (injected from PeerRegistry)
        self.peers: Dict[str, Any] = {}

        # Callbacks for incoming messages
        self.on_orb_update: Optional[Callable] = None
        self.on_ripple: Optional[Callable] = None

        # Server
        self._server = None

    def encode_message(self, msg: Dict) -> str:
        """Encode message for wire transmission."""
        return json.dumps(msg)

    def decode_message(self, data: str) -> Dict[str, Any]:
        """Decode message from wire."""
        return json.loads(data)

    async def start_server(self) -> None:
        """Start WebSocket server for incoming connections."""
        try:
            import websockets
        except ImportError:
            logger.warning("websockets not installed, using mock")
            self.running = True
            return

        self._server = await websockets.serve(
            self._handle_connection,
            "0.0.0.0",
            self.port
        )
        self.running = True
        logger.info(f"TectonicSync server started on port {self.port}")

    async def _handle_connection(self, websocket, path):
        """Handle incoming WebSocket connection."""
        remote_addr = websocket.remote_address
        logger.info(f"Peer connected from {remote_addr}")

        try:
            async for message in websocket:
                msg = self.decode_message(message)
                await self.handle_message(msg)
        except Exception as e:
            logger.error(f"Connection error: {e}")

    async def handle_message(self, msg: Dict) -> None:
        """Route incoming message to appropriate handler."""
        msg_type = msg.get("type")

        if msg_type == "ORB_UPDATE":
            if self.on_orb_update:
                await self.on_orb_update(
                    node_id=msg["node_id"],
                    path=msg["path"],
                    pos=tuple(msg["pos"])
                )

        elif msg_type == "RIPPLE":
            if self.on_ripple:
                await self.on_ripple(
                    node_id=msg["node_id"],
                    epicenter=tuple(msg["epicenter"]),
                    energy=msg["energy"],
                    event_type=msg["event"]
                )

        elif msg_type == "HEARTBEAT":
            logger.debug(f"Heartbeat from {msg['node_id']}: {msg['orb_count']} orbs")

    async def broadcast_to_peers(self, msg: Dict) -> None:
        """Send message to all connected peers."""
        encoded = self.encode_message(msg)

        for peer_id, peer in self.peers.items():
            if peer.sync_active and peer.websocket:
                try:
                    await peer.websocket.send(encoded)
                except Exception as e:
                    logger.warning(f"Failed to send to {peer_id}: {e}")

    async def send_orb_update(self, path: str, pos: Tuple[float, float]) -> None:
        """Broadcast orb position update."""
        msg = SyncMessage.orb_update(self.node_id, path, pos)
        await self.broadcast_to_peers(msg)

    async def send_ripple(
        self,
        epicenter: Tuple[float, float],
        energy: float,
        event_type: str
    ) -> None:
        """Broadcast ripple event."""
        msg = SyncMessage.ripple(self.node_id, epicenter, energy, event_type)
        await self.broadcast_to_peers(msg)

    async def send_heartbeat(self, orb_count: int) -> None:
        """Broadcast heartbeat."""
        msg = SyncMessage.heartbeat(self.node_id, orb_count)
        await self.broadcast_to_peers(msg)

    def stop(self) -> None:
        """Stop the sync server."""
        self.running = False
        if self._server:
            self._server.close()
        logger.info("TectonicSync stopped")
