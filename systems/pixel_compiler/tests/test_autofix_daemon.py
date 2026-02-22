"""Tests for AutofixDaemon core structure."""

import os
import sys
import tempfile
from pathlib import Path

import pytest

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from autofix import AutofixDaemon


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


class TestAutofixDaemonTestDetection:
    """Test class for AutofixDaemon test failure detection methods."""

    def test_run_tests_returns_success_when_all_pass(self):
        """Should return success=True when all tests pass."""
        daemon = AutofixDaemon()

        # Run the passing test fixture
        fixtures_dir = Path(__file__).parent / "fixtures"
        passing_test = fixtures_dir / "passing_test.py"

        result = daemon.run_tests([str(passing_test)])

        assert result["success"] is True
        assert result["passed"] == 2
        assert result["failed"] == 0
        assert len(result["failures"]) == 0
        assert "passed" in result["output"].lower()

    def test_run_tests_returns_failures_when_some_fail(self):
        """Should return success=False and list failures when tests fail."""
        daemon = AutofixDaemon()

        # Run the failing test fixture
        fixtures_dir = Path(__file__).parent / "fixtures"
        failing_test = fixtures_dir / "failing_test.py"

        result = daemon.run_tests([str(failing_test)])

        assert result["success"] is False
        assert result["passed"] >= 1  # At least the one that passes
        assert result["failed"] >= 1  # At least one fails
        assert len(result["failures"]) >= 1

        # Check failure details
        failure = result["failures"][0]
        assert "test_name" in failure
        assert "file" in failure
        assert "line" in failure
        assert "error" in failure

    def test_parse_pytest_output_extracts_failures(self):
        """Should parse pytest output and extract failure details."""
        daemon = AutofixDaemon()

        # Sample pytest output with failures
        sample_output = """
============================= test session starts ==============================
collected 3 items

test_example.py F.F

=================================== FAILURES ===================================
_______________________________ test_addition_fails ____________________________

    def test_addition_fails():
>       assert 1 + 1 == 3  # This will fail
E       assert 2 == 3

test_example.py:5: AssertionError
__________________________ test_string_length_fails ___________________________

    def test_string_length_fails():
>       assert len("hello") == 10  # This will fail
E       assert 5 == 10

test_example.py:10: AssertionError

========================= 2 failed, 1 passed in 0.1s =========================
"""

        result = daemon._parse_pytest_output(sample_output)

        assert result["success"] is False
        assert result["failed"] == 2
        assert result["passed"] == 1
        assert len(result["failures"]) == 2

        # Check first failure
        first_failure = result["failures"][0]
        assert first_failure["test_name"] == "test_addition_fails"
        assert first_failure["file"] == "test_example.py"
        assert first_failure["line"] == 5
        # Parser extracts the assertion line from the traceback
        assert "assert" in first_failure["error"].lower()
        assert "2 == 3" in first_failure["error"]

        # Check second failure
        second_failure = result["failures"][1]
        assert second_failure["test_name"] == "test_string_length_fails"
        assert second_failure["line"] == 10
