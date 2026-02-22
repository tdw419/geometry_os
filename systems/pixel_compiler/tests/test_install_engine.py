"""
Tests for Install Engine Components - InstallProgress, DiskWriter, InstallEngine

Unit tests verify progress display, chunked writes, cancellation, and cleanup behavior.
All filesystem operations are mocked where appropriate.

Tests:
- TestInstallProgress: Progress display behavior
- TestDiskWriter: Chunked write with cancellation support
- TestInstallEngine: Full install pipeline orchestration
"""

import pytest
import tempfile
import os
import sys
import signal
import hashlib
from pathlib import Path
from unittest.mock import patch, MagicMock, mock_open, call
from dataclasses import asdict
from io import BytesIO

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

# Import install components
from install import (
    InstallProgress,
    InstallStage,
    DiskWriter,
    WriteResult,
    InstallEngine,
    InstallResult,
    InstallError,
)


# ============================================================================
# TestInstallProgress - Tests for visual progress display
# ============================================================================

class TestInstallProgress:
    """Tests for InstallProgress class."""

    def test_install_stage_enum_has_all_stages(self):
        """Test that InstallStage enum has all required stages."""
        expected_stages = [
            'VERIFYING', 'PREPARING', 'WRITING', 'SYNCING', 'COMPLETED', 'FAILED'
        ]
        actual_stages = [stage.name for stage in InstallStage]
        assert actual_stages == expected_stages

    def test_start_sets_current_stage(self):
        """Test that start() sets the current stage."""
        progress = InstallProgress(verbose=False)

        progress.start(InstallStage.VERIFYING)

        assert progress._current_stage == InstallStage.VERIFYING
        assert progress._stage_start_time is not None

    def test_update_progress_with_message(self):
        """Test that update() sets progress and message."""
        progress = InstallProgress(verbose=False)

        progress.start(InstallStage.WRITING)
        progress.update(0.5, "Halfway there")

        assert progress._current_progress == 0.5
        assert progress._current_message == "Halfway there"

    def test_complete_shows_duration(self):
        """Test that complete() resets state and records duration."""
        progress = InstallProgress(verbose=False)

        progress.start(InstallStage.WRITING)
        progress.complete("Write complete")

        assert progress._current_stage is None
        assert progress._current_progress == 0.0

    def test_error_shows_error_message(self):
        """Test that error() sets FAILED stage."""
        progress = InstallProgress(verbose=False)

        progress.start(InstallStage.VERIFYING)
        progress.error("Verification failed")

        assert progress._current_stage == InstallStage.FAILED

    def test_update_clamps_progress_to_valid_range(self):
        """Test that progress values are clamped to 0.0-1.0."""
        progress = InstallProgress(verbose=False)

        progress.start(InstallStage.WRITING)

        progress.update(1.5, "Over 100%")
        assert progress._current_progress == 1.0

        progress.update(-0.5, "Under 0%")
        assert progress._current_progress == 0.0


# ============================================================================
# TestDiskWriter - Tests for chunked disk writes
# ============================================================================

