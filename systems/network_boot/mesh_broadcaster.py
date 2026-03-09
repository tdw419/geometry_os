"""
MeshBroadcaster - UDP peer discovery for Geometry OS mesh.

Broadcasts node presence on port 7331 and listens for peer beacons.
"""

import socket
import json
import asyncio
import logging
from typing import Tuple, Optional
from dataclasses import dataclass

from .peer_registry import NodeBeacon

logger = logging.getLogger("network_boot.broadcaster")


class MeshBroadcaster:
    """
    UDP peer discovery on port 7331.

    Broadcasts HELLO beacons every 5 seconds and listens for
    beacons from other nodes on the network.
    """

    DEFAULT_PORT = 7331
    BEACON_INTERVAL = 5.0  # seconds

    def __init__(
        self,
        node_id: str,
        hostname: str,
        bounds: Tuple[int, int, int, int],
        port: int = None
    ):
        self.node_id = node_id
        self.hostname = hostname
        self.bounds = bounds
        self.port = port or self.DEFAULT_PORT

        self.sock: Optional[socket.socket] = None
        self.running = False
        self._beacon_task: Optional[asyncio.Task] = None

    async def start(self) -> None:
        """Bind UDP socket and start beacon loop."""
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        self.sock.bind(("0.0.0.0", self.port))
        self.sock.setblocking(False)
        self.running = True

        logger.info(f"MeshBroadcaster started on port {self.port}")

    async def broadcast_beacon(self, orb_count: int) -> None:
        """Send HELLO beacon to network broadcast address."""
        if not self.sock:
            raise RuntimeError("Broadcaster not started")

        beacon = {
            "type": "HELLO",
            "node_id": self.node_id,
            "hostname": self.hostname,
            "bounds": list(self.bounds),
            "orb_count": orb_count,
            "timestamp": asyncio.get_event_loop().time(),
        }

        message = json.dumps(beacon).encode()
        self.sock.sendto(message, ("<broadcast>", self.port))

        logger.debug(f"Sent beacon: {self.node_id} with {orb_count} orbs")

    async def receive_beacon(self, timeout: float = 1.0) -> Optional[NodeBeacon]:
        """
        Receive a beacon from another node.

        Args:
            timeout: Max seconds to wait

        Returns:
            NodeBeacon if received, None on timeout
        """
        if not self.sock:
            raise RuntimeError("Broadcaster not started")

        try:
            data, addr = await asyncio.wait_for(
                self._receive_loop(),
                timeout=timeout
            )
            beacon_data = json.loads(data.decode())

            if beacon_data.get("node_id") == self.node_id:
                # Ignore our own beacons
                return None

            return NodeBeacon.from_dict(beacon_data)

        except asyncio.TimeoutError:
            return None
        except json.JSONDecodeError as e:
            logger.warning(f"Invalid beacon from {addr}: {e}")
            return None

    async def _receive_loop(self):
        """Internal async receive."""
        loop = asyncio.get_event_loop()
        data, addr = await loop.sock_recvfrom(self.sock, 4096)
        return data, addr

    def stop(self) -> None:
        """Close socket and stop broadcasting."""
        self.running = False
        if self._beacon_task:
            self._beacon_task.cancel()
        if self.sock:
            self.sock.close()
            self.sock = None

        logger.info("MeshBroadcaster stopped")
