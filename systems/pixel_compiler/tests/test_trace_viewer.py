"""
Tests for TraceVisualizer - PixelRTS Visual Debugger

Tests the visualization components for execution traces.
"""

import pytest
import numpy as np
import json
import tempfile
from pathlib import Path
from systems.pixel_compiler.trace_viewer import TraceEntry, TraceVisualizer


class TestTraceEntry:
    """Tests for TraceEntry dataclass"""

    def test_trace_entry_creation(self):
        """Test creating a basic trace entry"""
        entry = TraceEntry(
            pc=0,
            opcode=0x64,  # ADD
            dest=1,
            src=2,
            immediate=0
        )
        assert entry.pc == 0
        assert entry.opcode == 0x64
        assert entry.dest == 1
        assert entry.src == 2
        assert entry.immediate == 0

    def test_opcode_name_add(self):
        """Test opcode name for ADD instruction"""
        entry = TraceEntry(pc=0, opcode=0x64, dest=1, src=2, immediate=0)
        assert entry.opcode_name == "ADD"

    def test_opcode_name_mul(self):
        """Test opcode name for MUL instruction"""
        entry = TraceEntry(pc=1, opcode=0x66, dest=1, src=2, immediate=0)
        assert entry.opcode_name == "MUL"

    def test_opcode_name_load(self):
        """Test opcode name for LOAD instruction"""
        entry = TraceEntry(pc=2, opcode=0x0A, dest=1, src=0, immediate=42)
        assert entry.opcode_name == "LOAD"

    def test_opcode_name_nop(self):
        """Test opcode name for NOP instruction"""
        entry = TraceEntry(pc=3, opcode=0x00, dest=0, src=0, immediate=0)
        assert entry.opcode_name == "NOP"

    def test_opcode_name_unknown(self):
        """Test opcode name for unknown instruction"""
        entry = TraceEntry(pc=4, opcode=0xFF, dest=0, src=0, immediate=0)
        assert entry.opcode_name == "UNKNOWN_0xFF"


class TestTraceVisualizerCreation:
    """Tests for TraceVisualizer initialization and basic operations"""

    def test_visualizer_creation_empty(self):
        """Test creating visualizer with empty trace"""
        visualizer = TraceVisualizer([])
        assert len(visualizer.trace) == 0
        assert visualizer.grid_size == 32

    def test_visualizer_creation_with_entries(self):
        """Test creating visualizer with trace entries"""
        entries = [
            TraceEntry(pc=0, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=1, opcode=0x66, dest=1, src=2, immediate=0),
        ]
        visualizer = TraceVisualizer(entries, grid_size=16)
        assert len(visualizer.trace) == 2
        assert visualizer.grid_size == 16

    def test_visualizer_creation_from_trace_buffer(self):
        """Test creating visualizer from raw trace buffer"""
        # Simulate trace buffer from WGSL: [pc, opcode, dest, src, imm, ...]
        trace_buffer = np.array([
            0, 0x64, 1, 2, 0,   # Entry 0: ADD
            1, 0x66, 1, 2, 0,   # Entry 1: MUL
            2, 0x0A, 1, 0, 42,  # Entry 2: LOAD
        ], dtype=np.uint32)
        visualizer = TraceVisualizer.from_trace_buffer(trace_buffer)
        assert len(visualizer.trace) == 3
        assert visualizer.trace[0].opcode_name == "ADD"
        assert visualizer.trace[1].opcode_name == "MUL"
        assert visualizer.trace[2].opcode_name == "LOAD"