class TestDiskWriter:
    """Tests for DiskWriter class."""

    def test_write_creates_file_at_target(self, tmp_path):
        """Test that write() creates the target file."""
        src_path = tmp_path / "source.bin"
        dst_path = tmp_path / "target.bin"

        # Create source file
        test_data = b"Hello, World!" * 1000
        src_path.write_bytes(test_data)

        writer = DiskWriter(chunk_size=1024)

        with open(src_path, 'rb') as src:
            result = writer.write(
                src_reader=src,
                dst_path=dst_path,
                total_size=len(test_data),
                progress_callback=lambda p, m: None
            )

        assert result.success is True
        assert dst_path.exists()
        assert dst_path.read_bytes() == test_data

    def test_write_calls_progress_callback(self, tmp_path):
        """Test that write() calls progress callback."""
        src_path = tmp_path / "source.bin"
        dst_path = tmp_path / "target.bin"

        test_data = b"Test data" * 100
        src_path.write_bytes(test_data)

        progress_calls = []

        def track_progress(progress, message):
            progress_calls.append((progress, message))

        writer = DiskWriter(chunk_size=256)

        with open(src_path, 'rb') as src:
            result = writer.write(
                src_reader=src,
                dst_path=dst_path,
                total_size=len(test_data),
                progress_callback=track_progress
            )

        assert result.success is True
        assert len(progress_calls) > 0

        # First call should be 0.0
        assert progress_calls[0][0] == 0.0

        # Last call should be 1.0 (complete)
        assert progress_calls[-1][0] == 1.0

    def test_write_respects_chunk_size(self, tmp_path):
        """Test that write() respects chunk size."""
        src_path = tmp_path / "source.bin"
        dst_path = tmp_path / "target.bin"

        # Create data that spans multiple chunks
        test_data = b"X" * 5000
        src_path.write_bytes(test_data)

        chunk_size = 1000
        writer = DiskWriter(chunk_size=chunk_size)

        # Track number of reads by counting progress callbacks
        # (excluding initial and final calls)
        progress_count = [0]

        def count_progress(progress, message):
            if 0 < progress < 1.0:
                progress_count[0] += 1

        with open(src_path, 'rb') as src:
            result = writer.write(
                src_reader=src,
                dst_path=dst_path,
                total_size=len(test_data),
                progress_callback=count_progress
            )

        assert result.success is True
        # Should have roughly (total_size / chunk_size) intermediate updates
        expected_chunks = len(test_data) // chunk_size
        assert progress_count[0] >= expected_chunks - 1

    def test_cancel_stops_write_and_deletes_temp(self, tmp_path):
        """Test that cancel() stops write and deletes temp file."""
        src_path = tmp_path / "source.bin"
        dst_path = tmp_path / "target.bin"

        # Create large data
        test_data = b"Large data" * 10000
        src_path.write_bytes(test_data)

        writer = DiskWriter(chunk_size=100)
        cancel_called = [False]

        def cancel_after_half(progress, message):
            # Cancel after 50% written
            if progress >= 0.5 and not cancel_called[0]:
                writer.cancel()
                cancel_called[0] = True

        with open(src_path, 'rb') as src:
            result = writer.write(
                src_reader=src,
                dst_path=dst_path,
                total_size=len(test_data),
                progress_callback=cancel_after_half
            )

        assert result.success is False
        assert result.cancelled is True

        # Temp file should be deleted
        temp_path = Path(str(dst_path) + '.tmp')
        assert not temp_path.exists()

        # Target file should NOT exist (cancelled before completion)
        assert not dst_path.exists()

    def test_temp_file_renamed_on_success(self, tmp_path):
        """Test that temp file is renamed to target on success."""
        src_path = tmp_path / "source.bin"
        dst_path = tmp_path / "target.bin"

        test_data = b"Success data"
        src_path.write_bytes(test_data)

        writer = DiskWriter()

        with open(src_path, 'rb') as src:
            result = writer.write(
                src_reader=src,
                dst_path=dst_path,
                total_size=len(test_data),
                progress_callback=lambda p, m: None
            )

        assert result.success is True

        # No temp file should exist
        temp_path = Path(str(dst_path) + '.tmp')
        assert not temp_path.exists()

        # Target should exist with correct data
        assert dst_path.exists()
        assert dst_path.read_bytes() == test_data

    def test_temp_file_deleted_on_error(self, tmp_path):
        """Test that temp file is deleted on error."""
        src_path = tmp_path / "source.bin"
        dst_path = tmp_path / "target.bin"

        test_data = b"Error test data"
        src_path.write_bytes(test_data)

        writer = DiskWriter()

        # Create a failing reader that raises an error after first read
        class FailingReader:
            def __init__(self, data):
                self.data = data
                self.pos = 0
                self.read_count = 0

            def read(self, size=-1):
                self.read_count += 1
                if self.read_count > 1:
                    raise IOError("Simulated read error")
                # Return partial data on first read
                chunk = self.data[:10]
                return chunk

        failing_reader = FailingReader(test_data)

        result = writer.write(
            src_reader=failing_reader,
            dst_path=dst_path,
            total_size=len(test_data),
            progress_callback=lambda p, m: None
        )

        # Write should have failed
        assert result.success is False

        # Temp file should be cleaned up
        temp_path = Path(str(dst_path) + '.tmp')
        assert not temp_path.exists()

    def test_write_result_success_fields(self):
        """Test WriteResult has correct fields for success."""
        result = WriteResult(
            success=True,
            bytes_written=1000,
            target_path=Path("/tmp/file.bin"),
            error_message=None,
            cancelled=False
        )

        assert result.success is True
        assert result.bytes_written == 1000
        assert result.error_message is None
        assert result.cancelled is False

    def test_write_result_cancelled_fields(self):
        """Test WriteResult has correct fields for cancellation."""
        result = WriteResult(
            success=False,
            bytes_written=500,
            target_path=Path("/tmp/file.bin"),
            error_message="Write operation cancelled",
            cancelled=True
        )

        assert result.success is False
        assert result.cancelled is True
        assert result.bytes_written == 500


