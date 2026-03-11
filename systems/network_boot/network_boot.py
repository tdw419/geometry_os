# systems/network_boot/network_boot.py
"""
NetworkBoot - Orchestrator for distributed Geometry OS.

Coordinates MeshBroadcaster, PeerRegistry, and TectonicSync
to create a unified distributed tectonic map.
"""

import asyncio
import logging
import uuid

from .mesh_broadcaster import MeshBroadcaster
from .peer_registry import PeerRegistry
from .tectonic_sync import TectonicSync

logger = logging.getLogger("network_boot.orchestrator")


class NetworkBoot:
    """
    Orchestrator for distributed Geometry OS.

    Usage:
        nb = NetworkBoot()
        nb.connect_gravity_engine(gravity)
        await nb.start()

        # Node will now:
        # 1. Broadcast presence on UDP:7331
        # 2. Accept peer connections on TCP:8080
        # 3. Sync orb positions and ripples with peers
    """

    def __init__(
        self,
        node_id: str = None,
        hostname: str = None,
        bounds: tuple[int, int, int, int] = (0, 0, 4096, 4096)
    ):
        self.node_id = node_id or str(uuid.uuid4())[:8]
        self.hostname = hostname or "geometry-os"
        self.bounds = bounds
        self.running = False

        # Components
        self.registry = PeerRegistry()
        self.broadcaster = MeshBroadcaster(
            node_id=self.node_id,
            hostname=self.hostname,
            bounds=self.bounds
        )
        self.sync = TectonicSync(node_id=self.node_id)
        self.sync.peers = self.registry.peers

        # Connected systems
        self.gravity_engine = None

        # Tasks
        self._beacon_task = None
        self._listen_task = None
        self._cleanup_task = None

    async def start(self) -> None:
        """Start all network services."""
        await self.broadcaster.start()
        await self.sync.start_server()

        self.running = True

        # Start background tasks
        self._beacon_task = asyncio.create_task(self._beacon_loop())
        self._listen_task = asyncio.create_task(self._listen_loop())
        self._cleanup_task = asyncio.create_task(self._cleanup_loop())

        logger.info(f"NetworkBoot started: {self.node_id}")

    def stop(self) -> None:
        """Stop all network services."""
        self.running = False

        for task in [self._beacon_task, self._listen_task, self._cleanup_task]:
            if task:
                task.cancel()

        self.broadcaster.stop()
        self.sync.stop()

        logger.info("NetworkBoot stopped")

    def connect_gravity_engine(self, gravity_engine) -> None:
        """Connect GravityEngine for tectonic sync."""
        self.gravity_engine = gravity_engine

        # Set up callbacks for incoming messages
        async def handle_orb_update(node_id, path, pos):
            logger.debug(f"Remote orb update: {path} from {node_id}")
            # Add remote orb to local gravity engine
            remote_path = f"remote://{node_id}/{path}"
            if remote_path not in gravity_engine.orbs:
                gravity_engine.add_orb(
                    remote_path, pos[0], pos[1], 0, 10, 0
                )

        async def handle_ripple(node_id, epicenter, energy, event_type):
            logger.debug(f"Remote ripple from {node_id}: {event_type}")
            # Emit ripple in local gravity engine
            if hasattr(gravity_engine, 'emit_ripple'):
                gravity_engine.emit_ripple(epicenter, energy, event_type)

        self.sync.on_orb_update = handle_orb_update
        self.sync.on_ripple = handle_ripple

    async def _beacon_loop(self) -> None:
        """Periodically broadcast presence."""
        while self.running:
            try:
                orb_count = len(self.gravity_engine.orbs) if self.gravity_engine else 0
                await self.broadcaster.broadcast_beacon(orb_count)
                await asyncio.sleep(MeshBroadcaster.BEACON_INTERVAL)
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Beacon error: {e}")
                await asyncio.sleep(1)

    async def _listen_loop(self) -> None:
        """Listen for peer beacons."""
        while self.running:
            try:
                beacon = await self.broadcaster.receive_beacon(timeout=2.0)
                if beacon:
                    self.registry.update_from_beacon(beacon)
                    logger.info(f"Discovered peer: {beacon.node_id}")
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Listen error: {e}")
                await asyncio.sleep(1)

    async def _cleanup_loop(self) -> None:
        """Periodically remove stale peers."""
        while self.running:
            try:
                await asyncio.sleep(10)
                removed = self.registry.remove_stale()
                for node_id in removed:
                    logger.info(f"Peer timed out: {node_id}")
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Cleanup error: {e}")

    def get_status(self) -> dict:
        """Get current network status."""
        return {
            "node_id": self.node_id,
            "hostname": self.hostname,
            "running": self.running,
            "peer_count": self.registry.get_peer_count(),
            "active_peers": len(self.registry.get_active_peers()),
        }
