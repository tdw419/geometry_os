"""
Tests for PixelRTS Progress Indicators

Tests the progress callback system including:
- ProgressState data class
- SilentProgressCallback no-op behavior
- ConsoleProgressCallback TTY-aware output
- ETA calculation
- Phase transitions
- Factory function behavior
"""

import pytest
import sys
import time
import io
from unittest.mock import Mock, patch

from systems.pixel_compiler.pixelrts_progress import (
    ProgressPhase,
    ProgressState,
    ProgressCallback,
    SilentProgressCallback,
    ConsoleProgressCallback,
    cli_progress_callback,
    SILENT
)


class TestProgressState:
    """Test the ProgressState dataclass."""

    def test_create_state_with_total(self):
        """Create state with known total."""
        state = ProgressState(
            phase="testing",
            completed=50,
            total=100,
            message="Processing"
        )

        assert state.phase == "testing"
        assert state.completed == 50
        assert state.total == 100
        assert state.message == "Processing"
        assert 0 < state.timestamp < time.time() + 1

    def test_create_state_indeterminate(self):
        """Create state without total (indeterminate progress)."""
        state = ProgressState(
            phase="downloading",
            completed=1024,
            total=None
        )

        assert state.total is None
        assert state.progress_ratio is None
        assert state.progress_percent is None

    def test_progress_ratio_calculation(self):
        """Test progress ratio is clamped to 0-1."""
        assert ProgressState("test", 0, 100).progress_ratio == 0.0
        assert ProgressState("test", 50, 100).progress_ratio == 0.5
        assert ProgressState("test", 100, 100).progress_ratio == 1.0

    def test_progress_ratio_zero_total(self):
        """Zero total should return None to avoid division by zero."""
        state = ProgressState("test", 50, 0)
        assert state.progress_ratio is None

    def test_progress_percent_rounding(self):
        """Test percentage is integer 0-100."""
        assert ProgressState("test", 33, 100).progress_percent == 33
        assert ProgressState("test", 1, 3).progress_percent == 33  # 0.333...

    def test_progress_phase_enum(self):
        """Test ProgressPhase enum values."""
        assert ProgressPhase.ELF_PARSING.value == "parsing_elf"
        assert ProgressPhase.ENTROPY_ANALYSIS.value == "calculating_entropy"


class TestSilentProgressCallback:
    """Test SilentProgressCallback behavior."""

    def test_is_progress_callback(self):
        """Silent callback should be a ProgressCallback instance."""
        callback = SilentProgressCallback()
        assert isinstance(callback, ProgressCallback)

    def test_start_does_nothing(self):
        """start() should safely do nothing."""
        callback = SilentProgressCallback()
        callback.start(total=100, message="Starting")
        # No exception raised

    def test_update_does_nothing(self):
        """update() should safely do nothing."""
        callback = SilentProgressCallback()
        callback.update(completed=50, message="Halfway")
        # No exception raised

    def test_complete_does_nothing(self):
        """complete() should safely do nothing."""
        callback = SilentProgressCallback()
        callback.complete(message="Done")
        # No exception raised

    def test_set_phase_does_nothing(self):
        """set_phase() should safely do nothing."""
        callback = SilentProgressCallback()
        callback.set_phase("parsing", "Parsing ELF")
        # No exception raised

    def test_not_interactive(self):
        """Silent callback should report as non-interactive."""
        callback = SilentProgressCallback()
        assert not callback.is_interactive()

    def test_no_eta_support(self):
        """Silent callback should not support ETA."""
        callback = SilentProgressCallback()
        assert not callback.supports_eta()

    def test_silent_module_singleton(self):
        """SILENT module constant should be SilentProgressCallback."""
        assert isinstance(SILENT, SilentProgressCallback)


