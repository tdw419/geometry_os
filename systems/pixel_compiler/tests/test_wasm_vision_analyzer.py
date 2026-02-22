#!/usr/bin/env python3
"""Tests for WASM vision trace integration"""
import pytest
import sys
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from wasm_vision_analyzer import WasmVisionAnalyzer
from wasm_tracer import TraceEvent, InstructionEvent
import numpy as np


def test_vision_analyzer_initialization():
    """Test vision analyzer can be initialized"""
    analyzer = WasmVisionAnalyzer()
    assert analyzer is not None


def test_vision_analyzer_trace_to_image():
    """Test converting trace to heatmap image"""
    analyzer = WasmVisionAnalyzer()

    # Create sample trace events
    events = [
        InstructionEvent(pc=0, opcode=0x41, operand1=42),
        InstructionEvent(pc=1, opcode=0x6a),
        InstructionEvent(pc=2, opcode=0x41, operand1=10),
    ]

    image = analyzer.trace_to_heatmap(events)

    assert image is not None
    assert isinstance(image, np.ndarray)
    assert len(image.shape) == 3  # RGB


def test_vision_analyzer_pc_distribution():
    """Test PC distribution analysis"""
    analyzer = WasmVisionAnalyzer()

    events = [
        InstructionEvent(pc=0, opcode=0x41),
        InstructionEvent(pc=0, opcode=0x41),  # Same PC
        InstructionEvent(pc=100, opcode=0x6a),
    ]

    distribution = analyzer.get_pc_distribution(events)

    assert distribution[0] == 2
    assert distribution[100] == 1


def test_vision_analyzer_generate_execution_map():
    """Test generating execution map visualization"""
    analyzer = WasmVisionAnalyzer()

    events = [
        InstructionEvent(pc=i, opcode=0x41)
        for i in range(100)
    ]

    image = analyzer.generate_execution_map(events, width=256, height=256)

    assert isinstance(image, np.ndarray)
    assert image.shape[:2] == (256, 256)


def test_vision_analyzer_detect_loops():
    """Test loop detection in trace"""
    analyzer = WasmVisionAnalyzer()

    # Create trace with loop pattern (PC goes 10->11->12->10)
    events = [
        InstructionEvent(pc=10, opcode=0x41),
        InstructionEvent(pc=11, opcode=0x6a),
        InstructionEvent(pc=12, opcode=0x41),
        InstructionEvent(pc=10, opcode=0x41),  # Loop back
        InstructionEvent(pc=11, opcode=0x6a),
        InstructionEvent(pc=12, opcode=0x41),
        InstructionEvent(pc=10, opcode=0x41),  # Loop back again
    ]

    loops = analyzer.detect_loops(events)

    assert len(loops) > 0
    # Should detect loop around PC 10-12


def test_vision_analyzer_control_flow_graph():
    """Test control flow graph generation"""
    analyzer = WasmVisionAnalyzer()

    events = [
        InstructionEvent(pc=0, opcode=0x41),
        InstructionEvent(pc=1, opcode=0x6a),
        InstructionEvent(pc=100, opcode=0x41),  # Jump
        InstructionEvent(pc=101, opcode=0x41),
    ]

    graph = analyzer.build_control_flow_graph(events)

    assert len(graph['nodes']) > 0
    assert len(graph['edges']) > 0


def test_vision_analyzer_export_visualization():
    """Test exporting visualization to PNG"""
    analyzer = WasmVisionAnalyzer()

    events = [
        InstructionEvent(pc=i, opcode=0x41)
        for i in range(50)
    ]

    import tempfile
    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        output_path = f.name

    try:
        analyzer.export_heatmap(events, output_path)

        # Verify file was created
        from pathlib import Path
        assert Path(output_path).exists()

    finally:
        Path(output_path).unlink()


def test_vision_analyzer_pattern_detection_integration():
    """Test integration with pattern detector"""
    analyzer = WasmVisionAnalyzer()

    events = [
        InstructionEvent(pc=i, opcode=0x41, operand1=i)
        for i in range(100)
    ]

    # Generate execution map
    image = analyzer.generate_execution_map(events)

    # Pattern detection should work on the generated image
    from pattern_detector import PatternDetector

    # Save image temporarily for pattern detector
    import tempfile
    from pathlib import Path
    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        temp_path = f.name

    try:
        from PIL import Image
        img = Image.fromarray(image.astype(np.uint8))
        img.save(temp_path)

        detector = PatternDetector(temp_path)
        # Should not raise error - verify image loads
        result = detector.detect_edges_sobel()
        assert result is not None
        assert result.edge_count >= 0

    finally:
        Path(temp_path).unlink()
