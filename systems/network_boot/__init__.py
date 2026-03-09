"""
Network Boot Substrate - distributed tectonic sync for Geometry OS.

This module provides mesh node discovery and tracking for
distributed state synchronization.
"""

from .peer_registry import NodeBeacon, Peer, PeerRegistry
from .tectonic_sync import TectonicSync, SyncMessage

__all__ = ["NodeBeacon", "Peer", "PeerRegistry", "TectonicSync", "SyncMessage"]