class TestConsoleProgressCallback:
    """Test ConsoleProgressCallback behavior."""

    def test_is_progress_callback(self):
        """Console callback should be a ProgressCallback instance."""
        callback = ConsoleProgressCallback()
        assert isinstance(callback, ProgressCallback)

    def test_initializes_with_defaults(self):
        """Should initialize with default values."""
        callback = ConsoleProgressCallback()

        assert callback._file == sys.stderr
        assert callback._show_eta is True
        assert callback._show_phase is True
        assert callback._enabled is False  # No TTY in tests

    def test_custom_file_output(self):
        """Should accept custom output file."""
        output = io.StringIO()
        callback = ConsoleProgressCallback(file=output)
        assert callback._file is output

    def test_disable_eta_option(self):
        """Should allow disabling ETA display."""
        callback = ConsoleProgressCallback(show_eta=False)
        assert not callback._show_eta

    def test_disable_phase_option(self):
        """Should allow disabling phase display."""
        callback = ConsoleProgressCallback(show_phase=False)
        assert not callback._show_phase

    def test_start_initializes_state(self):
        """start() should initialize progress state."""
        callback = ConsoleProgressCallback()
        callback.start(total=100, message="Starting")

        assert callback._total == 100
        assert callback._completed == 0
        assert callback._message == "Starting"
        assert callback._phase == "initializing"
        assert callback._start_time > 0

    def test_start_indeterminate(self):
        """start() should handle indeterminate progress (no total)."""
        callback = ConsoleProgressCallback()
        callback.start(total=None)

        assert callback._total is None
        assert callback._completed == 0

    def test_update_increments_progress(self):
        """update() should change completed count."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)
        callback.update(50, message="Halfway")

        assert callback._completed == 50
        assert callback._message == "Halfway"

    def test_update_preserves_message_if_not_provided(self):
        """update() should keep existing message if none provided."""
        callback = ConsoleProgressCallback()
        callback.start(total=100, message="Original")
        callback.update(50)

        assert callback._message == "Original"

    def test_complete_sets_completed_to_total(self):
        """complete() should set completed to total."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)
        callback.update(75)
        callback.complete()

        assert callback._completed == 100

    def test_complete_indeterminate(self):
        """complete() should handle indeterminate progress."""
        callback = ConsoleProgressCallback()
        callback.start(total=None)
        callback.complete()

        # Should not raise
        assert callback._total is None

    def test_complete_sets_message(self):
        """complete() should set final message."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)
        callback.complete(message="All done")

        assert callback._message == "All done"

    def test_set_phase_changes_phase(self):
        """set_phase() should change phase."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)
        callback.set_phase("parsing", "Parsing ELF")

        assert callback._phase == "parsing"
        assert callback._message == "Parsing ELF"

    def test_set_phase_preserves_message(self):
        """set_phase() should preserve message if not provided."""
        callback = ConsoleProgressCallback()
        callback.start(total=100, message="Original")
        callback.set_phase("new_phase")

        assert callback._phase == "new_phase"
        assert callback._message == "Original"

    def test_progress_ratio_property(self):
        """progress_ratio property should calculate correctly."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)

        callback.update(0)
        assert callback.progress_ratio == 0.0

        callback.update(50)
        assert callback.progress_ratio == 0.5

        callback.update(100)
        assert callback.progress_ratio == 1.0

    def test_progress_ratio_clamps(self):
        """progress_ratio should clamp values to 0-1."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)

        # These would be out of bounds if not clamped
        callback._completed = -10
        assert callback.progress_ratio == 0.0

        callback._completed = 150
        assert callback.progress_ratio == 1.0

    def test_progress_ratio_indeterminate(self):
        """progress_ratio should return None for indeterminate."""
        callback = ConsoleProgressCallback()
        callback.start(total=None)

        assert callback.progress_ratio is None

    def test_percent_calculation(self):
        """_percent() should calculate integer percentage."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)

        callback._completed = 0
        assert callback._percent() == 0

        callback._completed = 33
        assert callback._percent() == 33

        callback._completed = 100
        assert callback._percent() == 100

    def test_percent_clamps(self):
        """_percent() should clamp to 0-100."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)

        callback._completed = -10
        assert callback._percent() == 0

        callback._completed = 150
        assert callback._percent() == 100

    def test_calculate_eta(self):
        """_calculate_eta() should estimate remaining time."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)

        # Simulate some progress
        callback._completed = 25

        # Mock start time for predictable ETA
        callback._start_time = time.time() - 1.0  # 1 second elapsed

        eta = callback._calculate_eta()
        assert eta is not None
        # Should be around 3 seconds remaining (75% at current rate)

    def test_calculate_eta_zero_complete(self):
        """ETA should be None when no progress made."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)

        eta = callback._calculate_eta()
        assert eta is None

    def test_calculate_eta_indeterminate(self):
        """ETA should be None for indeterminate progress."""
        callback = ConsoleProgressCallback()
        callback.start(total=None)

        eta = callback._calculate_eta()
        assert eta is None

    def test_format_seconds(self):
        """_format_seconds() should format time correctly."""
        callback = ConsoleProgressCallback()

        assert callback._format_seconds(0) == "0:00"
        assert callback._format_seconds(59) == "0:59"
        assert callback._format_seconds(60) == "1:00"
        assert callback._format_seconds(61) == "1:01"
        assert callback._format_seconds(359) == "5:59"
        assert callback._format_seconds(360) == "6:00"

    def test_format_seconds_negative(self):
        """Negative seconds should format as 0:00."""
        callback = ConsoleProgressCallback()
        assert callback._format_seconds(-1) == "0:00"

    def test_make_bar(self):
        """_make_bar() should generate progress bar."""
        callback = ConsoleProgressCallback()
        callback.start(total=100)

        callback._completed = 0
        bar = callback._make_bar()
        assert bar == "░" * 30  # All empty

        callback._completed = 50
        bar = callback._make_bar()
        assert bar == "█" * 15 + "░" * 15  # Half filled

        callback._completed = 100
        bar = callback._make_bar()
        assert bar == "█" * 30  # All filled

    def test_make_bar_indeterminate(self):
        """Bar should show question marks when indeterminate."""
        callback = ConsoleProgressCallback()
        callback.start(total=None)

        bar = callback._make_bar()
        assert bar == "?" * 30

    def test_format_line_determinate(self):
        """_format_line() should format complete line."""
        callback = ConsoleProgressCallback()
        callback.start(total=100, message="Test message")
        callback._completed = 50
        callback._phase = "processing"

        line = callback._format_line()

        # Should contain bar, percent, ETA, phase, and message
        assert "[" in line
        assert "]" in line
        assert "50%" in line
        assert "processing" in line
        assert "Test message" in line

    def test_format_line_indeterminate(self):
        """Indeterminate line should show spinner."""
        callback = ConsoleProgressCallback()
        callback.start(total=None)
        callback._phase = "downloading"

        line = callback._format_line()

        # Should have spinner in brackets
        assert "[" in line
        assert "]" in line
        assert "downloading" in line

    def test_is_interactive(self):
        """is_interactive() should reflect TTY status."""
        callback = ConsoleProgressCallback()
        # Default (no TTY) should be False in tests
        assert not callback.is_interactive()

    def test_supports_eta_reflects_config(self):
        """supports_eta() should reflect configuration."""
        assert ConsoleProgressCallback(show_eta=True).supports_eta()
        assert not ConsoleProgressCallback(show_eta=False).supports_eta()


