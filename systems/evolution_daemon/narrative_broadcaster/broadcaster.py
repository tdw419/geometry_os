"""
NarrativeBroadcaster - GOSR Radio Main Orchestrator

Coordinates all radio components to generate diverse, non-repeating
narrative content from OS telemetry.

Design Pattern: Follows SemanticPublisher patterns for rate limiting
and Visual Bridge integration.

Broadcast Flow:
1. Select segment type based on entropy (SegmentPool)
2. Generate content from telemetry (SegmentPool)
3. Check for duplicates (TopicMemory)
4. Retry with alternate segment type if duplicate
5. Transform with station personality (PersonalityEngine)
6. Record broadcast for statistics
"""

import logging
import time
from dataclasses import dataclass, field
from typing import Optional, Dict, Any, List

from .segment_pool import SegmentPool, SegmentType
from .topic_memory import TopicMemory
from .personality_engine import PersonalityEngine
from .llm_client import LLMNarrativeClient, LLMConfig
from .wordpress_publisher import WordPressPublisher, WordPressConfig

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
        broadcast_interval: float = 30.0,
        max_duplicate_retries: int = 3,
        use_llm: bool = False,
        llm_config: Optional[LLMConfig] = None,
        publish_to_wordpress: bool = False,
        wordpress_config: Optional[WordPressConfig] = None
    ):
        """
        Initialize the narrative broadcaster.

        Args:
            enabled: Whether broadcasting is active
            station_id: Radio station identifier (FM frequency)
            broadcast_interval: Seconds between broadcasts
            max_duplicate_retries: Max retries when duplicate detected
            use_llm: Whether to use LLM for narrative generation
            llm_config: Optional LLM configuration (uses defaults if not provided)
            publish_to_wordpress: Whether to publish broadcasts to WordPress
            wordpress_config: Optional WordPress configuration
        """
        self.enabled = enabled
        self.station_id = station_id
        self.broadcast_interval = broadcast_interval
        self.max_duplicate_retries = max_duplicate_retries

        # Statistics
        self._total_broadcasts = 0
        self._last_broadcast_time = 0.0
        self._broadcast_history: List[BroadcastSegment] = []

        # Initialize LLM client if requested
        llm_client: Optional[LLMNarrativeClient] = None
        self._llm_generated = False
        if use_llm:
            llm_client = LLMNarrativeClient(config=llm_config)
            llm_available = llm_client.is_available()
            logger.info(f"LLM narrative client initialized: available={llm_available}")
        else:
            logger.info("LLM narrative client disabled (use_llm=False)")

        # Initialize WordPress publisher if requested
        self._wordpress_publisher: Optional[WordPressPublisher] = None
        if publish_to_wordpress:
            self._wordpress_publisher = WordPressPublisher(config=wordpress_config)
            wp_available = self._wordpress_publisher.is_available()
            logger.info(f"WordPress publisher initialized: available={wp_available}")
        else:
            logger.debug("WordPress publishing disabled")

        # Initialize components
        self._segment_pool = SegmentPool(llm_client=llm_client)
        self._topic_memory = TopicMemory()
        self._personality_engine = PersonalityEngine()

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

    def broadcast(self, telemetry: Dict[str, Any]) -> Optional[BroadcastSegment]:
        """
        Generate and return a broadcast segment.

        Flow:
        1. Check if enabled
        2. Select segment type based on entropy
        3. Generate content from telemetry
        4. Check for duplicates (retry with alternate type if needed)
        5. Transform with station personality
        6. Record and return segment

        Args:
            telemetry: System telemetry dict with fps, entropy, etc.

        Returns:
            BroadcastSegment if successful, None if disabled or exhausted
        """
        if not self.enabled:
            logger.debug("Broadcast skipped: radio disabled")
            return None

        # Get entropy from telemetry (default 0.5)
        entropy = telemetry.get("entropy", 0.5)

        # Get station name for content generation
        station = self._personality_engine.get_station(self.station_id)
        station_name = station.name if station else "Unknown Station"

        # Track attempted types to avoid repeating
        attempted_types: List[SegmentType] = []
        content: Optional[str] = None
        selected_type: Optional[SegmentType] = None

        # Try to generate unique content (with retries for dedup)
        for attempt in range(self.max_duplicate_retries):
            # Select segment type (avoid recently used if retrying)
            if attempted_types:
                # Force a different type on retry
                available_types = [
                    t for t in SegmentType if t not in attempted_types
                ]
                if available_types:
                    import random
                    selected_type = random.choice(available_types)
                else:
                    # All types exhausted, use any
                    selected_type = self._segment_pool.select_segment(entropy)
            else:
                selected_type = self._segment_pool.select_segment(entropy)

            attempted_types.append(selected_type)

            # Generate content
            raw_content = self._segment_pool.generate_content(
                segment_type=selected_type,
                telemetry=telemetry,
                station_name=station_name
            )

            # Check for duplicate
            if not self._topic_memory.is_duplicate(raw_content):
                content = raw_content
                break

            logger.debug(
                f"Duplicate detected on attempt {attempt + 1}, "
                f"retrying with different type"
            )

        # If all retries failed due to duplicates, use last generated content
        # but inject some variation via entropy adjustment
        if content is None and raw_content:
            # Accept the duplicate but add it to memory for future checks
            content = raw_content
            logger.warning(
                f"Max duplicate retries ({self.max_duplicate_retries}) reached, "
                "accepting last content"
            )

        if content is None:
            logger.error("Failed to generate broadcast content")
            return None

        # Add to topic memory for future dedup
        self._topic_memory.add_topic(content)

        # Apply station personality transformation
        transformed_content = self._personality_engine.apply_personality(
            content=content,
            station_id=self.station_id,
            entropy=entropy
        )

        # Create segment
        segment = BroadcastSegment(
            segment_type=selected_type.value if selected_type else "unknown",
            content=transformed_content,
            entropy=entropy,
            station_id=self.station_id,
            timestamp=time.time()
        )

        # Record for statistics
        self._record_broadcast(segment)

        logger.info(
            f"Broadcast: [{self.station_id}] {selected_type.value if selected_type else 'unknown'} - "
            f"{transformed_content[:50]}..."
        )

        # Publish to WordPress if configured
        if self._wordpress_publisher:
            self._wordpress_publisher.publish(
                station_id=self.station_id,
                segment_type=segment.segment_type,
                content=transformed_content,
                entropy=entropy,
                telemetry=telemetry,
                llm_generated=self._segment_pool._llm_client is not None
            )

        return segment
