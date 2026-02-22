#!/usr/bin/env python3
"""Tests for WASM runtime tracer integration"""
import pytest
import sys
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.pixel_compiler.wasm_runtime import WASMRuntime
from systems.pixel_compiler.wasm_tracer import TraceLevel


def test_runtime_has_tracer():
    """Test that runtime has a tracer attribute"""
    runtime = WASMRuntime()
    assert hasattr(runtime, 'tracer')
    assert runtime.tracer is not None


def test_runtime_trace_level_default():
    """Test that default trace level is NONE"""
    runtime = WASMRuntime()
    assert runtime.tracer.level == TraceLevel.NONE


def test_runtime_set_trace_level():
    """Test setting trace level via runtime"""
    runtime = WASMRuntime()
    runtime.set_trace_level(TraceLevel.INSTRUCTIONS)
    assert runtime.tracer.level == TraceLevel.INSTRUCTIONS


def test_runtime_get_trace_statistics():
    """Test getting trace statistics from runtime"""
    runtime = WASMRuntime()
    runtime.set_trace_level(TraceLevel.FULL)

    # Manually add some events for testing
    runtime.tracer.record_instruction(pc=0, opcode=0x41, operand1=42)

    stats = runtime.get_trace_statistics()
    assert stats['instruction_count'] == 1


def test_runtime_export_trace():
    """Test exporting trace from runtime"""
    runtime = WASMRuntime()
    runtime.set_trace_level(TraceLevel.FULL)
    runtime.tracer.record_instruction(pc=0, opcode=0x41, operand1=42)

    import json
    export = json.loads(runtime.export_trace())
    assert 'events' in export
    assert len(export['events']) == 1


def test_runtime_clear_trace():
    """Test clearing trace from runtime"""
    runtime = WASMRuntime()
    runtime.set_trace_level(TraceLevel.FULL)
    runtime.tracer.record_instruction(pc=0, opcode=0x41)

    assert len(runtime.tracer.events) == 1

    runtime.clear_trace()
    assert len(runtime.tracer.events) == 0


def test_runtime_bridge_has_tracer():
    """Test that bridge can accept tracer for callback"""
    from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

    bridge = WASMGPUBridge()

    # Verify bridge can receive tracer reference
    # (This tests the integration interface exists)
    assert hasattr(bridge, 'trace_enabled')
