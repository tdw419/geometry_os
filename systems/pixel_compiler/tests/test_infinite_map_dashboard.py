#!/usr/bin/env python3
"""
Tests for Infinite Map Real-Time Visualization Dashboard.

Tests WebSocket streaming, heat map rendering, zone boundaries,
file search, and time-lapse playback.
"""

import pytest
import tempfile
import json
import time
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
from datetime import datetime, timedelta
from collections import deque

from systems.pixel_compiler.infinite_map_dashboard import (
    # Enums
    EventType,
    VisualizationMode,
    # Dataclasses
    AccessEvent,
    HeatMapData,
    ZoneBoundary,
    FileLocation,
    TimeLapseFrame,
    # Classes
    AccessEventTracker,
    HeatMapRenderer,
    ZoneBoundaryOverlay,
    FileLocationSearch,
    TimeLapsePlayback,
    WebSocketHandler,
    DashboardServer,
)


# ============================================================================
# Test Enums
# ============================================================================

class TestEventType:
    """Tests for EventType enum."""

    def test_event_types_exist(self):
        """Test that all event types are defined."""
        assert EventType.ACCESS.value == "access"
        assert EventType.WRITE.value == "write"
        assert EventType.MIGRATION.value == "migration"
        assert EventType.ZONE_CHANGE.value == "zone_change"
        assert EventType.ERROR.value == "error"
        assert EventType.HEARTBEAT.value == "heartbeat"

    def test_event_type_count(self):
        """Test event type count."""
        assert len(EventType) == 6


class TestVisualizationMode:
    """Tests for VisualizationMode enum."""

    def test_modes_exist(self):
        """Test that all modes are defined."""
        assert VisualizationMode.HEATMAP.value == "heatmap"
        assert VisualizationMode.ZONES.value == "zones"
        assert VisualizationMode.ACCESS_PATTERN.value == "access_pattern"
        assert VisualizationMode.FILE_LOCATION.value == "file_location"
        assert VisualizationMode.TIME_LAPSE.value == "time_lapse"

    def test_mode_count(self):
        """Test mode count."""
        assert len(VisualizationMode) == 5


# ============================================================================
# Test Dataclasses
# ============================================================================

class TestAccessEvent:
    """Tests for AccessEvent dataclass."""

    def test_creation(self):
        """Test AccessEvent creation."""
        now = datetime.now()
        event = AccessEvent(
            filename="test.txt",
            x=100,
            y=200,
            zone="HOT",
            timestamp=now,
            access_type="read",
            duration_ms=5.5,
        )
        assert event.filename == "test.txt"
        assert event.x == 100
        assert event.y == 200
        assert event.zone == "HOT"
        assert event.timestamp == now
        assert event.access_type == "read"
        assert event.duration_ms == 5.5

    def test_default_values(self):
        """Test default values."""
        event = AccessEvent(
            filename="test.txt",
            x=0,
            y=0,
            zone="COLD",
            timestamp=datetime.now(),
            access_type="read",
        )
        assert event.duration_ms == 0.0

    def test_to_dict(self):
        """Test to_dict conversion."""
        now = datetime(2025, 1, 1, 10, 0, 0)
        event = AccessEvent(
            filename="test.txt",
            x=100,
            y=200,
            zone="HOT",
            timestamp=now,
            access_type="write",
            duration_ms=10.0,
        )
        d = event.to_dict()
        assert d["filename"] == "test.txt"
        assert d["x"] == 100
        assert d["y"] == 200
        assert d["zone"] == "HOT"
        assert d["timestamp"] == now.isoformat()
        assert d["access_type"] == "write"
        assert d["duration_ms"] == 10.0