class TestRenderHeatmap:
    """Tests for heatmap rendering"""

    def test_render_heatmap_empty(self):
        """Test heatmap with empty trace"""
        visualizer = TraceVisualizer([])
        heatmap = visualizer.render_heatmap()
        assert heatmap.shape == (32, 32)
        assert np.all(heatmap == 0)

    def test_render_heatmap_single_entry(self):
        """Test heatmap with single trace entry"""
        entries = [TraceEntry(pc=10, opcode=0x64, dest=1, src=2, immediate=0)]
        visualizer = TraceVisualizer(entries, grid_size=16)
        heatmap = visualizer.render_heatmap()
        assert heatmap.shape == (16, 16)
        assert heatmap[10 // 16, 10 % 16] == 1
        assert np.sum(heatmap) == 1

    def test_render_heatmap_multiple_entries(self):
        """Test heatmap with multiple entries at same location"""
        entries = [
            TraceEntry(pc=10, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=10, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=10, opcode=0x66, dest=1, src=2, immediate=0),
        ]
        visualizer = TraceVisualizer(entries, grid_size=16)
        heatmap = visualizer.render_heatmap()
        assert heatmap[10 // 16, 10 % 16] == 3

    def test_render_heatmap_scattered(self):
        """Test heatmap with scattered execution"""
        entries = [
            TraceEntry(pc=0, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=15, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=32, opcode=0x64, dest=1, src=2, immediate=0),
        ]
        visualizer = TraceVisualizer(entries, grid_size=16)
        heatmap = visualizer.render_heatmap()
        assert heatmap[0, 0] == 1      # pc=0 -> (0, 0)
        assert heatmap[0, 15] == 1     # pc=15 -> (0, 15)
        assert heatmap[2, 0] == 1      # pc=32 -> (2, 0)


class TestPlotHeatmap:
    """Tests for matplotlib heatmap plotting"""

    def test_plot_heatmap_returns_figure(self):
        """Test that plot_heatmap returns a matplotlib figure"""
        entries = [
            TraceEntry(pc=0, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=1, opcode=0x66, dest=1, src=2, immediate=0),
        ]
        visualizer = TraceVisualizer(entries)
        fig = visualizer.plot_heatmap()
        assert fig is not None
        # Check that figure has axes
        assert len(fig.axes) > 0

    def test_plot_heatmap_with_title(self):
        """Test plot_heatmap with custom title"""
        entries = [TraceEntry(pc=0, opcode=0x64, dest=1, src=2, immediate=0)]
        visualizer = TraceVisualizer(entries)
        fig = visualizer.plot_heatmap(title="Test Execution")
        assert fig is not None


class TestRenderTimeline:
    """Tests for timeline rendering"""

    def test_render_timeline_empty(self):
        """Test timeline with empty trace"""
        visualizer = TraceVisualizer([])
        timeline = visualizer.render_timeline()
        assert timeline.shape == (2, 0)  # 2 rows (pc, opcode), 0 columns

    def test_render_timeline_basic(self):
        """Test timeline with basic trace"""
        entries = [
            TraceEntry(pc=0, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=1, opcode=0x66, dest=1, src=2, immediate=0),
        ]
        visualizer = TraceVisualizer(entries)
        timeline = visualizer.render_timeline()
        assert timeline.shape == (2, 2)
        assert timeline[0, 0] == 0  # First PC
        assert timeline[0, 1] == 1  # Second PC
        assert timeline[1, 0] == 0x64  # First opcode
        assert timeline[1, 1] == 0x66  # Second opcode


class TestExportImportJSON:
    """Tests for JSON serialization"""

    def test_export_trace_json(self):
        """Test exporting trace to JSON"""
        entries = [
            TraceEntry(pc=0, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=1, opcode=0x66, dest=1, src=2, immediate=0),
        ]
        visualizer = TraceVisualizer(entries)

        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            temp_path = f.name

        try:
            visualizer.export_json(temp_path)

            # Verify file exists and has valid JSON
            assert Path(temp_path).exists()
            with open(temp_path, 'r') as f:
                data = json.load(f)

            assert 'trace' in data
            assert 'grid_size' in data
            assert len(data['trace']) == 2
            assert data['trace'][0]['pc'] == 0
            assert data['trace'][0]['opcode'] == 0x64
        finally:
            Path(temp_path).unlink(missing_ok=True)

    def test_load_json(self):
        """Test loading trace from JSON"""
        entries = [
            TraceEntry(pc=0, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=1, opcode=0x66, dest=1, src=2, immediate=0),
        ]
        original_visualizer = TraceVisualizer(entries, grid_size=16)

        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            temp_path = f.name

        try:
            original_visualizer.export_json(temp_path)
            loaded_visualizer = TraceVisualizer.load_json(temp_path)

            assert len(loaded_visualizer.trace) == 2
            assert loaded_visualizer.grid_size == 16
            assert loaded_visualizer.trace[0].pc == 0
            assert loaded_visualizer.trace[0].opcode == 0x64
        finally:
            Path(temp_path).unlink(missing_ok=True)


class TestCreateAnimation:
    """Tests for animation creation"""

    def test_create_animation_returns_object(self):
        """Test that create_animation returns an animation object"""
        entries = [
            TraceEntry(pc=i, opcode=0x64, dest=1, src=2, immediate=0)
            for i in range(10)
        ]
        visualizer = TraceVisualizer(entries, grid_size=8)
        anim = visualizer.create_animation(interval=50)
        assert anim is not None

    def test_create_animation_with_subset(self):
        """Test animation with frame skip"""
        entries = [
            TraceEntry(pc=i, opcode=0x64, dest=1, src=2, immediate=0)
            for i in range(100)
        ]
        visualizer = TraceVisualizer(entries, grid_size=16)
        anim = visualizer.create_animation(frame_skip=10)
        assert anim is not None


class TestStatistics:
    """Tests for trace statistics"""

    def test_instruction_counts(self):
        """Test counting instruction types"""
        entries = [
            TraceEntry(pc=0, opcode=0x64, dest=1, src=2, immediate=0),  # ADD
            TraceEntry(pc=1, opcode=0x66, dest=1, src=2, immediate=0),  # MUL
            TraceEntry(pc=2, opcode=0x64, dest=1, src=2, immediate=0),  # ADD
        ]
        visualizer = TraceVisualizer(entries)
        counts = visualizer.instruction_counts()
        assert counts.get('ADD', 0) == 2
        assert counts.get('MUL', 0) == 1

    def test_execution_coverage(self):
        """Test execution coverage calculation"""
        entries = [
            TraceEntry(pc=i, opcode=0x64, dest=1, src=2, immediate=0)
            for i in range(10)
        ]
        visualizer = TraceVisualizer(entries, grid_size=16)
        coverage = visualizer.execution_coverage()
        # 10 unique PCs out of 256 possible (16x16)
        assert coverage == pytest.approx(10.0 / 256.0)

    def test_hotspots(self):
        """Test hotspot detection"""
        entries = [
            TraceEntry(pc=10, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=10, opcode=0x64, dest=1, src=2, immediate=0),
            TraceEntry(pc=10, opcode=0x66, dest=1, src=2, immediate=0),
            TraceEntry(pc=20, opcode=0x64, dest=1, src=2, immediate=0),
        ]
        visualizer = TraceVisualizer(entries, grid_size=32)
        hotspots = visualizer.hotspots(top_n=1)
        assert len(hotspots) == 1
        assert hotspots[0][0] == 10  # PC
        assert hotspots[0][1] == 3   # count
