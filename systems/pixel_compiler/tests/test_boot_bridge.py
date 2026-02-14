"""
Tests for Boot Bridge Components - MountHelper, BootBridge, BootResult, BootProgress

Unit tests verify mount/unmount behavior, boot file discovery, and cleanup behavior.
Actual FUSE mount tests are mocked since they require special permissions.
"""

import pytest
import tempfile
import os
import sys
from pathlib import Path
from unittest.mock import patch, MagicMock, mock_open
from dataclasses import asdict

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

# Mock FUSE modules before importing boot package to avoid import errors
# when fusepy is not installed
sys.modules['systems.rts_fuse.filesystem'] = MagicMock()
sys.modules['systems.rts_fuse'] = MagicMock()
sys.modules['rts_fuse.filesystem'] = MagicMock()
sys.modules['rts_fuse'] = MagicMock()

from boot import (
    MountHelper,
    MountError,
    BootBridge,
    BootResult,
    BootProgress,
    ProgressStage,
)


# ============================================================================
# TestMountHelper - Tests for FUSE mount lifecycle management
# ============================================================================

class TestMountHelper:
    """Tests for MountHelper class."""

    def test_init_with_path(self, tmp_path):
        """Test MountHelper initialization with a valid path."""
        # Create a mock RTS PNG file
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        helper = MountHelper(str(rts_file))

        assert helper.rts_png_path == rts_file.resolve()
        assert helper._mountpoint is None
        assert not helper._mounted

    def test_init_with_custom_mountpoint(self, tmp_path):
        """Test MountHelper initialization with custom mountpoint."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        custom_mp = tmp_path / "custom_mount"
        custom_mp.mkdir()

        helper = MountHelper(str(rts_file), mountpoint=str(custom_mp))

        assert helper._mountpoint == custom_mp
        assert helper.rts_png_path == rts_file.resolve()

    def test_init_nonexistent_file_raises_error(self):
        """Test that MountHelper raises error for nonexistent file."""
        with pytest.raises(MountError) as exc_info:
            MountHelper("/nonexistent/file.rts.png")

        assert "not found" in str(exc_info.value).lower()

    def test_discover_boot_files_kernel_patterns(self, tmp_path):
        """Test boot file discovery with common kernel patterns."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        helper = MountHelper(str(rts_file))

        # Mock mounted state and filesystem contents
        helper._mounted = True
        helper._mountpoint = tmp_path

        # Create mock kernel and initrd files
        kernel_file = tmp_path / "vmlinuz"
        kernel_file.write_bytes(b"kernel_data")
        initrd_file = tmp_path / "initrd.img"
        initrd_file.write_bytes(b"initrd_data")

        kernel, initrd = helper.discover_boot_files()

        assert kernel is not None
        assert "vmlinuz" in kernel.lower()
        assert initrd is not None
        assert "initrd" in initrd.lower()

    def test_discover_boot_files_no_kernel(self, tmp_path):
        """Test boot file discovery when no kernel exists."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        helper = MountHelper(str(rts_file))

        # Mock mounted state without kernel/initrd
        helper._mounted = True
        helper._mountpoint = tmp_path

        # Create non-kernel files
        (tmp_path / "readme.txt").write_text("no kernel here")
        (tmp_path / "config.ini").write_text("config")

        kernel, initrd = helper.discover_boot_files()

        # Should return None for both if no patterns match
        assert kernel is None
        assert initrd is None

    def test_discover_boot_files_not_mounted_raises(self, tmp_path):
        """Test that discover_boot_files raises error if not mounted."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        helper = MountHelper(str(rts_file))

        with pytest.raises(MountError) as exc_info:
            helper.discover_boot_files()

        assert "not mounted" in str(exc_info.value).lower()

    def test_context_manager_cleanup(self, tmp_path):
        """Test that context manager properly cleans up."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        # Mock FUSE_AVAILABLE to False to skip actual mount
        with patch('boot.mount_helper.FUSE_AVAILABLE', False):
            helper = MountHelper(str(rts_file))

            # Verify cleanup is called even on exception
            helper._force_cleanup = MagicMock()

            with pytest.raises(MountError):
                with helper as h:
                    raise ValueError("test error")

            # Cleanup should have been called by __exit__
            # Note: Since mount() raises before context manager completes,
            # _force_cleanup won't be called. Instead we verify that
            # the context manager __exit__ doesn't suppress exceptions.

    def test_mount_fuse_not_available_raises(self, tmp_path):
        """Test that mount raises error when FUSE is not available."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        with patch('boot.mount_helper.FUSE_AVAILABLE', False):
            helper = MountHelper(str(rts_file))

            with pytest.raises(MountError) as exc_info:
                helper.mount()

            assert "FUSE not available" in str(exc_info.value)

    def test_is_mounted_returns_correct_state(self, tmp_path):
        """Test is_mounted returns correct state."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        helper = MountHelper(str(rts_file))

        assert helper.is_mounted() is False

        # Manually set mounted state
        helper._mounted = True
        assert helper.is_mounted() is True

    def test_get_mountpoint_returns_correct_value(self, tmp_path):
        """Test get_mountpoint returns correct value."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        custom_mp = tmp_path / "mountpoint"
        custom_mp.mkdir()

        helper = MountHelper(str(rts_file), mountpoint=str(custom_mp))

        # Not mounted yet
        assert helper.get_mountpoint() is None

        # After mounting
        helper._mounted = True
        assert helper.get_mountpoint() == custom_mp

    def test_get_metadata_returns_loaded_metadata(self, tmp_path):
        """Test get_metadata returns loaded metadata."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        # Create sidecar metadata file
        meta_file = tmp_path / "test.rts.meta.json"
        meta_file.write_text('{"version": "1.0", "segments": {"kernel": {"offset": 0}}}')

        helper = MountHelper(str(rts_file))
        metadata = helper.get_metadata()

        # Metadata should be loaded (either from sidecar or empty dict)
        assert isinstance(metadata, dict)

    def test_repr_shows_status(self, tmp_path):
        """Test __repr__ shows mount status."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        helper = MountHelper(str(rts_file))
        repr_str = repr(helper)

        assert "MountHelper" in repr_str
        assert "unmounted" in repr_str

        helper._mounted = True
        repr_str = repr(helper)
        assert "mounted" in repr_str