class TestHeatMapData:
    """Tests for HeatMapData dataclass."""

    def test_creation(self):
        """Test HeatMapData creation."""
        grid = [[1, 2], [3, 4]]
        heatmap = HeatMapData(
            grid=grid,
            width=2,
            height=2,
            max_value=4,
            min_value=1,
        )
        assert heatmap.grid == grid
        assert heatmap.width == 2
        assert heatmap.height == 2
        assert heatmap.max_value == 4
        assert heatmap.min_value == 1

    def test_to_dict(self):
        """Test to_dict conversion."""
        grid = [[1, 2], [3, 4]]
        heatmap = HeatMapData(
            grid=grid,
            width=2,
            height=2,
            max_value=4,
            min_value=1,
        )
        d = heatmap.to_dict()
        assert d["grid"] == grid
        assert d["width"] == 2
        assert d["height"] == 2
        assert d["max_value"] == 4
        assert d["min_value"] == 1
        assert "timestamp" in d


class TestZoneBoundary:
    """Tests for ZoneBoundary dataclass."""

    def test_creation(self):
        """Test ZoneBoundary creation."""
        zone = ZoneBoundary(
            name="HOT",
            inner_radius=0,
            outer_radius=128,
            color="#ff0000",
            file_count=100,
            byte_count=409600,
        )
        assert zone.name == "HOT"
        assert zone.inner_radius == 0
        assert zone.outer_radius == 128
        assert zone.color == "#ff0000"
        assert zone.file_count == 100
        assert zone.byte_count == 409600

    def test_to_dict(self):
        """Test to_dict conversion."""
        zone = ZoneBoundary(
            name="WARM",
            inner_radius=128,
            outer_radius=384,
            color="#ff8800",
            file_count=50,
            byte_count=204800,
        )
        d = zone.to_dict()
        assert d["name"] == "WARM"
        assert d["inner_radius"] == 128
        assert d["outer_radius"] == 384
        assert d["color"] == "#ff8800"
        assert d["file_count"] == 50
        assert d["byte_count"] == 204800


class TestFileLocation:
    """Tests for FileLocation dataclass."""

    def test_creation(self):
        """Test FileLocation creation."""
        now = datetime.now()
        location = FileLocation(
            filename="/boot/vmlinuz",
            x=1024,
            y=1024,
            zone="HOT",
            size=5000000,
            access_count=100,
            last_accessed=now,
        )
        assert location.filename == "/boot/vmlinuz"
        assert location.x == 1024
        assert location.y == 1024
        assert location.zone == "HOT"
        assert location.size == 5000000
        assert location.access_count == 100
        assert location.last_accessed == now

    def test_to_dict(self):
        """Test to_dict conversion."""
        now = datetime(2025, 1, 1, 10, 0, 0)
        location = FileLocation(
            filename="/boot/vmlinuz",
            x=1024,
            y=1024,
            zone="HOT",
            size=5000000,
            access_count=100,
            last_accessed=now,
        )
        d = location.to_dict()
        assert d["filename"] == "/boot/vmlinuz"
        assert d["x"] == 1024
        assert d["y"] == 1024
        assert d["zone"] == "HOT"
        assert d["size"] == 5000000
        assert d["access_count"] == 100
        assert d["last_accessed"] == now.isoformat()

    def test_to_dict_no_access(self):
        """Test to_dict with no last_accessed."""
        location = FileLocation(
            filename="/test/file.txt",
            x=0,
            y=0,
            zone="COLD",
            size=1000,
            access_count=0,
            last_accessed=None,
        )
        d = location.to_dict()
        assert d["last_accessed"] is None


class TestTimeLapseFrame:
    """Tests for TimeLapseFrame dataclass."""

    def test_creation(self):
        """Test TimeLapseFrame creation."""
        heatmap = HeatMapData(
            grid=[[1, 2], [3, 4]],
            width=2,
            height=2,
            max_value=4,
            min_value=1,
        )
        event = AccessEvent(
            filename="test.txt",
            x=100,
            y=100,
            zone="HOT",
            timestamp=datetime.now(),
            access_type="read",
        )

        frame = TimeLapseFrame(
            timestamp=datetime.now(),
            heatmap=heatmap,
            events=[event],
        )
        assert frame.heatmap == heatmap
        assert len(frame.events) == 1

    def test_to_dict(self):
        """Test to_dict conversion."""
        now = datetime(2025, 1, 1, 10, 0, 0)
        heatmap = HeatMapData(
            grid=[[1]],
            width=1,
            height=1,
            max_value=1,
            min_value=1,
        )

        frame = TimeLapseFrame(
            timestamp=now,
            heatmap=heatmap,
            events=[],
        )
        d = frame.to_dict()
        assert d["timestamp"] == now.isoformat()
        assert "heatmap" in d
        assert d["events"] == []


