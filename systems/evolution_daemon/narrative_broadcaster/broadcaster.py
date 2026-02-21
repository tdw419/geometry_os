"""
NarrativeBroadcaster - GOSR Radio Main Orchestrator

Coordinates all radio components to generate diverse, non-repeating
narrative content from OS telemetry.

Design Pattern: Follows SemanticPublisher patterns for rate limiting
and Visual Bridge integration.
"""

import logging
import time
from dataclasses import dataclass, field
from typing import Optional, Dict, Any, List

logger = logging.getLogger(__name__)


@dataclass
class BroadcastSegment:
    """
    A single broadcast segment with content and metadata.

    Attributes:
        segment_type: Type of segment (NEWS, WEATHER, PHILOSOPHY, etc.)
        content: The narrative text content
        entropy: Entropy score (0.0-1.0) that influenced selection
        station_id: Radio station identifier (e.g., "87.6")
        timestamp: Unix timestamp of broadcast
    """
    segment_type: str
    content: str
    entropy: float
    station_id: str = "87.6"  # Default to Substrate Jazz
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> Dict[str, Any]:
        """Serialize segment for WebSocket transmission."""
        return {
            "segment_type": self.segment_type,
            "content": self.content,
            "entropy": self.entropy,
            "station_id": self.station_id,
            "timestamp": self.timestamp
        }


class NarrativeBroadcaster:
    """
    Main orchestrator for GOSR Radio broadcasting.

    Coordinates:
    - SegmentPool for content generation
    - TopicMemory for deduplication
    - PersonalityEngine for station voices

    Features:
    - Enable/disable radio broadcasting
    - Runtime station switching
    - Statistics tracking
    - Visual Bridge integration

    Usage:
        broadcaster = NarrativeBroadcaster(station_id="87.6")
        broadcaster.enable()
        segment = broadcaster.broadcast(telemetry_data)
    """

    def __init__(
        self,
        enabled: bool = True,
        station_id: str = "87.6",
        broadcast_interval: float = 30.0
    ):
        """
        Initialize the narrative broadcaster.

        Args:
            enabled: Whether broadcasting is active
            station_id: Radio station identifier (FM frequency)
            broadcast_interval: Seconds between broadcasts
        """
        self.enabled = enabled
        self.station_id = station_id
        self.broadcast_interval = broadcast_interval

        # Statistics
        self._total_broadcasts = 0
        self._last_broadcast_time = 0.0
        self._broadcast_history: List[BroadcastSegment] = []

        # Placeholder for components (will be added in later tasks)
        self._segment_pool = None
        self._topic_memory = None
        self._personality_engine = None

        logger.info(f"NarrativeBroadcaster initialized: station={station_id}, enabled={enabled}")

    def enable(self) -> None:
        """Enable broadcasting."""
        self.enabled = True
        logger.info("NarrativeBroadcaster enabled")

    def disable(self) -> None:
        """Disable broadcasting."""
        self.enabled = False
        logger.info("NarrativeBroadcaster disabled")

    def set_station(self, station_id: str) -> None:
        """
        Switch to a different radio station.

        Args:
            station_id: Station identifier (FM frequency)
        """
        self.station_id = station_id
        logger.info(f"Switched to station: {station_id}")

    def get_station_info(self) -> Dict[str, Any]:
        """
        Get current station information.

        Returns:
            Dict with station metadata
        """
        return {
            "station_id": self.station_id,
            "enabled": self.enabled,
            "broadcast_interval": self.broadcast_interval
        }

    def get_stats(self) -> Dict[str, Any]:
        """
        Get broadcast statistics.

        Returns:
            Dict with stats like total_broadcasts, station_id
        """
        return {
            "total_broadcasts": self._total_broadcasts,
            "station_id": self.station_id,
            "enabled": self.enabled,
            "last_broadcast_time": self._last_broadcast_time
        }

    def _record_broadcast(self, segment: BroadcastSegment) -> None:
        """Record a broadcast for statistics and history."""
        self._total_broadcasts += 1
        self._last_broadcast_time = segment.timestamp
        self._broadcast_history.append(segment)

        # Keep only last 100 broadcasts
        if len(self._broadcast_history) > 100:
            self._broadcast_history = self._broadcast_history[-100:]