class TestCliProgressCallbackFactory:
    """Test cli_progress_callback factory function."""

    def test_returns_progress_callback(self):
        """Should always return a ProgressCallback instance."""
        callback = cli_progress_callback()
        assert isinstance(callback, ProgressCallback)

    def test_force_enable_returns_console(self):
        """force_enable=True should return ConsoleProgressCallback."""
        callback = cli_progress_callback(force_enable=True)
        assert isinstance(callback, ConsoleProgressCallback)

    def test_custom_file_with_force(self):
        """Should pass custom file to ConsoleProgressCallback."""
        output = io.StringIO()
        callback = cli_progress_callback(force_enable=True, file=output)
        assert isinstance(callback, ConsoleProgressCallback)
        assert callback._file is output

    @patch('sys.stderr')
    def test_tty_detection_returns_console(self, mock_stderr):
        """TTY detection should return ConsoleProgressCallback."""
        mock_stderr.isatty.return_value = True

        callback = cli_progress_callback(file=mock_stderr)
        assert isinstance(callback, ConsoleProgressCallback)

    @patch('sys.stderr')
    def test_non_tty_returns_silent(self, mock_stderr):
        """Non-TTY should return SilentProgressCallback."""
        mock_stderr.isatty.return_value = False

        callback = cli_progress_callback(file=mock_stderr)
        assert isinstance(callback, SilentProgressCallback)

    def test_default_no_tty_returns_silent(self):
        """Without TTY, should return SilentProgressCallback."""
        # sys.stderr in pytest is not a TTY
        callback = cli_progress_callback()
        assert isinstance(callback, SilentProgressCallback)