# ============================================================================
# Test AccessEventTracker
# ============================================================================

class TestAccessEventTracker:
    """Tests for AccessEventTracker class."""

    def test_init(self):
        """Test initialization."""
        tracker = AccessEventTracker(max_events=1000, history_hours=12)
        assert tracker.max_events == 1000
        assert tracker.history_hours == 12
        assert len(tracker.events) == 0
        assert len(tracker.access_counts) == 0

    def test_record_access(self):
        """Test recording an access event."""
        tracker = AccessEventTracker()
        event = tracker.record_access(
            filename="test.txt",
            x=100,
            y=200,
            zone="HOT",
            access_type="read",
            duration_ms=5.0,
        )

        assert event.filename == "test.txt"
        assert event.x == 100
        assert event.y == 200
        assert event.zone == "HOT"
        assert event.access_type == "read"
        assert len(tracker.events) == 1
        assert tracker.access_counts["test.txt"] == 1

    def test_record_multiple_accesses(self):
        """Test recording multiple accesses."""
        tracker = AccessEventTracker()

        for i in range(10):
            tracker.record_access(
                filename="test.txt",
                x=100,
                y=200,
                zone="HOT",
            )
            tracker.record_access(
                filename="other.txt",
                x=500,
                y=500,
                zone="WARM",
            )

        assert len(tracker.events) == 20
        assert tracker.access_counts["test.txt"] == 10
        assert tracker.access_counts["other.txt"] == 10

    def test_get_recent_events(self):
        """Test getting recent events."""
        tracker = AccessEventTracker()

        # Record events
        tracker.record_access("file1.txt", 100, 100, "HOT")
        time.sleep(0.1)
        tracker.record_access("file2.txt", 200, 200, "WARM")

        # Get events from last 1 second
        recent = tracker.get_recent_events(seconds=1)
        assert len(recent) == 2

    def test_get_events_in_range(self):
        """Test getting events in a time range."""
        tracker = AccessEventTracker()

        now = datetime.now()
        start = now - timedelta(seconds=10)
        end = now + timedelta(seconds=10)

        tracker.record_access("file1.txt", 100, 100, "HOT")
        tracker.record_access("file2.txt", 200, 200, "WARM")

        events = tracker.get_events_in_range(start, end)
        assert len(events) == 2

    def test_get_hot_files(self):
        """Test getting hot files."""
        tracker = AccessEventTracker()

        # Create varying access counts
        for i in range(10):
            tracker.record_access("hot.txt", 100, 100, "HOT")
        for i in range(5):
            tracker.record_access("warm.txt", 200, 200, "WARM")
        for i in range(2):
            tracker.record_access("cold.txt", 500, 500, "COLD")

        hot_files = tracker.get_hot_files(count=2)
        assert len(hot_files) == 2
        assert hot_files[0][0] == "hot.txt"
        assert hot_files[0][1] == 10
        assert hot_files[1][0] == "warm.txt"
        assert hot_files[1][1] == 5

    def test_max_events_limit(self):
        """Test that max events limit is enforced."""
        tracker = AccessEventTracker(max_events=10)

        for i in range(20):
            tracker.record_access(f"file{i}.txt", i, i, "HOT")

        assert len(tracker.events) == 10

    def test_get_stats(self):
        """Test getting statistics."""
        tracker = AccessEventTracker(max_events=100)

        for i in range(5):
            tracker.record_access(f"file{i}.txt", i, i, "HOT")

        stats = tracker.get_stats()
        assert stats["total_events"] == 5
        assert stats["unique_files"] == 5
        assert stats["max_capacity"] == 100
        assert stats["history_hours"] == 24


