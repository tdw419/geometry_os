"""
Evolution Daemon - Radio Controller

GOSR Radio - Narrative Broadcasting System.

When enabled, the daemon:
- Creates a NarrativeBroadcaster instance
- Broadcasts narrative segments based on OS telemetry
- Uses station-specific personalities
- Optionally uses LM Studio for AI-generated narratives
"""

import asyncio
import logging
from datetime import datetime
from typing import TYPE_CHECKING, Any, Optional

if TYPE_CHECKING:
    from .webmcp_client import WebMCPClient

logger = logging.getLogger("evolution_daemon.radio")

# GOSR Radio - Narrative Broadcaster
try:
    from systems.evolution_daemon.narrative_broadcaster import (
        BroadcastSegment,
        NarrativeBroadcaster,
    )
    HAS_RADIO = True
except ImportError:
    HAS_RADIO = False
    NarrativeBroadcaster = None
    BroadcastSegment = None


# Station definitions with personalities
STATION_PERSONALITIES = {
    "87.6": "Substrate Jazz - Smooth, contemplative narratives",
    "92.3": "Debug Metal - Intense, technical breakdowns",
    "95.1": "Silicon Noir - Mysterious, investigative style",
    "99.9": "Neutral Chronicler - Objective, factual reporting"
}


class RadioController:
    """
    Controller for GOSR Radio Broadcasting.

    Manages narrative broadcasting based on system telemetry.

    Attributes:
        enabled: Whether radio is currently active
        station_id: Current station identifier (FM frequency)
        broadcaster: NarrativeBroadcaster instance
    """

    DEFAULT_INTERVAL = 30.0  # seconds between broadcasts

    def __init__(
        self,
        station_id: str = "87.6",
        use_llm: bool = False,
        llm_config: dict[str, Any] | None = None
    ):
        """
        Initialize the radio controller.

        Args:
            station_id: Radio station identifier (FM frequency)
                       "87.6" = Substrate Jazz (default)
                       "92.3" = Debug Metal
                       "95.1" = Silicon Noir
                       "99.9" = Neutral Chronicler
            use_llm: Whether to use LM Studio for AI narratives
            llm_config: Optional LLM configuration dict
        """
        self.enabled = False
        self.station_id = station_id
        self.broadcaster: NarrativeBroadcaster | None = None
        self._broadcast_task: asyncio.Task | None = None
        self._use_llm = use_llm
        self._llm_config = llm_config

    def enable(self) -> bool:
        """
        Enable GOSR Radio Broadcasting.

        Returns:
            True if enabled successfully, False if NarrativeBroadcaster not available
        """
        if not HAS_RADIO:
            logger.warning("NarrativeBroadcaster not available - radio disabled")
            return False

        self.enabled = True

        # Create broadcaster instance
        self.broadcaster = NarrativeBroadcaster(
            enabled=True,
            station_id=self.station_id,
            broadcast_interval=self.DEFAULT_INTERVAL,
            use_llm=self._use_llm,
            llm_config=self._llm_config
        )

        llm_status = " (LLM enabled)" if self._use_llm else ""
        logger.info(f"📻 GOSR Radio enabled: Station {self.station_id} FM{llm_status}")
        return True

    def disable(self) -> None:
        """Disable GOSR Radio Broadcasting."""
        self.enabled = False
        if self._broadcast_task:
            self._broadcast_task.cancel()
            self._broadcast_task = None
        logger.info("📻 GOSR Radio disabled")

    def set_station(self, station_id: str) -> bool:
        """
        Switch radio station at runtime.

        Args:
            station_id: New station identifier (FM frequency)

        Returns:
            True if station changed, False if radio not enabled
        """
        if not self.enabled or not self.broadcaster:
            logger.warning("Radio not enabled - cannot change station")
            return False

        self.station_id = station_id
        self.broadcaster.set_station(station_id)
        logger.info(f"📻 Switched to station: {station_id} FM")
        return True

    def get_station_info(self) -> dict[str, str]:
        """
        Get information about the current station.

        Returns:
            Dict with station_id and description
        """
        return {
            "station_id": self.station_id,
            "description": STATION_PERSONALITIES.get(
                self.station_id, "Unknown station"
            )
        }

    async def gather_telemetry(
        self,
        webmcp: Optional['WebMCPClient'] = None,
        visual_connected: bool = False,
        evolution_count: int = 0
    ) -> dict[str, Any]:
        """
        Gather system telemetry for radio broadcast generation.

        Args:
            webmcp: WebMCPClient instance
            visual_connected: Whether visual interface is connected
            evolution_count: Current evolution count

        Returns:
            Dict with telemetry values: entropy, fps, evolution_count, etc.
        """
        telemetry = {
            "entropy": 0.5,
            "fps": 60,
            "evolution_count": evolution_count,
            "visual_connected": visual_connected,
            "timestamp": datetime.now().isoformat()
        }

        # Try to get real FPS from visual state
        if visual_connected and webmcp:
            try:
                state = await webmcp.get_os_state()
                if state:
                    telemetry["fps"] = state.get("fps", 60)
                    telemetry["map_tiles"] = state.get("tile_count", 0)
            except Exception:
                pass

        # Calculate entropy from recent activity
        if evolution_count > 0:
            telemetry["entropy"] = min(1.0, evolution_count / 10.0)

        return telemetry

    async def broadcast_segment(
        self,
        telemetry: dict[str, Any],
        webmcp: Optional['WebMCPClient'] = None,
        visual_connected: bool = False
    ) -> Optional['BroadcastSegment']:
        """
        Generate and broadcast a radio segment.

        Args:
            telemetry: System telemetry for segment generation
            webmcp: WebMCPClient instance for HUD display
            visual_connected: Whether visual interface is connected

        Returns:
            The generated BroadcastSegment, or None if broadcasting failed
        """
        if not self.enabled or not self.broadcaster:
            return None

        try:
            segment = self.broadcaster.broadcast(telemetry)

            if segment:
                # Broadcast to visual bridge for HUD display
                if visual_connected and webmcp:
                    await webmcp.broadcast_event(
                        'radio_broadcast',
                        segment.to_dict()
                    )

                logger.info(
                    f"📻 [{segment.station_id}] {segment.segment_type}: "
                    f"{segment.content[:60]}..."
                )

            return segment

        except Exception as e:
            logger.warning(f"Radio broadcast error: {e}")
            return None

    @property
    def broadcast_interval(self) -> float:
        """Get the current broadcast interval in seconds."""
        if self.broadcaster:
            return self.broadcaster.broadcast_interval
        return self.DEFAULT_INTERVAL
