"""
Evolution Daemon - WordPress Sentinel Tests

Tests for WordPressSentinel telemetry scanner used in behavioral defense
for scanning WordPress telemetry files and converting to BehavioralEvent objects.
"""
import json
import os
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock

import pytest

from systems.evolution_daemon.safety.wordpress_sentinel import WordPressSentinel
from systems.evolution_daemon.safety.data_structures import BehavioralEvent


class TestWordPressSentinelInit:
    """Tests for WordPressSentinel initialization."""

    def test_init_with_default_path(self):
        """Test initialization with default telemetry path."""
        sentinel = WordPressSentinel()
        assert sentinel.telemetry_path == Path("wordpress_zone/telemetry")
        assert sentinel._file_positions == {}

    def test_init_with_custom_path(self):
        """Test initialization with custom telemetry path."""
        sentinel = WordPressSentinel(telemetry_path="/custom/telemetry/path")
        assert sentinel.telemetry_path == Path("/custom/telemetry/path")

    def test_init_with_pathlib_path(self):
        """Test initialization with pathlib.Path object."""
        custom_path = Path("/another/custom/path")
        sentinel = WordPressSentinel(telemetry_path=custom_path)
        assert sentinel.telemetry_path == custom_path

    def test_init_empty_file_positions(self):
        """Test that file positions dict is initially empty."""
        sentinel = WordPressSentinel()
        assert len(sentinel._file_positions) == 0


