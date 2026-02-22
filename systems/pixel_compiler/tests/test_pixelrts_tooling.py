"""
Tests for PixelRTS v2 Developer Tooling Module

Tests unified CLI, visual inspector, memory profiler, debugger,
hot reload, documentation generator, and interactive shell.
"""

import pytest
import sys
import tempfile
import os
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_tooling import (
    LogLevel,
    BreakpointType,
    Breakpoint,
    MemoryAllocation,
    WatchVariable,
    UnifiedCLI,
    VisualInspector,
    MemoryProfiler,
    Debugger,
    HotReloader,
    DocumentationGenerator,
    InteractiveShell,
    ToolingManager,
    create_tooling_manager
)


class TestLogLevel:
    """Test log level enumeration."""

    def test_level_ordering(self):
        """Levels should be ordered correctly."""
        assert LogLevel.DEBUG.value < LogLevel.INFO.value
        assert LogLevel.INFO.value < LogLevel.WARNING.value
        assert LogLevel.WARNING.value < LogLevel.ERROR.value
        assert LogLevel.ERROR.value < LogLevel.CRITICAL.value


class TestBreakpoint:
    """Test breakpoint data structure."""

    def test_breakpoint_creation(self):
        """Breakpoint should be created correctly."""
        bp = Breakpoint(
            bp_id=0,
            bp_type=BreakpointType.EXECUTION,
            location="0x1000"
        )
        assert bp.bp_id == 0
        assert bp.enabled == True
        assert bp.hit_count == 0

    def test_breakpoint_to_dict(self):
        """Breakpoint should serialize correctly."""
        bp = Breakpoint(
            bp_id=1,
            bp_type=BreakpointType.FUNCTION,
            location="main",
            condition="x > 5",
            hit_count=3
        )
        d = bp.to_dict()
        assert d['bp_id'] == 1
        assert d['bp_type'] == 'FUNCTION'
        assert d['condition'] == "x > 5"


class TestMemoryAllocation:
    """Test memory allocation data structure."""

    def test_allocation_creation(self):
        """Allocation should be created correctly."""
        alloc = MemoryAllocation(
            alloc_id=0,
            address=0x1000,
            size=4096,
            timestamp=0.0
        )
        assert alloc.alloc_id == 0
        assert alloc.freed == False

    def test_lifetime_unfreed(self):
        """Unfreed allocation should have ongoing lifetime."""
        alloc = MemoryAllocation(
            alloc_id=0,
            address=0x1000,
            size=4096,
            timestamp=time.time() - 10
        )
        assert alloc.lifetime() >= 10

    def test_lifetime_freed(self):
        """Freed allocation should have fixed lifetime."""
        alloc = MemoryAllocation(
            alloc_id=0,
            address=0x1000,
            size=4096,
            timestamp=0.0,
            freed=True,
            freed_timestamp=5.0
        )
        assert alloc.lifetime() == 5.0


import time  # For lifetime tests


class TestWatchVariable:
    """Test watch variable data structure."""

    def test_watch_creation(self):
        """Watch variable should be created correctly."""
        wv = WatchVariable(
            name="counter",
            value=42,
            var_type="int"
        )
        assert wv.name == "counter"
        assert wv.value == 42

    def test_watch_to_dict(self):
        """Watch variable should serialize correctly."""
        wv = WatchVariable(
            name="data",
            value=[1, 2, 3],
            var_type="list"
        )
        d = wv.to_dict()
        assert d['name'] == "data"
        assert d['type'] == "list"


class TestUnifiedCLI:
    """Test unified CLI."""

    def test_cli_creation(self):
        """CLI should be created correctly."""
        cli = UnifiedCLI()
        assert len(cli.COMMANDS) > 0

    def test_parser_creation(self):
        """Parser should be created with all commands."""
        cli = UnifiedCLI()
        assert cli.parser is not None

    def test_no_command_shows_help(self):
        """No command should show help."""
        cli = UnifiedCLI()
        result = cli.run([])
        assert result == 0

    def test_unknown_command_fails(self):
        """Unknown command should fail."""
        cli = UnifiedCLI()
        result = cli.run(['unknown_command'])
        # argparse returns exit code 2 for invalid arguments
        assert result == 2

    def test_register_handler(self):
        """Should register command handlers."""
        cli = UnifiedCLI()

        def handler(args):
            return 0

        cli.register_handler('test', handler)
        assert 'test' in cli._command_handlers

    def test_verbose_flag(self):
        """Verbose flag should change log level."""
        cli = UnifiedCLI()
        cli.run(['-v', 'info', 'test.png'])
        assert cli._log_level == LogLevel.DEBUG

    def test_quiet_flag(self):
        """Quiet flag should change log level."""
        cli = UnifiedCLI()
        cli.run(['-q', 'info', 'test.png'])
        assert cli._log_level == LogLevel.ERROR