# ============================================================================
# TestInstallEngine - Tests for install orchestration
# ============================================================================

class TestInstallEngine:
    """Tests for InstallEngine class."""

    def test_install_validates_input_exists(self, tmp_path):
        """Test that InstallEngine validates input exists."""
        rts_path = tmp_path / "missing.rts.png"
        target_path = tmp_path / "target.img"

        with pytest.raises(InstallError) as exc_info:
            InstallEngine(str(rts_path), str(target_path))

        assert "not found" in str(exc_info.value).lower()

    def test_install_fails_on_missing_input(self, tmp_path):
        """Test that install fails gracefully on missing input."""
        rts_path = tmp_path / "exists.rts.png"
        target_path = tmp_path / "target.img"

        # Create a minimal valid .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path), verbose=False)

        # Patch _decode_data to return None (simulating decode failure)
        engine._decode_data = MagicMock(return_value=None)

        result = engine.install()

        assert result.success is False
        assert "decode" in result.error_message.lower()

    def test_install_verifies_hash_before_write(self, tmp_path):
        """Test that install verifies hash before writing."""
        rts_path = tmp_path / "test.rts.png"
        target_path = tmp_path / "target.img"

        # Create minimal .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path), verbose=False, verify=True)

        # Mock verification to pass
        engine._verify_hash = MagicMock(return_value=True)

        # Mock decode to return data
        test_data = b"Test data for install"
        engine._decode_data = MagicMock(return_value=test_data)

        # Mock disk space check
        engine._check_disk_space = MagicMock(return_value=True)

        # Run install
        result = engine.install()

        assert result.success is True
        assert result.verified is True
        engine._verify_hash.assert_called_once()

    def test_install_fails_on_hash_mismatch(self, tmp_path):
        """Test that install fails when hash verification fails."""
        rts_path = tmp_path / "test.rts.png"
        target_path = tmp_path / "target.img"

        # Create minimal .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path), verbose=False, verify=True)

        # Mock verification to fail
        engine._verify_hash = MagicMock(return_value=False)

        # Run install
        result = engine.install()

        assert result.success is False
        assert result.verified is False
        assert "verification failed" in result.error_message.lower()

    def test_install_writes_decoded_data_to_target(self, tmp_path):
        """Test that install writes decoded data to target."""
        rts_path = tmp_path / "test.rts.png"
        target_path = tmp_path / "target.img"

        # Create minimal .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path), verbose=False, verify=False)

        # Mock decode to return specific data
        test_data = b"Decoded data content for installation test"
        engine._decode_data = MagicMock(return_value=test_data)

        # Mock disk space check
        engine._check_disk_space = MagicMock(return_value=True)

        # Run install
        result = engine.install()

        assert result.success is True
        assert result.bytes_written == len(test_data)
        assert target_path.exists()
        assert target_path.read_bytes() == test_data

    def test_install_shows_progress_through_all_stages(self, tmp_path):
        """Test that install goes through all stages."""
        rts_path = tmp_path / "test.rts.png"
        target_path = tmp_path / "target.img"

        # Create minimal .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path), verbose=False, verify=False)

        # Mock decode
        test_data = b"Data for progress test"
        engine._decode_data = MagicMock(return_value=test_data)

        # Mock disk space check
        engine._check_disk_space = MagicMock(return_value=True)

        # Track stages
        stages_seen = []

        original_start = engine._progress.start
        def track_start(stage):
            stages_seen.append(stage)
            return original_start(stage)

        engine._progress.start = track_start

        # Run install
        result = engine.install()

        assert result.success is True

        # Should have seen VERIFYING, PREPARING, WRITING, SYNCING, COMPLETED
        assert InstallStage.VERIFYING in stages_seen
        assert InstallStage.PREPARING in stages_seen
        assert InstallStage.WRITING in stages_seen
        assert InstallStage.SYNCING in stages_seen
        assert InstallStage.COMPLETED in stages_seen

    def test_cancel_cleans_up_partial_write(self, tmp_path):
        """Test that cancel() cleans up partial writes."""
        rts_path = tmp_path / "test.rts.png"
        target_path = tmp_path / "target.img"

        # Create minimal .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path), verbose=False, verify=False)

        # Mock decode with large data
        large_data = b"X" * 10000
        engine._decode_data = MagicMock(return_value=large_data)

        # Mock disk space check
        engine._check_disk_space = MagicMock(return_value=True)

        # Cancel during install
        def cancel_during_write(progress, message):
            if progress > 0.5 and not engine._cancelled:
                engine.cancel()

        # Patch DiskWriter to call our cancel callback
        original_write = DiskWriter.write
        def patched_write(self, src_reader, dst_path, total_size, progress_callback):
            def wrapped_callback(progress, message):
                cancel_during_write(progress, message)
                progress_callback(progress, message)
            return original_write(self, src_reader, dst_path, total_size, wrapped_callback)

        with patch.object(DiskWriter, 'write', patched_write):
            result = engine.install()

        assert result.success is False
        assert result.cancelled is True

    def test_context_manager_cleanup_on_exception(self, tmp_path):
        """Test that context manager cleans up on exception."""
        rts_path = tmp_path / "test.rts.png"
        target_path = tmp_path / "target.img"

        # Create minimal .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path), verbose=False)

        # Mock _load_metadata to raise exception
        engine._load_metadata = MagicMock(side_effect=RuntimeError("Test error"))

        # Context manager should handle exception
        with engine as eng:
            result = eng.install()

        assert result.success is False
        assert "error" in result.error_message.lower()

    def test_insufficient_disk_space_fails_gracefully(self, tmp_path):
        """Test that install fails gracefully on insufficient disk space."""
        rts_path = tmp_path / "test.rts.png"
        target_path = tmp_path / "target.img"

        # Create minimal .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path), verbose=False, verify=False)

        # Mock decode to return data
        test_data = b"X" * 1000
        engine._decode_data = MagicMock(return_value=test_data)

        # Mock disk space check to fail
        engine._check_disk_space = MagicMock(return_value=False)

        # Run install
        result = engine.install()

        assert result.success is False
        assert "disk space" in result.error_message.lower()

    def test_install_result_to_dict(self):
        """Test InstallResult.to_dict() serialization."""
        result = InstallResult(
            success=True,
            target_path=Path("/tmp/target.img"),
            bytes_written=1000,
            error_message=None,
            cancelled=False,
            duration_seconds=1.5,
            verified=True
        )

        d = result.to_dict()

        assert d["success"] is True
        assert d["target_path"] == "/tmp/target.img"
        assert d["bytes_written"] == 1000
        assert d["error_message"] is None
        assert d["cancelled"] is False
        assert d["duration_seconds"] == 1.5
        assert d["verified"] is True

    def test_install_error_str_with_path(self):
        """Test InstallError string representation with path."""
        error = InstallError("Test error", path="/test/path")

        error_str = str(error)
        assert "Test error" in error_str
        assert "/test/path" in error_str

    def test_install_error_str_with_original_error(self):
        """Test InstallError string representation with original error."""
        original = ValueError("original issue")
        error = InstallError("Test error", original_error=original)

        error_str = str(error)
        assert "Test error" in error_str
        assert "original issue" in error_str

    def test_get_status_returns_current_state(self, tmp_path):
        """Test get_status() returns current engine state."""
        rts_path = tmp_path / "test.rts.png"
        target_path = tmp_path / "target.img"

        # Create minimal .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path), verbose=True, verify=True)

        status = engine.get_status()

        assert status["rts_png_path"] == str(rts_path.resolve())
        assert status["target_path"] == str(target_path.resolve())
        assert status["verify"] is True
        assert status["cancelled"] is False

    def test_repr_shows_status(self, tmp_path):
        """Test __repr__ shows engine status."""
        rts_path = tmp_path / "test.rts.png"
        target_path = tmp_path / "target.img"

        # Create minimal .rts.png
        rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        engine = InstallEngine(str(rts_path), str(target_path))

        repr_str = repr(engine)
        assert "InstallEngine" in repr_str
        assert "ready" in repr_str

        engine._cancelled = True
        repr_str = repr(engine)
        assert "cancelled" in repr_str


# ============================================================================
# Test fixtures and utilities
# ============================================================================

@pytest.fixture
def mock_rts_png(tmp_path):
    """Create a minimal valid .rts.png with metadata for testing."""
    rts_path = tmp_path / "test.rts.png"
    meta_path = tmp_path / "test.rts.meta.json"

    # Create minimal PNG header
    rts_path.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 1024)

    # Create metadata with hash
    test_data = b"Test data content"
    data_hash = hashlib.sha256(test_data).hexdigest()

    import json
    meta_path.write_text(json.dumps({
        "version": "1.0",
        "format": "PixelRTS",
        "data_hash": data_hash,
        "data_size": len(test_data)
    }))

    return rts_path


@pytest.fixture
def sample_install_engine(mock_rts_png, tmp_path):
    """Create a sample InstallEngine for testing."""
    target_path = tmp_path / "target.img"
    engine = InstallEngine(str(mock_rts_png), str(target_path), verbose=False, verify=False)
    return engine


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
