#!/usr/bin/env python3
"""Tests for WASM execution tracer"""
import pytest
import sys
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from wasm_tracer import WasmTracer, TraceEvent, TraceLevel


def test_tracer_initialization():
    """Test that tracer can be initialized"""
    tracer = WasmTracer()
    assert tracer is not None
    assert tracer.level == TraceLevel.NONE
    assert len(tracer.events) == 0


def test_tracer_enable_trace():
    """Test enabling tracing"""
    tracer = WasmTracer()
    tracer.set_level(TraceLevel.FULL)
    assert tracer.level == TraceLevel.FULL


def test_tracer_record_instruction():
    """Test recording instruction trace"""
    tracer = WasmTracer()
    tracer.set_level(TraceLevel.INSTRUCTIONS)

    tracer.record_instruction(pc=100, opcode=0x6a, operand1=42, operand2=10)

    assert len(tracer.events) == 1
    event = tracer.events[0]
    assert event.pc == 100
    assert event.opcode == 0x6a
    assert event.operand1 == 42
    assert event.operand2 == 10


def test_tracer_record_memory_access():
    """Test recording memory access"""
    tracer = WasmTracer()
    tracer.set_level(TraceLevel.MEMORY)

    tracer.record_memory_access(pc=50, address=1024, value=42, is_write=True)

    assert len(tracer.events) == 1
    event = tracer.events[0]
    assert event.pc == 50
    assert event.address == 1024
    assert event.value == 42
    assert event.is_write is True


def test_tracer_get_statistics():
    """Test getting trace statistics"""
    tracer = WasmTracer()
    tracer.set_level(TraceLevel.FULL)

    # Record some events
    tracer.record_instruction(pc=0, opcode=0x41, operand1=42)
    tracer.record_instruction(pc=1, opcode=0x6a)
    tracer.record_instruction(pc=2, opcode=0x41, operand1=10)

    stats = tracer.get_statistics()
    assert stats['total_events'] == 3
    assert stats['instruction_count'] == 3
    assert stats['unique_opcodes'] == 2


def test_tracer_export_trace():
    """Test exporting trace to JSON"""
    tracer = WasmTracer()
    tracer.set_level(TraceLevel.FULL)

    tracer.record_instruction(pc=0, opcode=0x41, operand1=42)

    import json
    export = json.loads(tracer.export_json())
    assert 'events' in export
    assert len(export['events']) == 1
    assert export['events'][0]['pc'] == 0


def test_tracer_filter_by_opcode():
    """Test filtering events by opcode"""
    tracer = WasmTracer()
    tracer.set_level(TraceLevel.FULL)

    tracer.record_instruction(pc=0, opcode=0x41, operand1=42)  # i32.const
    tracer.record_instruction(pc=1, opcode=0x6a)               # i32.add
    tracer.record_instruction(pc=2, opcode=0x41, operand1=10)  # i32.const

    add_events = tracer.filter_by_opcode(0x6a)
    assert len(add_events) == 1
    assert add_events[0].opcode == 0x6a


def test_tracer_filter_by_pc_range():
    """Test filtering events by program counter range"""
    tracer = WasmTracer()
    tracer.set_level(TraceLevel.FULL)

    tracer.record_instruction(pc=0, opcode=0x41)
    tracer.record_instruction(pc=50, opcode=0x6a)
    tracer.record_instruction(pc=100, opcode=0x41)

    filtered = tracer.filter_by_pc_range(10, 90)
    assert len(filtered) == 1
    assert filtered[0].pc == 50


def test_tracer_clear():
    """Test clearing trace events"""
    tracer = WasmTracer()
    tracer.set_level(TraceLevel.FULL)

    tracer.record_instruction(pc=0, opcode=0x41)
    assert len(tracer.events) == 1

    tracer.clear()
    assert len(tracer.events) == 0


def test_tracer_memory_snapshots():
    """Test recording memory snapshots"""
    tracer = WasmTracer()
    tracer.set_level(TraceLevel.MEMORY)

    snapshot = {0: 42, 1: 100, 2: 200}
    tracer.record_memory_snapshot(pc=0, memory=snapshot, label="initial")

    assert len(tracer.events) == 1
    event = tracer.events[0]
    assert event.label == "initial"
    assert event.memory_snapshot == snapshot