class TestVisualInspector:
    """Test visual pixel inspector."""

    def test_inspector_creation(self):
        """Inspector should be created correctly."""
        inspector = VisualInspector()
        assert inspector._image_data is None

    def test_get_pixel_no_image(self):
        """Should return None without image."""
        inspector = VisualInspector()
        result = inspector.get_pixel(0, 0)
        assert result is None

    def test_get_stats(self):
        """Should return inspector statistics."""
        inspector = VisualInspector()
        stats = inspector.get_stats()

        assert 'queries' in stats
        assert 'image_size' in stats

    def test_analyze_region(self):
        """Should analyze region."""
        inspector = VisualInspector()
        # Without image, returns zeros
        result = inspector.analyze_region(0, 0, 10, 10)

        assert 'region' in result
        assert 'mean' in result


class TestMemoryProfiler:
    """Test memory profiler."""

    def test_profiler_creation(self):
        """Profiler should be created correctly."""
        profiler = MemoryProfiler()
        assert len(profiler._allocations) == 0

    def test_allocate(self):
        """Should track allocations."""
        profiler = MemoryProfiler()
        alloc = profiler.allocate(4096)

        assert alloc.alloc_id == 0
        assert alloc.size == 4096
        assert alloc.freed == False
        assert profiler._stats['total_allocations'] == 1

    def test_free(self):
        """Should track deallocations."""
        profiler = MemoryProfiler()
        alloc = profiler.allocate(4096)

        result = profiler.free(alloc.alloc_id)

        assert result == True
        assert alloc.freed == True
        assert profiler._stats['total_freed'] == 1

    def test_free_unknown(self):
        """Should fail to free unknown allocation."""
        profiler = MemoryProfiler()
        result = profiler.free(999)
        assert result == False

    def test_detect_leaks(self):
        """Should detect memory leaks."""
        profiler = MemoryProfiler(leak_threshold_seconds=0.0)
        profiler.allocate(4096)

        leaks = profiler.detect_leaks()
        assert len(leaks) == 1

    def test_detect_no_leaks(self):
        """Should not detect freed allocations as leaks."""
        profiler = MemoryProfiler(leak_threshold_seconds=0.0)
        alloc = profiler.allocate(4096)
        profiler.free(alloc.alloc_id)

        leaks = profiler.detect_leaks()
        assert len(leaks) == 0

    def test_get_allocation_heatmap(self):
        """Should generate allocation heatmap."""
        profiler = MemoryProfiler()
        profiler.allocate(4096, address=0x1000)

        heatmap = profiler.get_allocation_heatmap()
        assert len(heatmap) > 0

    def test_get_report(self):
        """Should generate memory report."""
        profiler = MemoryProfiler()
        profiler.allocate(4096)

        report = profiler.get_report()

        assert 'stats' in report
        assert 'leaks' in report
        assert 'heatmap' in report


