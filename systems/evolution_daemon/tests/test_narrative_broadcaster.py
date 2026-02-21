"""
Tests for Narrative Broadcaster - GOSR Radio

Tests for the Geometry OS Radio system components:
- NarrativeBroadcaster: Main orchestrator
- BroadcastSegment: Content data structure
"""

import pytest
import sys
from pathlib import Path
from unittest.mock import patch, MagicMock
from datetime import datetime

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from evolution_daemon.narrative_broadcaster import (
    NarrativeBroadcaster, BroadcastSegment
)


class TestBroadcastSegment:
    """Tests for BroadcastSegment dataclass."""

    def test_segment_creation(self):
        """BroadcastSegment should store all fields."""
        segment = BroadcastSegment(
            segment_type="NEWS",
            content="Test content",
            entropy=0.75,
            station_id="87.6",
            timestamp=1234567890.0
        )

        assert segment.segment_type == "NEWS"
        assert segment.content == "Test content"
        assert segment.entropy == 0.75
        assert segment.station_id == "87.6"
        assert segment.timestamp == 1234567890.0

    def test_segment_defaults(self):
        """BroadcastSegment should have sensible defaults."""
        segment = BroadcastSegment(
            segment_type="WEATHER",
            content="Clear skies",
            entropy=0.5
        )

        assert segment.station_id == "87.6"  # Default station
        assert segment.timestamp > 0  # Auto-generated

    def test_segment_to_dict(self):
        """BroadcastSegment should serialize to dict."""
        segment = BroadcastSegment(
            segment_type="PHILOSOPHY",
            content="Deep thought",
            entropy=0.3,
            station_id="95.1",
            timestamp=1234567890.0
        )

        data = segment.to_dict()

        assert data["segment_type"] == "PHILOSOPHY"
        assert data["content"] == "Deep thought"
        assert data["entropy"] == 0.3
        assert data["station_id"] == "95.1"
        assert data["timestamp"] == 1234567890.0


class TestNarrativeBroadcaster:
    """Tests for NarrativeBroadcaster class."""

    def test_broadcaster_initialization(self):
        """NarrativeBroadcaster should initialize with defaults."""
        broadcaster = NarrativeBroadcaster()

        assert broadcaster.enabled is True
        assert broadcaster.station_id == "87.6"
        assert broadcaster.broadcast_interval == 30.0

    def test_broadcaster_custom_config(self):
        """NarrativeBroadcaster should accept custom config."""
        broadcaster = NarrativeBroadcaster(
            enabled=False,
            station_id="92.3",
            broadcast_interval=60.0
        )

        assert broadcaster.enabled is False
        assert broadcaster.station_id == "92.3"
        assert broadcaster.broadcast_interval == 60.0

    def test_enable_disable(self):
        """NarrativeBroadcaster should support enable/disable."""
        broadcaster = NarrativeBroadcaster(enabled=False)

        assert broadcaster.enabled is False

        broadcaster.enable()
        assert broadcaster.enabled is True

        broadcaster.disable()
        assert broadcaster.enabled is False

    def test_set_station(self):
        """NarrativeBroadcaster should allow station switching."""
        broadcaster = NarrativeBroadcaster()

        broadcaster.set_station("95.1")
        assert broadcaster.station_id == "95.1"

        broadcaster.set_station("99.9")
        assert broadcaster.station_id == "99.9"

    def test_get_station_info(self):
        """NarrativeBroadcaster should return station info."""
        broadcaster = NarrativeBroadcaster(station_id="87.6")

        info = broadcaster.get_station_info()

        assert "station_id" in info
        assert info["station_id"] == "87.6"

    def test_stats_tracking(self):
        """NarrativeBroadcaster should track broadcast statistics."""
        broadcaster = NarrativeBroadcaster()

        stats = broadcaster.get_stats()

        assert "total_broadcasts" in stats
        assert stats["total_broadcasts"] == 0
        assert "station_id" in stats


class TestNarrativeBroadcasterIntegration:
    """Integration tests - will expand as components are added."""

    def test_module_import_works(self):
        """Module should be importable."""
        from evolution_daemon.narrative_broadcaster import NarrativeBroadcaster
        assert NarrativeBroadcaster is not None

    def test_all_exports_available(self):
        """All expected exports should be available."""
        from evolution_daemon import narrative_broadcaster

        assert hasattr(narrative_broadcaster, 'NarrativeBroadcaster')
        assert hasattr(narrative_broadcaster, 'BroadcastSegment')