class TestProgressCallbackIntegration:
    """Integration tests with mock TTY output."""

    def test_full_workflow_determinate(self):
        """Test complete workflow with determinate progress."""
        output = io.StringIO()
        callback = ConsoleProgressCallback(
            file=output,
            show_eta=False  # Disable for consistent testing
        )

        # Start operation
        callback.start(total=100, message="Starting process")
        assert callback._total == 100

        # Progress through phases
        callback.set_phase("parsing", "Parsing input")
        callback.update(25)

        callback.set_phase("processing", "Processing data")
        callback.update(50)

        callback.set_phase("rendering", "Rendering output")
        callback.update(75)

        # Complete
        callback.complete(message="Process complete")
        assert callback._completed == 100

    def test_full_workflow_indeterminate(self):
        """Test complete workflow with indeterminate progress."""
        output = io.StringIO()
        callback = ConsoleProgressCallback(
            file=output,
            show_eta=False
        )

        # Start without total
        callback.start(total=None, message="Downloading")
        assert callback._total is None

        # Update with arbitrary values
        callback.update(1024)
        callback.update(2048)
        callback.update(4096)

        # Complete
        callback.complete(message="Download complete")

    def test_phase_transitions(self):
        """Test phase transitions maintain progress state."""
        callback = ConsoleProgressCallback(show_eta=False)

        callback.start(total=100)
        callback.update(30)

        # Change phase - should preserve progress
        callback.set_phase("new_phase")
        assert callback._completed == 30
        assert callback._phase == "new_phase"

    def test_message_updates(self):
        """Test message updates work correctly."""
        callback = ConsoleProgressCallback(show_eta=False)

        callback.start(total=100, message="Initial")
        assert callback._message == "Initial"

        callback.update(25, "Updated")
        assert callback._message == "Updated"

        callback.update(50)  # No message - should preserve
        assert callback._message == "Updated"

        callback.set_phase("phase", "Phase message")
        assert callback._message == "Phase message"

    def test_multiple_operations(self):
        """Test running multiple operations sequentially."""
        callback = ConsoleProgressCallback(show_eta=False)

        # First operation
        callback.start(total=50, message="Op 1")
        callback.update(25)
        callback.complete()

        # Second operation
        callback.start(total=100, message="Op 2")
        callback.update(50)
        callback.complete()

        # Should work without errors

    def test_eta_accuracy_simulation(self):
        """Test ETA calculation with simulated work."""
        callback = ConsoleProgressCallback(show_eta=True)

        output = io.StringIO()
        callback._file = output
        callback._enabled = True  # Force enable

        callback.start(total=100)

        # Simulate some work
        start = time.time()
        callback._completed = 25
        callback._start_time = start - 0.5  # 500ms elapsed

        eta_str = callback._calculate_eta()
        assert eta_str is not None

        # At 25% in 0.5s, remaining ~1.5s
        # Should format as M:SS
        assert ":" in eta_str