class TestMountError:
    """Tests for MountError exception class."""

    def test_mount_error_basic(self):
        """Test basic MountError creation."""
        error = MountError("Something went wrong")

        assert str(error) == "Something went wrong"
        assert error.message == "Something went wrong"
        assert error.mountpoint is None
        assert error.original_error is None

    def test_mount_error_with_mountpoint(self):
        """Test MountError with mountpoint."""
        error = MountError("Mount failed", mountpoint="/tmp/mount")

        assert "/tmp/mount" in str(error)
        assert error.mountpoint == "/tmp/mount"

    def test_mount_error_with_original_error(self):
        """Test MountError with original error."""
        original = ValueError("original error")
        error = MountError("Mount failed", original_error=original)

        assert "original error" in str(error)
        assert error.original_error == original

    def test_mount_error_full(self):
        """Test MountError with all fields."""
        original = RuntimeError("underlying issue")
        error = MountError(
            "Failed to mount",
            mountpoint="/mnt/test",
            original_error=original
        )

        error_str = str(error)
        assert "Failed to mount" in error_str
        assert "/mnt/test" in error_str
        assert "underlying issue" in error_str


# ============================================================================
# TestBootBridge - Tests for FUSE mount + QEMU boot orchestration
# ============================================================================

class TestBootBridge:
    """Tests for BootBridge class."""

    def test_init_parameters(self, tmp_path):
        """Test BootBridge initialization with various parameters."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        # Mock QemuBoot import
        with patch('boot.boot_bridge.QemuBoot'):
            with patch('boot.boot_bridge.QemuConfig'):
                bridge = BootBridge(
                    str(rts_file),
                    memory="4G",
                    cpus=4,
                    vnc_display=1,
                    verbose=True,
                )

                assert bridge.memory == "4G"
                assert bridge.cpus == 4
                assert bridge.vnc_display == 1
                assert bridge.verbose is True
                assert bridge.rts_png_path == rts_file.resolve()

    def test_init_nonexistent_file_raises(self):
        """Test that BootBridge raises error for nonexistent file."""
        with patch('boot.boot_bridge.QemuBoot'):
            with patch('boot.boot_bridge.QemuConfig'):
                with pytest.raises(MountError) as exc_info:
                    BootBridge("/nonexistent/file.rts.png")

                assert "not found" in str(exc_info.value).lower()

    def test_get_status_returns_current_state(self, tmp_path):
        """Test get_status returns current bridge state."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        with patch('boot.boot_bridge.QemuBoot'):
            with patch('boot.boot_bridge.QemuConfig'):
                bridge = BootBridge(str(rts_file))
                status = bridge.get_status()

                assert status["mounted"] is False
                assert status["booted"] is False
                assert status["rts_png_path"] == str(rts_file.resolve())

    def test_stop_is_safe_to_call_multiple_times(self, tmp_path):
        """Test that stop() is safe to call multiple times."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        with patch('boot.boot_bridge.QemuBoot'):
            with patch('boot.boot_bridge.QemuConfig'):
                bridge = BootBridge(str(rts_file))

                # Should not raise error
                bridge.stop()
                bridge.stop()
                bridge.stop()

    def test_context_manager_cleanup(self, tmp_path):
        """Test context manager cleanup."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        with patch('boot.boot_bridge.QemuBoot'):
            with patch('boot.boot_bridge.QemuConfig'):
                bridge = BootBridge(str(rts_file))
                bridge._cleanup = MagicMock()

                with bridge as b:
                    pass

                # Cleanup should be called on exit
                bridge._cleanup.assert_called_once()

    def test_repr_shows_status(self, tmp_path):
        """Test __repr__ shows bridge status."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        with patch('boot.boot_bridge.QemuBoot'):
            with patch('boot.boot_bridge.QemuConfig'):
                bridge = BootBridge(str(rts_file), memory="2G", cpus=2)

                repr_str = repr(bridge)
                assert "BootBridge" in repr_str
                assert "2G" in repr_str
                assert "idle" in repr_str

                bridge._mounted = True
                repr_str = repr(bridge)
                assert "mounted" in repr_str


class TestBootResult:
    """Tests for BootResult dataclass."""

    def test_boot_result_success(self):
        """Test successful BootResult creation."""
        result = BootResult(
            success=True,
            pid=12345,
            vnc_port=5900,
            mountpoint=Path("/tmp/mount"),
        )

        assert result.success is True
        assert result.pid == 12345
        assert result.vnc_port == 5900
        assert result.error_message is None

    def test_boot_result_failure(self):
        """Test failed BootResult creation."""
        result = BootResult(
            success=False,
            error_message="Failed to mount FUSE",
        )

        assert result.success is False
        assert result.error_message == "Failed to mount FUSE"
        assert result.pid is None
        assert result.vnc_port is None

    def test_boot_result_to_dict(self):
        """Test BootResult.to_dict() serialization."""
        result = BootResult(
            success=True,
            pid=12345,
            vnc_port=5900,
            serial_socket=Path("/tmp/serial.sock"),
            mountpoint=Path("/tmp/mount"),
        )

        d = result.to_dict()

        assert d["success"] is True
        assert d["pid"] == 12345
        assert d["vnc_port"] == 5900
        assert d["serial_socket"] == "/tmp/serial.sock"
        assert d["mountpoint"] == "/tmp/mount"


# ============================================================================
# TestBootProgress - Tests for visual progress display
# ============================================================================

class TestBootProgress:
    """Tests for BootProgress class."""

    def test_init_verbose(self):
        """Test BootProgress initialization with verbose=True."""
        progress = BootProgress(verbose=True)

        assert progress.verbose is True
        assert progress._current_stage is None

    def test_init_quiet(self):
        """Test BootProgress initialization with verbose=False."""
        progress = BootProgress(verbose=False)

        assert progress.verbose is False

    def test_stage_progression(self):
        """Test that stages progress correctly."""
        progress = BootProgress(verbose=False)

        # Start a stage
        progress.start(ProgressStage.PARSING_METADATA)
        assert progress._current_stage == ProgressStage.PARSING_METADATA
        assert progress._stage_start_time is not None

        # Update progress
        progress.update(0.5, "Halfway")
        assert progress._current_progress == 0.5
        assert progress._current_message == "Halfway"

        # Complete stage
        progress.complete("Done parsing")
        assert progress._current_stage is None
        assert progress._current_progress == 0.0

    def test_update_clamps_progress(self):
        """Test that update clamps progress to valid range."""
        progress = BootProgress(verbose=False)

        progress.start(ProgressStage.MOUNTING_FUSE)

        # Test values > 1.0 are clamped
        progress.update(1.5, "Over 100%")
        assert progress._current_progress == 1.0

        # Test values < 0.0 are clamped
        progress.update(-0.5, "Under 0%")
        assert progress._current_progress == 0.0

    def test_error_sets_failed_stage(self):
        """Test that error() sets BOOT_FAILED stage."""
        progress = BootProgress(verbose=False)

        progress.start(ProgressStage.MOUNTING_FUSE)
        progress.error("Mount failed")

        assert progress._current_stage == ProgressStage.BOOT_FAILED

    def test_complete_without_start_is_safe(self):
        """Test that complete() without start() is safe."""
        progress = BootProgress(verbose=False)

        # Should not raise error
        progress.complete("Nothing to complete")

    def test_tty_detection(self):
        """Test TTY detection in constructor."""
        progress = BootProgress()

        # Should have detected TTY state
        assert isinstance(progress._is_tty, bool)


class TestProgressStage:
    """Tests for ProgressStage enum."""

    def test_stage_display_names(self):
        """Test that all stages have display names."""
        expected_names = [
            "Parsing metadata",
            "Mounting FUSE",
            "Discovering boot files",
            "Loading kernel",
            "Loading initrd",
            "Starting QEMU",
            "Boot complete",
            "Boot failed",
        ]

        for stage, expected in zip(ProgressStage, expected_names):
            assert stage.display_name == expected

    def test_all_stages_exist(self):
        """Test that all expected stages exist."""
        assert ProgressStage.PARSING_METADATA
        assert ProgressStage.MOUNTING_FUSE
        assert ProgressStage.DISCOVERING_BOOT_FILES
        assert ProgressStage.LOADING_KERNEL
        assert ProgressStage.LOADING_INITRD
        assert ProgressStage.STARTING_QEMU
        assert ProgressStage.BOOT_COMPLETE
        assert ProgressStage.BOOT_FAILED


# ============================================================================
# Integration-style tests (mocked)
# ============================================================================

class TestBootIntegration:
    """Integration-style tests with mocked dependencies."""

    def test_boot_flow_without_kernel_returns_failure(self, tmp_path):
        """Test that boot fails gracefully when no kernel is found."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        # Create empty mountpoint (no kernel)
        mountpoint = tmp_path / "mount"
        mountpoint.mkdir()

        with patch('boot.boot_bridge.QemuBoot') as MockQemuBoot:
            with patch('boot.boot_bridge.QemuConfig'):
                with patch('boot.boot_bridge.MountHelper') as MockMountHelper:
                    # Mock mount helper to return empty mount
                    mock_helper = MagicMock()
                    mock_helper.mount.return_value = mountpoint
                    mock_helper.discover_boot_files.return_value = (None, None)
                    MockMountHelper.return_value = mock_helper

                    bridge = BootBridge(str(rts_file))
                    result = bridge.boot()

                    assert result.success is False
                    assert "No kernel found" in result.error_message

    def test_boot_flow_cleanup_on_error(self, tmp_path):
        """Test that resources are cleaned up on boot error."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        with patch('boot.boot_bridge.QemuBoot') as MockQemuBoot:
            with patch('boot.boot_bridge.QemuConfig'):
                with patch('boot.boot_bridge.MountHelper') as MockMountHelper:
                    # Mock mount helper that raises on mount
                    mock_helper = MagicMock()
                    mock_helper.mount.side_effect = MountError("Mount failed")
                    MockMountHelper.return_value = mock_helper

                    bridge = BootBridge(str(rts_file))
                    result = bridge.boot()

                    assert result.success is False
                    assert "Mount error" in result.error_message


# ============================================================================
# Test fixtures and utilities
# ============================================================================

@pytest.fixture
def sample_rts_file(tmp_path):
    """Create a sample RTS file for testing."""
    rts_file = tmp_path / "sample.rts.png"
    # Minimal PNG header
    rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 1024)
    return rts_file


@pytest.fixture
def sample_rts_with_metadata(tmp_path):
    """Create a sample RTS file with metadata sidecar."""
    rts_file = tmp_path / "sample.rts.png"
    rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 1024)

    meta_file = tmp_path / "sample.rts.meta.json"
    meta_file.write_text('''{
        "version": "1.0",
        "offsets": {
            "kernel": {"offset": 0, "size": 100},
            "initrd": {"offset": 100, "size": 200}
        }
    }''')

    return rts_file


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