class TestDebugger:
    """Test debugger."""

    def test_debugger_creation(self):
        """Debugger should be created correctly."""
        debugger = Debugger()
        assert len(debugger._breakpoints) == 0

    def test_add_breakpoint(self):
        """Should add breakpoints."""
        debugger = Debugger()
        bp = debugger.add_breakpoint(BreakpointType.EXECUTION, "0x1000")

        assert bp.bp_id == 0
        assert bp.location == "0x1000"
        assert len(debugger._breakpoints) == 1

    def test_remove_breakpoint(self):
        """Should remove breakpoints."""
        debugger = Debugger()
        bp = debugger.add_breakpoint(BreakpointType.EXECUTION, "0x1000")

        result = debugger.remove_breakpoint(bp.bp_id)

        assert result == True
        assert len(debugger._breakpoints) == 0

    def test_enable_breakpoint(self):
        """Should enable/disable breakpoints."""
        debugger = Debugger()
        bp = debugger.add_breakpoint(BreakpointType.EXECUTION, "0x1000")

        debugger.enable_breakpoint(bp.bp_id, False)
        assert debugger._breakpoints[bp.bp_id].enabled == False

    def test_check_breakpoint(self):
        """Should trigger matching breakpoint."""
        debugger = Debugger()
        debugger.add_breakpoint(BreakpointType.EXECUTION, "0x1000")

        triggered = debugger.check_breakpoint("0x1000")

        assert triggered is not None
        assert triggered.hit_count == 1

    def test_check_breakpoint_disabled(self):
        """Should not trigger disabled breakpoint."""
        debugger = Debugger()
        bp = debugger.add_breakpoint(BreakpointType.EXECUTION, "0x1000")
        debugger.enable_breakpoint(bp.bp_id, False)

        triggered = debugger.check_breakpoint("0x1000")

        assert triggered is None

    def test_watch_variable(self):
        """Should add variables to watch list."""
        debugger = Debugger()
        debugger.watch_variable("x", 42, "int")

        watches = debugger.get_watch_list()
        assert len(watches) == 1
        assert watches[0].name == "x"

    def test_unwatch_variable(self):
        """Should remove variables from watch list."""
        debugger = Debugger()
        debugger.watch_variable("x", 42)
        debugger.unwatch_variable("x")

        watches = debugger.get_watch_list()
        assert len(watches) == 0

    def test_step_into(self):
        """Should track step operations."""
        debugger = Debugger()
        debugger.step_into()

        assert debugger._stats['steps_taken'] == 1

    def test_continue_execution(self):
        """Should continue execution."""
        debugger = Debugger()
        debugger.continue_execution()

        assert debugger._execution_state['running'] == True

    def test_pause(self):
        """Should pause execution."""
        debugger = Debugger()
        debugger.pause()

        assert debugger._execution_state['paused'] == True

    def test_get_state(self):
        """Should return debugger state."""
        debugger = Debugger()
        state = debugger.get_state()

        assert 'execution_state' in state
        assert 'breakpoints' in state
        assert 'stats' in state


class TestHotReloader:
    """Test hot reload system."""

    def test_reloader_creation(self):
        """Reloader should be created correctly."""
        reloader = HotReloader()
        assert len(reloader._file_hashes) == 0

    def test_watch_file(self):
        """Should watch files."""
        reloader = HotReloader()

        with tempfile.NamedTemporaryFile(delete=False) as f:
            f.write(b'test content')
            f.flush()

            result = reloader.watch_file(f.name)

            os.unlink(f.name)
            assert result == True

    def test_check_changes(self):
        """Should detect file changes."""
        reloader = HotReloader()

        with tempfile.NamedTemporaryFile(delete=False, mode='w') as f:
            f.write('initial content')
            f.flush()
            path = f.name

        reloader.watch_file(path)

        # Modify file
        with open(path, 'w') as f:
            f.write('modified content')

        changed = reloader.check_changes()
        os.unlink(path)

        assert path in changed

    def test_reload(self):
        """Should reload files."""
        reloader = HotReloader()
        callback_called = []

        def callback(path, content):
            callback_called.append(path)

        with tempfile.NamedTemporaryFile(delete=False) as f:
            f.write(b'test')
            f.flush()
            path = f.name

        reloader.watch_file(path, callback)
        reloader.reload(path)

        os.unlink(path)
        assert len(callback_called) == 1

    def test_get_stats(self):
        """Should return reload statistics."""
        reloader = HotReloader()
        stats = reloader.get_stats()

        assert 'reloads' in stats
        assert 'watched_files' in stats


class TestDocumentationGenerator:
    """Test documentation generator."""

    def test_generator_creation(self):
        """Generator should be created correctly."""
        gen = DocumentationGenerator()
        assert len(gen._templates) == 3

    def test_generate_markdown(self):
        """Should generate markdown documentation."""
        gen = DocumentationGenerator()
        metadata = {
            'format': 'PixelRTS-2.0',
            'grid_size': 1024,
            'config': {'root_device': '/dev/sda1'}
        }

        doc = gen.generate(metadata, format='markdown')

        assert '# PixelRTS Documentation' in doc
        assert 'PixelRTS-2.0' in doc

    def test_generate_html(self):
        """Should generate HTML documentation."""
        gen = DocumentationGenerator()
        metadata = {'format': 'PixelRTS-2.0'}

        doc = gen.generate(metadata, format='html')

        assert '<!DOCTYPE html>' in doc
        assert '<title>' in doc

    def test_generate_json(self):
        """Should generate JSON documentation."""
        gen = DocumentationGenerator()
        metadata = {'format': 'PixelRTS-2.0'}

        doc = gen.generate(metadata, format='json')

        parsed = json.loads(doc)
        assert 'title' in parsed
        assert 'metadata' in parsed


import json