class TestScanTelemetryEmptyDirectory:
    """Tests for scan_telemetry on empty or missing directories."""

    def test_scan_telemetry_nonexistent_directory(self):
        """Test scan_telemetry returns empty list for nonexistent directory."""
        sentinel = WordPressSentinel(telemetry_path="/nonexistent/path/xyz123")
        events = sentinel.scan_telemetry()
        assert events == []

    def test_scan_telemetry_empty_directory(self):
        """Test scan_telemetry returns empty list for empty directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry()
            assert events == []

    def test_scan_telemetry_file_not_directory(self):
        """Test scan_telemetry returns empty list if path is a file."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.txt', delete=False) as f:
            f.write("not a directory")
            temp_file = f.name

        try:
            sentinel = WordPressSentinel(telemetry_path=temp_file)
            events = sentinel.scan_telemetry()
            assert events == []
        finally:
            os.unlink(temp_file)

    def test_scan_telemetry_directory_with_no_matching_files(self):
        """Test scan_telemetry returns empty list when no .json or .jsonl files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create non-telemetry files
            Path(tmpdir, "readme.txt").write_text("not telemetry")
            Path(tmpdir, "config.yaml").write_text("key: value")

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry()
            assert events == []


class TestExtractEventsFromJSON:
    """Tests for extracting events from JSON files."""

    def test_extract_events_single_json_object(self):
        """Test extracting events from a single JSON object file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create a JSON telemetry file
            telemetry_data = {
                "type": "file_read",
                "source": "wordpress_agent_001",
                "timestamp": 1700000000,
                "data": {
                    "path": "/var/www/html/wp-config.php",
                    "user": "www-data"
                }
            }

            json_file = Path(tmpdir, "telemetry.json")
            with open(json_file, 'w') as f:
                json.dump(telemetry_data, f)

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 1
            assert isinstance(events[0], BehavioralEvent)
            assert events[0].event_type == "file_read"
            assert events[0].agent_id == "wordpress_agent_001"
            assert "path" in events[0].metadata
            assert events[0].metadata["path"] == "/var/www/html/wp-config.php"

    def test_extract_events_converts_unix_timestamp(self):
        """Test that Unix timestamps are converted to ISO format."""
        with tempfile.TemporaryDirectory() as tmpdir:
            unix_ts = 1700000000  # Known timestamp

            telemetry_data = {
                "type": "file_write",
                "source": "test_agent",
                "timestamp": unix_ts
            }

            json_file = Path(tmpdir, "event.json")
            with open(json_file, 'w') as f:
                json.dump(telemetry_data, f)

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 1
            # Should be ISO format string
            assert "T" in events[0].timestamp
            assert events[0].timestamp.endswith("+00:00") or "-" in events[0].timestamp

    def test_extract_events_handles_missing_fields(self):
        """Test extraction handles missing optional fields gracefully."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Minimal telemetry with missing fields
            telemetry_data = {}

            json_file = Path(tmpdir, "minimal.json")
            with open(json_file, 'w') as f:
                json.dump(telemetry_data, f)

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 1
            assert events[0].event_type == "unknown"
            assert events[0].agent_id == "wordpress_unknown"

    def test_extract_events_includes_data_payload_in_metadata(self):
        """Test that data payload is merged into metadata."""
        with tempfile.TemporaryDirectory() as tmpdir:
            telemetry_data = {
                "type": "api_call",
                "source": "test_agent",
                "data": {
                    "endpoint": "/api/v1/users",
                    "method": "GET",
                    "status": 200
                }
            }

            json_file = Path(tmpdir, "api_event.json")
            with open(json_file, 'w') as f:
                json.dump(telemetry_data, f)

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 1
            assert events[0].metadata["endpoint"] == "/api/v1/users"
            assert events[0].metadata["method"] == "GET"
            assert events[0].metadata["status"] == 200

    def test_extract_events_calculates_entropy(self):
        """Test that extracted events have entropy calculated."""
        with tempfile.TemporaryDirectory() as tmpdir:
            telemetry_data = {
                "type": "file_read",
                "source": "entropy_test_agent",
                "data": {
                    "path": "/var/log/auth.log",
                    "user": "admin"
                }
            }

            json_file = Path(tmpdir, "entropy_test.json")
            with open(json_file, 'w') as f:
                json.dump(telemetry_data, f)

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 1
            assert events[0].entropy >= 0.0
            assert events[0].entropy <= 1.0


class TestExtractEventsFromJSONL:
    """Tests for extracting events from JSONL files."""

    def test_extract_events_jsonl_multiple_lines(self):
        """Test extracting events from JSONL file with multiple entries."""
        with tempfile.TemporaryDirectory() as tmpdir:
            jsonl_file = Path(tmpdir, "events.jsonl")
            with open(jsonl_file, 'w') as f:
                f.write('{"type": "file_read", "source": "agent1", "timestamp": 1700000001}\n')
                f.write('{"type": "file_write", "source": "agent2", "timestamp": 1700000002}\n')
                f.write('{"type": "network_request", "source": "agent1", "timestamp": 1700000003}\n')

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 3
            assert events[0].event_type == "file_read"
            assert events[1].event_type == "file_write"
            assert events[2].event_type == "network_request"

    def test_extract_events_jsonl_handles_blank_lines(self):
        """Test that JSONL parser skips blank lines."""
        with tempfile.TemporaryDirectory() as tmpdir:
            jsonl_file = Path(tmpdir, "with_blanks.jsonl")
            with open(jsonl_file, 'w') as f:
                f.write('{"type": "event1", "source": "a"}\n')
                f.write('\n')
                f.write('   \n')
                f.write('{"type": "event2", "source": "b"}\n')

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 2

    def test_extract_events_jsonl_with_various_timestamps(self):
        """Test JSONL extraction with Unix and ISO timestamps."""
        with tempfile.TemporaryDirectory() as tmpdir:
            jsonl_file = Path(tmpdir, "mixed_timestamps.jsonl")
            with open(jsonl_file, 'w') as f:
                # Unix timestamp
                f.write('{"type": "event1", "source": "a", "timestamp": 1700000000}\n')
                # ISO timestamp
                f.write('{"type": "event2", "source": "b", "timestamp": "2024-02-22T10:00:00Z"}\n')
                # No timestamp (auto-generated)
                f.write('{"type": "event3", "source": "c"}\n')

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 3
            # All should have timestamp strings
            for event in events:
                assert isinstance(event.timestamp, str)
                assert len(event.timestamp) > 0


class TestFilePositionTracking:
    """Tests for file position tracking in incremental scans."""

    def test_file_position_tracking_initial_zero(self):
        """Test that initial file position is 0."""
        sentinel = WordPressSentinel()
        pos = sentinel.get_file_position("/some/file.jsonl")
        assert pos == 0

    def test_set_and_get_file_position(self):
        """Test setting and getting file position."""
        sentinel = WordPressSentinel()

        sentinel.set_file_position("/test/file.jsonl", 1024)
        assert sentinel.get_file_position("/test/file.jsonl") == 1024

    def test_incremental_scan_tracks_jsonl_position(self):
        """Test that incremental scan tracks JSONL file position."""
        with tempfile.TemporaryDirectory() as tmpdir:
            jsonl_file = Path(tmpdir, "incremental.jsonl")
            with open(jsonl_file, 'w') as f:
                f.write('{"type": "event1", "source": "a"}\n')  # ~40 bytes

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events1 = sentinel.scan_telemetry(incremental=True)

            assert len(events1) == 1

            # Position should be tracked
            pos = sentinel.get_file_position(str(jsonl_file))
            assert pos > 0  # Should have read some bytes

    def test_incremental_scan_resumes_from_position(self):
        """Test that incremental scan resumes from tracked position."""
        with tempfile.TemporaryDirectory() as tmpdir:
            jsonl_file = Path(tmpdir, "resume.jsonl")

            # Write initial content
            with open(jsonl_file, 'w') as f:
                f.write('{"type": "event1", "source": "a"}\n')

            sentinel = WordPressSentinel(telemetry_path=tmpdir)

            # First scan
            events1 = sentinel.scan_telemetry(incremental=True)
            assert len(events1) == 1

            # Append more content
            with open(jsonl_file, 'a') as f:
                f.write('{"type": "event2", "source": "b"}\n')

            # Second scan (incremental)
            events2 = sentinel.scan_telemetry(incremental=True)
            assert len(events2) == 1  # Only the new event
            assert events2[0].event_type == "event2"

    def test_json_files_marked_as_processed(self):
        """Test that JSON files are marked with -1 after processing."""
        with tempfile.TemporaryDirectory() as tmpdir:
            json_file = Path(tmpdir, "single.json")
            with open(json_file, 'w') as f:
                json.dump({"type": "event1", "source": "a"}, f)

            sentinel = WordPressSentinel(telemetry_path=tmpdir)

            # First scan
            events1 = sentinel.scan_telemetry(incremental=True)
            assert len(events1) == 1

            # Should be marked as processed
            pos = sentinel.get_file_position(str(json_file))
            assert pos == -1

            # Second scan (should not re-read)
            events2 = sentinel.scan_telemetry(incremental=True)
            assert len(events2) == 0

    def test_incremental_false_reads_all(self):
        """Test that incremental=False reads entire file regardless of position."""
        with tempfile.TemporaryDirectory() as tmpdir:
            jsonl_file = Path(tmpdir, "full_read.jsonl")
            with open(jsonl_file, 'w') as f:
                f.write('{"type": "event1", "source": "a"}\n')
                f.write('{"type": "event2", "source": "b"}\n')

            sentinel = WordPressSentinel(telemetry_path=tmpdir)

            # First scan (incremental)
            events1 = sentinel.scan_telemetry(incremental=True)
            assert len(events1) == 2

            # Second scan (non-incremental, should re-read all)
            events2 = sentinel.scan_telemetry(incremental=False)
            assert len(events2) == 2

    def test_reset_positions_clears_tracking(self):
        """Test that reset_positions clears all position tracking."""
        sentinel = WordPressSentinel()

        sentinel.set_file_position("/file1.jsonl", 100)
        sentinel.set_file_position("/file2.json", -1)

        sentinel.reset_positions()

        assert sentinel.get_file_position("/file1.jsonl") == 0
        assert sentinel.get_file_position("/file2.json") == 0

    def test_get_tracked_files_returns_copy(self):
        """Test that get_tracked_files returns a copy of positions dict."""
        sentinel = WordPressSentinel()
        sentinel.set_file_position("/file.jsonl", 50)

        tracked = sentinel.get_tracked_files()
        tracked["/new.jsonl"] = 100

        # Original should not be modified
        assert sentinel.get_file_position("/new.jsonl") == 0

    def test_file_rotation_resets_position(self):
        """Test that file rotation (file shrank) resets position."""
        with tempfile.TemporaryDirectory() as tmpdir:
            jsonl_file = Path(tmpdir, "rotated.jsonl")

            # Write initial content
            with open(jsonl_file, 'w') as f:
                f.write('{"type": "event1", "source": "a"}\n' * 10)

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            sentinel.scan_telemetry(incremental=True)

            # Simulate log rotation (file rewritten, smaller)
            with open(jsonl_file, 'w') as f:
                f.write('{"type": "new_event", "source": "b"}\n')

            # Should handle gracefully (not crash, should read new content)
            events = sentinel.scan_telemetry(incremental=True)
            assert len(events) == 1
            assert events[0].event_type == "new_event"


class TestMalformedJSONHandling:
    """Tests for handling malformed JSON."""

    def test_malformed_json_in_jsonl_skipped(self):
        """Test that malformed lines in JSONL are skipped gracefully."""
        with tempfile.TemporaryDirectory() as tmpdir:
            jsonl_file = Path(tmpdir, "malformed.jsonl")
            with open(jsonl_file, 'w') as f:
                f.write('{"type": "valid1", "source": "a"}\n')
                f.write('{"type": "invalid", "source":\n')  # Malformed
                f.write('{"type": "valid2", "source": "b"}\n')

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            # Should skip malformed and continue
            assert len(events) == 2
            assert events[0].event_type == "valid1"
            assert events[1].event_type == "valid2"

    def test_malformed_json_file_returns_empty(self):
        """Test that malformed JSON file returns empty list."""
        with tempfile.TemporaryDirectory() as tmpdir:
            json_file = Path(tmpdir, "broken.json")
            with open(json_file, 'w') as f:
                f.write('{not valid json}')

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 0


class TestMissingFilesHandling:
    """Tests for handling missing files."""

    def test_nonexistent_telemetry_path_returns_empty(self):
        """Test that nonexistent telemetry path returns empty list."""
        sentinel = WordPressSentinel(telemetry_path="/nonexistent/path/xyz")
        events = sentinel.scan_telemetry()
        assert events == []

    def test_telemetry_file_deleted_during_scan(self):
        """Test handling of file deleted during scan."""
        with tempfile.TemporaryDirectory() as tmpdir:
            json_file = Path(tmpdir, "will_delete.json")
            with open(json_file, 'w') as f:
                json.dump({"type": "event1"}, f)

            sentinel = WordPressSentinel(telemetry_path=tmpdir)

            # Delete file before scan
            json_file.unlink()

            events = sentinel.scan_telemetry(incremental=False)
            assert len(events) == 0


class TestEmptyDirectory:
    """Tests for empty telemetry directory."""

    def test_empty_directory_returns_empty_list(self):
        """Test that empty directory returns no events."""
        with tempfile.TemporaryDirectory() as tmpdir:
            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry()
            assert events == []

    def test_directory_with_non_telemetry_files(self):
        """Test that non-JSON/JSONL files are ignored."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create non-telemetry files
            (Path(tmpdir) / "config.yaml").write_text("key: value")
            (Path(tmpdir) / "readme.txt").write_text("Hello")

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry()

            assert events == []

    def test_nested_directory_scanning(self):
        """Test that nested directories are scanned."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create nested structure
            nested = Path(tmpdir) / "subdir" / "nested"
            nested.mkdir(parents=True)

            jsonl_file = nested / "events.jsonl"
            with open(jsonl_file, 'w') as f:
                f.write('{"type": "nested_event", "source": "agent1"}\n')

            sentinel = WordPressSentinel(telemetry_path=tmpdir)
            events = sentinel.scan_telemetry(incremental=False)

            assert len(events) == 1
            assert events[0].event_type == "nested_event"


class TestWordPressSentinelInit:
    """Tests for WordPressSentinel initialization."""

    def test_init_default_path(self):
        """Test initialization with default telemetry path."""
        sentinel = WordPressSentinel()
        assert str(sentinel.telemetry_path) == WordPressSentinel.DEFAULT_TELEMETRY_PATH

    def test_init_custom_path(self):
        """Test initialization with custom telemetry path."""
        sentinel = WordPressSentinel(telemetry_path="/custom/path")
        assert str(sentinel.telemetry_path) == "/custom/path"

    def test_init_empty_file_positions(self):
        """Test that file positions dict is empty initially."""
        sentinel = WordPressSentinel()
        assert sentinel._file_positions == {}

    def test_init_accepts_path_object(self):
        """Test initialization accepts Path object."""
        from pathlib import Path
        sentinel = WordPressSentinel(telemetry_path=Path("/some/path"))
        assert sentinel.telemetry_path == Path("/some/path")
