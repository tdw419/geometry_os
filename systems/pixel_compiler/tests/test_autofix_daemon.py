"""Tests for AutofixDaemon core structure."""

import os
import tempfile
from pathlib import Path

import pytest

from systems.pixel_compiler.autofix import AutofixDaemon


def test_daemon_initializes_with_defaults():
    """Daemon should initialize with default values when no config provided."""
    daemon = AutofixDaemon()

    assert daemon.poll_interval == 60
    assert daemon.safe_directories == ["systems/pixel_compiler/autofix/sandbox"]
    assert daemon.max_fix_attempts == 3
    assert daemon.is_running is False


def test_daemon_initializes_with_custom_config():
    """Daemon should apply config overrides via __post_init__."""
    config = {
        "poll_interval": 120,
        "safe_directories": ["custom/path1", "custom/path2"],
        "max_fix_attempts": 5,
    }
    daemon = AutofixDaemon(config=config)

    assert daemon.poll_interval == 120
    assert daemon.safe_directories == ["custom/path1", "custom/path2"]
    assert daemon.max_fix_attempts == 5
    assert daemon.is_running is False


def test_daemon_starts_in_stopped_state():
    """Daemon should initialize with is_running=False regardless of config."""
    config = {"poll_interval": 30}
    daemon = AutofixDaemon(config=config)

    assert daemon.is_running is False


class TestAutofixDaemon:
    """Test class for AutofixDaemon safety methods."""

    def test_is_safe_path_accepts_safe_directories(self, tmp_path):
        """Should return True for paths within safe directories."""
        daemon = AutofixDaemon(config={"safe_directories": [str(tmp_path)]})

        # Create a file inside the safe directory
        safe_file = tmp_path / "test.py"
        safe_file.write_text("content")

        assert daemon.is_safe_path(str(safe_file)) is True
        assert daemon.is_safe_path(str(tmp_path)) is True

        # Test nested directory
        nested_dir = tmp_path / "nested" / "deep"
        nested_dir.mkdir(parents=True)
        assert daemon.is_safe_path(str(nested_dir)) is True

    def test_is_safe_path_rejects_unsafe_directories(self, tmp_path):
        """Should return False for paths outside safe directories."""
        daemon = AutofixDaemon(config={"safe_directories": [str(tmp_path / "safe")]})

        # Create a directory outside the safe zone
        unsafe_file = tmp_path / "unsafe" / "test.py"
        unsafe_file.parent.mkdir(parents=True)
        unsafe_file.write_text("content")

        assert daemon.is_safe_path(str(unsafe_file)) is False
        assert daemon.is_safe_path("/tmp/outside/anywhere") is False

    def test_is_safe_path_prevents_traversal_attacks(self, tmp_path):
        """Should prevent path traversal attacks like ../ escapes."""
        safe_dir = tmp_path / "sandbox"
        safe_dir.mkdir()

        daemon = AutofixDaemon(config={"safe_directories": [str(safe_dir)]})

        # Test various traversal attempts
        traversal_attempts = [
            str(safe_dir / ".." / "etc" / "passwd"),
            str(safe_dir / "../outside/file.py"),
            str(safe_dir / "subdir" / ".." / ".." / "escape"),
            "/etc/passwd",
            "../../../../etc/shadow",
        ]

        for attempt in traversal_attempts:
            assert daemon.is_safe_path(attempt) is False, \
                f"Should reject traversal attempt: {attempt}"

        # But legitimate paths within sandbox should still work
        legit_file = safe_dir / "legit.py"
        legit_file.write_text("print('safe')")
        assert daemon.is_safe_path(str(legit_file)) is True