class TestProgressPhaseConstants:
    """Test ProgressPhase enum for blueprint analysis."""

    def test_all_phases_defined(self):
        """All expected phases should be defined."""
        expected = [
            "INIT",
            "ELF_PARSING",
            "ENTROPY_ANALYSIS",
            "COMPONENT_DETECTION",
            "HILBERT_MAPPING",
            "MEMORY_INFERENCE",
            "FINALIZATION"
        ]

        for phase_name in expected:
            assert hasattr(ProgressPhase, phase_name)

    def test_phase_values_are_strings(self):
        """Phase values should be usable as strings."""
        assert ProgressPhase.ENTROPY_ANALYSIS.value == "calculating_entropy"
        assert ProgressPhase.ELF_PARSING.value == "parsing_elf"


class TestBlueprintAnalyzerProgressIntegration:
    """Test progress callback integration with BlueprintAnalyzer."""

    def test_analyzer_accepts_progress_callback(self):
        """Analyzer should accept progress callback in constructor."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        callback = SilentProgressCallback()
        analyzer = BlueprintAnalyzer(progress_callback=callback)

        assert analyzer._progress is callback

    def test_analyzer_works_without_progress_callback(self):
        """Analyzer should work without progress callback."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        analyzer = BlueprintAnalyzer()
        assert analyzer._progress is None

    def test_analyze_with_progress_callback(self):
        """Analyze should call progress callback methods."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        # Mock callback
        callback = Mock(spec=ProgressCallback)
        callback.start = Mock()
        callback.update = Mock()
        callback.complete = Mock()
        callback.set_phase = Mock()

        analyzer = BlueprintAnalyzer(progress_callback=callback)

        # Create test data (simple pattern)
        test_data = bytes(range(256)) * 100  # 25KB of data

        blueprint = analyzer.analyze(
            test_data,
            system_name="test",
            system_type="kernel"
        )

        # Verify callback was called
        assert callback.set_phase.called
        assert callback.complete.called

        # Verify blueprint was created
        assert blueprint.system_name == "test"
        assert blueprint.system_type == "kernel"

    def test_entropy_analysis_reports_progress(self):
        """Entropy analysis should report progress updates."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        callback = Mock(spec=ProgressCallback)
        callback.start = Mock()
        callback.update = Mock()
        callback.complete = Mock()
        callback.set_phase = Mock()

        analyzer = BlueprintAnalyzer(progress_callback=callback)

        # Create data that will generate multiple entropy windows
        test_data = bytes(range(256)) * 100  # 25KB, should have multiple 4KB windows

        regions = analyzer.calculate_entropy_regions(test_data)

        # Verify progress was reported
        assert callback.set_phase.called or callback.start.called
        assert len(regions) > 1  # Should have multiple regions

    def test_console_progress_with_large_file(self):
        """Test console progress with simulated large file."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        output = io.StringIO()
        callback = ConsoleProgressCallback(
            file=output,
            show_eta=False
        )
        callback._enabled = True  # Force enable for testing

        analyzer = BlueprintAnalyzer(progress_callback=callback)

        # Simulate large file (100KB)
        test_data = bytes(range(256)) * 400

        blueprint = analyzer.analyze(
            test_data,
            system_name="large_test"
        )

        assert blueprint.system_name == "large_test"
        assert len(blueprint.components) > 0

    def test_progress_emitter_helpers(self):
        """Test _emit_* helper methods work correctly."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        callback = Mock()
        analyzer = BlueprintAnalyzer(progress_callback=callback)

        # Test _emit_phase
        analyzer._emit_phase("test_phase", "Test message")
        callback.set_phase.assert_called_with("test_phase", "Test message")

        # Test _emit_update
        analyzer._emit_update(50, "Half done")
        callback.update.assert_called_with(50, "Half done")

        # Test _emit_complete
        analyzer._emit_complete("Finished")
        callback.complete.assert_called_with("Finished")

    def test_null_progress_callbacks_safe(self):
        """Methods should be safe when callback is None."""
        from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

        analyzer = BlueprintAnalyzer(progress_callback=None)

        # These should not raise exceptions
        analyzer._emit_phase("test", "Test")
        analyzer._emit_update(50, "Half")
        analyzer._emit_complete("Done")