# ============================================================================
# Test HeatMapRenderer
# ============================================================================

class TestHeatMapRenderer:
    """Tests for HeatMapRenderer class."""

    def test_init(self):
        """Test initialization."""
        renderer = HeatMapRenderer(grid_size=128)
        assert renderer.grid_size == 128
        assert len(renderer.grid) == 128
        assert len(renderer.grid[0]) == 128

    def test_update_from_events(self):
        """Test updating heat map from events."""
        renderer = HeatMapRenderer(grid_size=64)

        events = [
            AccessEvent("f1", 100, 100, "HOT", datetime.now(), "read"),
            AccessEvent("f2", 100, 100, "HOT", datetime.now(), "read"),
            AccessEvent("f3", 500, 500, "WARM", datetime.now(), "read"),
        ]

        heatmap = renderer.update_from_events(events, grid_size=64)

        assert heatmap.width == 64
        assert heatmap.height == 64
        assert heatmap.max_value >= 0
        assert heatmap.min_value >= 0

    def test_update_from_empty_events(self):
        """Test updating with no events."""
        renderer = HeatMapRenderer()
        heatmap = renderer.update_from_events([], grid_size=64)

        assert heatmap.max_value == 0
        assert heatmap.min_value == 0

    def test_get_color_for_value(self):
        """Test getting color for value."""
        renderer = HeatMapRenderer()

        # Test color gradient
        cold_color = renderer.get_color_for_value(0, 0, 100)
        hot_color = renderer.get_color_for_value(100, 0, 100)
        mid_color = renderer.get_color_for_value(50, 0, 100)

        assert cold_color.startswith("#")
        assert hot_color.startswith("#")
        assert mid_color.startswith("#")

    def test_get_color_equal_range(self):
        """Test getting color when range is zero."""
        renderer = HeatMapRenderer()
        color = renderer.get_color_for_value(50, 50, 50)
        assert color.startswith("#")

    def test_zone_colors(self):
        """Test zone color definitions."""
        assert "#ff0000" in HeatMapRenderer.ZONE_COLORS.values()
        assert "#ff8800" in HeatMapRenderer.ZONE_COLORS.values()
        assert "#00ff00" in HeatMapRenderer.ZONE_COLORS.values()

    def test_heat_colors(self):
        """Test heat color gradient."""
        colors = HeatMapRenderer.HEAT_COLORS
        assert len(colors) >= 5
        assert all(c.startswith("#") for c in colors)


# ============================================================================
# Test ZoneBoundaryOverlay
# ============================================================================

class TestZoneBoundaryOverlay:
    """Tests for ZoneBoundaryOverlay class."""

    def test_init(self):
        """Test initialization."""
        overlay = ZoneBoundaryOverlay(grid_size=1024)
        assert overlay.grid_size == 1024
        assert len(overlay.zones) == 0

    def test_calculate_zones(self):
        """Test calculating zone boundaries."""
        overlay = ZoneBoundaryOverlay(grid_size=2048)

        # Mock VAT entries
        vat_entries = {
            "hot_file": [Mock(x=1024, y=1024)],
            "warm_file": [Mock(x=1100, y=1100)],
            "cold_file": [Mock(x=1900, y=1900)],
        }

        zones = overlay.calculate_zones(vat_entries)

        assert len(zones) == 5
        zone_names = [z.name for z in zones]
        assert "HOT" in zone_names
        assert "WARM" in zone_names
        assert "COLD" in zone_names

    def test_render_overlay(self):
        """Test rendering zone overlay."""
        overlay = ZoneBoundaryOverlay(grid_size=2048)
        overlay.zones = [
            ZoneBoundary("HOT", 0, 128, "#ff0000", 10, 40960),
            ZoneBoundary("WARM", 128, 384, "#ff8800", 20, 81920),
        ]

        overlays = overlay.render_overlay(800, 600)

        assert len(overlays) == 2
        assert all(o["type"] == "circle" for o in overlays)
        assert all("cx" in o for o in overlays)
        assert all("cy" in o for o in overlays)

    def test_get_zone_for_position(self):
        """Test getting zone for a position."""
        overlay = ZoneBoundaryOverlay(grid_size=2048)
        overlay.zones = [
            ZoneBoundary("HOT", 0, 128, "#ff0000", 0, 0),
            ZoneBoundary("WARM", 128, 384, "#ff8800", 0, 0),
        ]

        # Center position should be HOT
        zone = overlay.get_zone_for_position(1024, 1024)
        assert zone == "HOT"

        # Edge position
        zone = overlay.get_zone_for_position(1500, 1500)
        assert zone in ["HOT", "WARM", "TEMPERATE", "COOL", "COLD", "UNKNOWN"]


