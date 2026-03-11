"""
PeerRegistry - Tracks known nodes in the Geometry OS mesh.

Maintains state about discovered peers, their tectonic bounds,
and connection status.
"""

import time
from dataclasses import dataclass, field
from typing import Any


@dataclass
class NodeBeacon:
    """UDP announcement payload from a peer node."""
    node_id: str
    hostname: str
    bounds: tuple[int, int, int, int]  # (x, y, width, height)
    orb_count: int
    timestamp: float

    def to_dict(self) -> dict[str, Any]:
        """Serialize to JSON-compatible dict."""
        return {
            "node_id": self.node_id,
            "hostname": self.hostname,
            "bounds": list(self.bounds),
            "orb_count": self.orb_count,
            "timestamp": self.timestamp,
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "NodeBeacon":
        """Deserialize from dict."""
        return cls(
            node_id=data["node_id"],
            hostname=data["hostname"],
            bounds=tuple(data["bounds"]),
            orb_count=data["orb_count"],
            timestamp=data["timestamp"],
        )


@dataclass
class Peer:
    """A known remote node."""
    beacon: NodeBeacon
    websocket: Any | None = None  # websockets.WebSocketClientProtocol
    last_heartbeat: float = field(default_factory=time.time)
    sync_active: bool = False

    def is_stale(self, timeout: float = 30.0) -> bool:
        """Check if peer has timed out."""
        return time.time() - self.last_heartbeat > timeout


class PeerRegistry:
    """
    Tracks known peers and their state.

    Peers are discovered via UDP beacon and maintained via heartbeat.
    Stale peers (no heartbeat for 30s) are automatically removed.
    """

    PEER_TIMEOUT = 30.0  # seconds

    def __init__(self):
        self.peers: dict[str, Peer] = {}

    def update_from_beacon(self, beacon: NodeBeacon) -> None:
        """Add or update peer from received beacon."""
        if beacon.node_id in self.peers:
            # Update existing peer
            self.peers[beacon.node_id].beacon = beacon
            self.peers[beacon.node_id].last_heartbeat = time.time()
        else:
            # Add new peer
            self.peers[beacon.node_id] = Peer(beacon=beacon)

    def remove_stale(self) -> list[str]:
        """Remove peers with no heartbeat for PEER_TIMEOUT seconds."""
        stale_ids = []
        for node_id, peer in list(self.peers.items()):
            if peer.is_stale(self.PEER_TIMEOUT):
                stale_ids.append(node_id)
                del self.peers[node_id]
        return stale_ids

    def get_active_peers(self) -> list[Peer]:
        """Return peers with active WebSocket connections."""
        return [p for p in self.peers.values() if p.sync_active]

    def get_peer_count(self) -> int:
        """Return total number of known peers."""
        return len(self.peers)

    def get_peer(self, node_id: str) -> Peer | None:
        """Get peer by node_id."""
        return self.peers.get(node_id)
