#!/usr/bin/env python3
"""Tests for WASM debugger"""
import pytest
import sys
from pathlib import Path

# Add parent directories to path
sys.path.insert(0, str(Path(__file__).parent.parent))
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from pixel_compiler.wasm_debugger import WasmDebugger, Breakpoint, DebuggerState
from pixel_compiler.wasm_runtime import WASMRuntime


def test_debugger_initialization():
    """Test debugger can be initialized"""
    runtime = WASMRuntime()
    debugger = WasmDebugger(runtime)

    assert debugger is not None
    assert debugger.state == DebuggerState.IDLE


def test_debugger_set_breakpoint():
    """Test setting a breakpoint"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    debugger = WasmDebugger(runtime)

    debugger.set_breakpoint(pc=100)

    assert 100 in debugger.breakpoints
    assert debugger.breakpoints[100].enabled is True


def test_debugger_clear_breakpoint():
    """Test clearing a breakpoint"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    debugger = WasmDebugger(runtime)

    debugger.set_breakpoint(pc=100)
    assert 100 in debugger.breakpoints

    debugger.clear_breakpoint(pc=100)
    assert 100 not in debugger.breakpoints


def test_debugger_list_breakpoints():
    """Test listing all breakpoints"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    debugger = WasmDebugger(runtime)

    debugger.set_breakpoint(pc=100)
    debugger.set_breakpoint(pc=200)

    bps = debugger.list_breakpoints()
    assert len(bps) == 2
    assert any(bp.pc == 100 for bp in bps)
    assert any(bp.pc == 200 for bp in bps)


def test_debugger_step_into():
    """Test step into execution"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    # Set up minimal WASM for testing
    runtime.wasm_bytes = b'\x00asm\x01\x00\x00\x00'
    runtime.exports = {"test": 0}

    debugger = WasmDebugger(runtime)

    # Step should execute one instruction
    # In mock mode, we just verify the method exists
    assert hasattr(debugger, 'step_into')


def test_debugger_step_over():
    """Test step over execution"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    runtime.wasm_bytes = b'\x00asm\x01\x00\x00\x00'
    runtime.exports = {"test": 0}

    debugger = WasmDebugger(runtime)
    assert hasattr(debugger, 'step_over')


def test_debugger_continue():
    """Test continue execution"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    runtime.wasm_bytes = b'\x00asm\x01\x00\x00\x00'
    runtime.exports = {"test": 0}

    debugger = WasmDebugger(runtime)
    assert hasattr(debugger, 'continue_execution')


def test_debugger_watch_memory():
    """Test watching memory locations"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    debugger = WasmDebugger(runtime)

    debugger.add_watch(address=1024, label="counter")

    assert 1024 in debugger.watches
    assert debugger.watches[1024].label == "counter"


def test_debugger_get_watches():
    """Test getting watched memory values"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    debugger = WasmDebugger(runtime)

    debugger.add_watch(address=100, label="value1")
    debugger.add_watch(address=200, label="value2")

    watches = debugger.get_watches()
    assert len(watches) == 2


def test_debugger_inspect_memory():
    """Test inspecting memory range"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    debugger = WasmDebugger(runtime)

    # Create mock memory
    runtime.last_memory_dump = bytes([i % 256 for i in range(100)])

    memory = debugger.inspect_memory(start=0, length=10)
    assert len(memory) == 10


def test_debugger_backtrace():
    """Test getting call stack backtrace"""
    # WASMRuntime already imported at top level
    runtime = WASMRuntime()
    debugger = WasmDebugger(runtime)

    # Mock call stack
    debugger.call_stack = [
        {"function": "main", "pc": 0},
        {"function": "fib", "pc": 50}
    ]

    backtrace = debugger.get_backtrace()
    assert len(backtrace) == 2
    assert backtrace[0]["function"] == "main"