# ============================================================================
# Test FileLocationSearch
# ============================================================================

class TestFileLocationSearch:
    """Tests for FileLocationSearch class."""

    def test_init(self):
        """Test initialization."""
        search = FileLocationSearch()
        assert len(search.files) == 0
        assert len(search.name_index) == 0

    def test_index_files(self):
        """Test indexing files."""
        search = FileLocationSearch()

        vat_entries = {
            "/boot/vmlinuz": [Mock(x=1024, y=1024)],
            "/etc/passwd": [Mock(x=1100, y=1100)],
            "/home/user.txt": [Mock(x=1500, y=1500)],
        }

        search.index_files(vat_entries)

        assert len(search.files) == 3
        assert "vmlinuz" in search.name_index
        assert "passwd" in search.name_index

    def test_search(self):
        """Test searching for files."""
        search = FileLocationSearch()

        vat_entries = {
            "/boot/vmlinuz": [Mock(x=1024, y=1024)],
            "/boot/config": [Mock(x=1050, y=1050)],
            "/etc/passwd": [Mock(x=1100, y=1100)],
        }

        search.index_files(vat_entries)

        # Search by name
        results = search.search("vmlinuz")
        assert len(results) == 1
        assert results[0].filename == "/boot/vmlinuz"

        # Search by path
        results = search.search("boot")
        assert len(results) == 2

    def test_search_limit(self):
        """Test search with limit."""
        search = FileLocationSearch()

        vat_entries = {
            f"/file{i}.txt": [Mock(x=i, y=i)] for i in range(100)
        }

        search.index_files(vat_entries)

        results = search.search("file", limit=10)
        assert len(results) == 10

    def test_search_empty(self):
        """Test search with no results."""
        search = FileLocationSearch()
        results = search.search("nonexistent")
        assert len(results) == 0

    def test_get_file(self):
        """Test getting a specific file."""
        search = FileLocationSearch()

        vat_entries = {
            "/test/file.txt": [Mock(x=100, y=100)],
        }

        search.index_files(vat_entries)

        location = search.get_file("/test/file.txt")
        assert location is not None
        assert location.filename == "/test/file.txt"

        # Non-existent file
        location = search.get_file("/nonexistent")
        assert location is None

    def test_update_access_count(self):
        """Test updating access count."""
        search = FileLocationSearch()

        vat_entries = {
            "/test/file.txt": [Mock(x=100, y=100)],
        }

        search.index_files(vat_entries)
        search.update_access_count("/test/file.txt")
        search.update_access_count("/test/file.txt")

        location = search.get_file("/test/file.txt")
        assert location.access_count == 2
        assert location.last_accessed is not None

    def test_get_stats(self):
        """Test getting search statistics."""
        search = FileLocationSearch()

        vat_entries = {
            f"/file{i}.txt": [Mock(x=i, y=i)] for i in range(10)
        }

        search.index_files(vat_entries)

        stats = search.get_stats()
        assert stats["total_files"] == 10
        assert stats["unique_names"] == 10


# ============================================================================
# Test TimeLapsePlayback
# ============================================================================