class TestInteractiveShell:
    """Test interactive shell."""

    def test_shell_creation(self):
        """Shell should be created correctly."""
        shell = InteractiveShell()
        assert len(shell._commands) > 0

    def test_execute_help(self):
        """Help command should work."""
        shell = InteractiveShell()
        result = shell.execute('help')

        assert 'Available commands' in result

    def test_execute_quit(self):
        """Quit command should stop shell."""
        shell = InteractiveShell()
        result = shell.execute('quit')

        assert 'Goodbye' in result
        assert shell._running == False

    def test_execute_info(self):
        """Info command should work."""
        shell = InteractiveShell()
        result = shell.execute('info')

        assert 'variables' in result

    def test_variable_assignment(self):
        """Should assign variables."""
        shell = InteractiveShell()
        result = shell.execute('x = 42')

        assert 'x = 42' in result
        assert shell._variables['x'] == 42

    def test_variable_read(self):
        """Should read variables."""
        shell = InteractiveShell()
        shell.execute('x = 42')
        result = shell.execute('x')

        assert '42' in result

    def test_expression_evaluation(self):
        """Should evaluate expressions."""
        shell = InteractiveShell()
        shell.execute('x = 10')
        result = shell.execute('x + 5')

        assert '15' in result

    def test_unknown_command(self):
        """Should handle unknown commands."""
        shell = InteractiveShell()
        result = shell.execute('unknown_cmd')

        assert 'Unknown command' in result

    def test_get_stats(self):
        """Should return shell statistics."""
        shell = InteractiveShell()
        shell.execute('x = 1')
        shell.execute('y = 2')

        stats = shell.get_stats()
        assert stats['commands_executed'] >= 2


class TestToolingManager:
    """Test tooling manager."""

    def test_manager_creation(self):
        """Manager should be created correctly."""
        manager = ToolingManager()
        assert manager.cli is not None
        assert manager.inspector is not None
        assert manager.profiler is not None

    def test_get_all_stats(self):
        """Should return all tool statistics."""
        manager = ToolingManager()
        stats = manager.get_all_stats()

        assert 'inspector' in stats
        assert 'profiler' in stats
        assert 'debugger' in stats


class TestCreateToolingManager:
    """Test tooling manager factory."""

    def test_create(self):
        """Should create tooling manager."""
        manager = create_tooling_manager()
        assert isinstance(manager, ToolingManager)


class TestIntegration:
    """Integration tests for tooling."""

    def test_full_debugging_workflow(self):
        """Test complete debugging workflow."""
        debugger = Debugger()

        # Add breakpoints
        bp1 = debugger.add_breakpoint(BreakpointType.EXECUTION, "0x1000")
        bp2 = debugger.add_breakpoint(BreakpointType.FUNCTION, "main")

        # Watch variables
        debugger.watch_variable("counter", 0)
        debugger.watch_variable("name", "test")

        # Simulate execution
        debugger.continue_execution()

        # Check breakpoint
        triggered = debugger.check_breakpoint("0x1000")
        assert triggered is not None

        # Step through
        debugger.step_into()
        debugger.step_over()

        # Get final state
        state = debugger.get_state()
        assert state['stats']['steps_taken'] >= 2
        assert state['stats']['breakpoints_hit'] >= 1

    def test_full_profiling_workflow(self):
        """Test complete profiling workflow."""
        profiler = MemoryProfiler(leak_threshold_seconds=0.0)

        # Simulate allocations
        allocs = []
        for i in range(10):
            allocs.append(profiler.allocate(4096, address=i * 4096))

        # Free half
        for alloc in allocs[:5]:
            profiler.free(alloc.alloc_id)

        # Detect leaks
        leaks = profiler.detect_leaks()
        assert len(leaks) == 5

        # Get report
        report = profiler.get_report()
        assert report['stats']['current_allocations'] == 5

    def test_full_documentation_workflow(self):
        """Test documentation generation workflow."""
        gen = DocumentationGenerator()

        metadata = {
            'format': 'PixelRTS-2.0',
            'grid_size': 2048,
            'encoding': {'type': 'RGBA-dense'},
            'kernel': {'offset': 0, 'size': 8192, 'hash': 'abc123'},
            'config': {'root_device': '/dev/sda1'}
        }

        # Generate all formats
        md_doc = gen.generate(metadata, format='markdown')
        html_doc = gen.generate(metadata, format='html')
        json_doc = gen.generate(metadata, format='json')

        assert 'PixelRTS-2.0' in md_doc
        assert '<!DOCTYPE html>' in html_doc
        assert json.loads(json_doc)['metadata'] == metadata