class TestTimeLapsePlayback:
    """Tests for TimeLapsePlayback class."""

    def test_init(self):
        """Test initialization."""
        playback = TimeLapsePlayback(max_frames=100, frame_interval=30)
        assert playback.max_frames == 100
        assert playback.frame_interval == 30
        assert len(playback.frames) == 0

    def test_record_frame(self):
        """Test recording a frame."""
        playback = TimeLapsePlayback()

        events = [
            AccessEvent("f1", 100, 100, "HOT", datetime.now(), "read"),
        ]

        playback.record_frame(events)

        assert len(playback.frames) == 1

    def test_record_multiple_frames(self):
        """Test recording multiple frames."""
        playback = TimeLapsePlayback()

        for i in range(5):
            events = [
                AccessEvent(f"f{i}", i, i, "HOT", datetime.now(), "read"),
            ]
            playback.record_frame(events)

        assert len(playback.frames) == 5

    def test_get_frames_in_range(self):
        """Test getting frames in a time range."""
        playback = TimeLapsePlayback()

        now = datetime.now()
        start = now - timedelta(seconds=10)
        end = now + timedelta(seconds=10)

        playback.record_frame([AccessEvent("f1", 100, 100, "HOT", datetime.now(), "read")])

        frames = playback.get_frames_in_range(start, end)
        assert len(frames) == 1

    def test_get_frame_at(self):
        """Test getting frame closest to timestamp."""
        playback = TimeLapsePlayback()

        now = datetime.now()
        playback.record_frame([AccessEvent("f1", 100, 100, "HOT", now, "read")])

        frame = playback.get_frame_at(now)
        assert frame is not None

        # Non-matching timestamp
        frame = playback.get_frame_at(now + timedelta(hours=1))
        assert frame is not None  # Returns closest

    def test_get_frame_at_empty(self):
        """Test getting frame when no frames exist."""
        playback = TimeLapsePlayback()
        frame = playback.get_frame_at(datetime.now())
        assert frame is None

    def test_export_to_json(self):
        """Test exporting to JSON."""
        playback = TimeLapsePlayback()

        playback.record_frame([AccessEvent("f1", 100, 100, "HOT", datetime.now(), "read")])

        data = playback.export_to_json()

        assert "frames" in data
        assert "frame_count" in data
        assert "frame_interval" in data
        assert data["frame_count"] == 1

    def test_max_frames_limit(self):
        """Test max frames limit."""
        playback = TimeLapsePlayback(max_frames=5)

        for i in range(10):
            playback.record_frame([])

        assert len(playback.frames) == 5


# ============================================================================
# Test WebSocketHandler
# ============================================================================

class TestWebSocketHandler:
    """Tests for WebSocketHandler class."""

    def test_init(self):
        """Test initialization."""
        handler = WebSocketHandler()
        assert len(handler.clients) == 0

    def test_add_client(self):
        """Test adding a client."""
        handler = WebSocketHandler()
        client = Mock()

        handler.add_client(client)

        assert len(handler.clients) == 1
        assert client in handler.clients

    def test_remove_client(self):
        """Test removing a client."""
        handler = WebSocketHandler()
        client = Mock()

        handler.add_client(client)
        handler.remove_client(client)

        assert len(handler.clients) == 0

    def test_remove_nonexistent_client(self):
        """Test removing a non-existent client."""
        handler = WebSocketHandler()
        client = Mock()

        # Should not raise
        handler.remove_client(client)
        assert len(handler.clients) == 0

    def test_get_client_count(self):
        """Test getting client count."""
        handler = WebSocketHandler()

        assert handler.get_client_count() == 0

        handler.add_client(Mock())
        handler.add_client(Mock())

        assert handler.get_client_count() == 2


# ============================================================================
# Test DashboardServer
# ============================================================================

class TestDashboardServer:
    """Tests for DashboardServer class."""

    @pytest.fixture
    def temp_image(self, tmp_path):
        """Create a temporary test image."""
        from PIL import Image

        img_path = tmp_path / "test.rts.png"
        img = Image.new("RGBA", (256, 256), (0, 0, 0, 255))
        img.save(img_path)
        return str(img_path)

    def test_init(self, temp_image):
        """Test DashboardServer initialization."""
        server = DashboardServer(
            image_path=temp_image,
            port=8080,
            grid_size=2048,
        )

        assert server.image_path == Path(temp_image)
        assert server.port == 8080
        assert server.grid_size == 2048
        assert server.running is False
        assert isinstance(server.event_tracker, AccessEventTracker)
        assert isinstance(server.heatmap_renderer, HeatMapRenderer)
        assert isinstance(server.zone_overlay, ZoneBoundaryOverlay)
        assert isinstance(server.file_search, FileLocationSearch)
        assert isinstance(server.timelapse, TimeLapsePlayback)
        assert isinstance(server.ws_handler, WebSocketHandler)

    def test_get_stats(self, temp_image):
        """Test getting statistics."""
        server = DashboardServer(image_path=temp_image)
        server.start_time = datetime.now()

        stats = server.get_stats()

        assert "type" in stats
        assert stats["type"] == "stats"
        assert "events" in stats
        assert "hot_files" in stats
        assert "clients" in stats
        assert "uptime" in stats

    def test_get_heatmap_data(self, temp_image):
        """Test getting heat map data."""
        server = DashboardServer(image_path=temp_image)

        # Record some events
        server.event_tracker.record_access("test.txt", 100, 100, "HOT")

        data = server.get_heatmap_data()

        assert "type" in data
        assert data["type"] == "heatmap"
        assert "grid" in data
        assert "width" in data
        assert "height" in data

    def test_get_zone_data(self, temp_image):
        """Test getting zone data."""
        server = DashboardServer(image_path=temp_image)

        # Add some zones
        server.zone_overlay.zones = [
            ZoneBoundary("HOT", 0, 128, "#ff0000", 10, 40960),
        ]

        data = server.get_zone_data()

        assert "type" in data
        assert data["type"] == "zones"
        assert "zones" in data
        assert len(data["zones"]) == 1

    def test_html_template_exists(self, temp_image):
        """Test that HTML template exists."""
        server = DashboardServer(image_path=temp_image)
        assert len(server.HTML_TEMPLATE) > 0
        assert "<!DOCTYPE html>" in server.HTML_TEMPLATE

    def test_stop(self, temp_image):
        """Test stopping server."""
        server = DashboardServer(image_path=temp_image)
        server.running = True
        server.stop()

        assert server.running is False


# ============================================================================
# Integration Tests
# ============================================================================

class TestDashboardIntegration:
    """Integration tests for dashboard components."""

    def test_full_workflow(self):
        """Test full dashboard workflow."""
        # Create components
        tracker = AccessEventTracker()
        renderer = HeatMapRenderer()
        search = FileLocationSearch()
        playback = TimeLapsePlayback()

        # Record events
        for i in range(10):
            tracker.record_access(f"file{i}.txt", i * 100, i * 100, "HOT")

        # Generate heat map
        events = tracker.get_recent_events(60)
        heatmap = renderer.update_from_events(events)

        assert heatmap.max_value > 0

        # Index files
        vat_entries = {f"file{i}.txt": [Mock(x=i*100, y=i*100)] for i in range(10)}
        search.index_files(vat_entries)

        # Search
        results = search.search("file")
        assert len(results) == 10

        # Record time-lapse frame
        playback.record_frame(events)
        assert len(playback.frames) == 1

        # Get hot files
        hot = tracker.get_hot_files()
        assert len(hot) == 10

    def test_event_tracking_to_visualization(self):
        """Test event tracking leads to visualization data."""
        tracker = AccessEventTracker()
        renderer = HeatMapRenderer()

        # Simulate access pattern
        for _ in range(100):
            tracker.record_access("kernel", 1024, 1024, "HOT")
        for _ in range(50):
            tracker.record_access("config", 1200, 1200, "WARM")
        for _ in range(10):
            tracker.record_access("archive", 1800, 1800, "COLD")

        events = tracker.get_recent_events(60)
        heatmap = renderer.update_from_events(events)

        # Verify data reflects access pattern
        assert heatmap.max_value > 0

        hot_files = tracker.get_hot_files(3)
        assert hot_files[0][0] == "kernel"
        assert hot_files[0][1] == 100


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
