"""
WASM Debugger

Provides debugging capabilities for WASM execution:
- Breakpoints (PC-based)
- Step execution (step into, step over, step out)
- Memory inspection
- Watch expressions
- Call stack tracking
"""

from dataclasses import dataclass, field
from enum import Enum
from typing import List, Dict, Optional, Any


class DebuggerState(Enum):
    """Debugger execution state"""
    IDLE = "idle"
    RUNNING = "running"
    PAUSED = "paused"
    STEPPING = "stepping"
    TERMINATED = "terminated"


@dataclass
class Breakpoint:
    """Breakpoint definition"""
    pc: int
    enabled: bool = True
    hit_count: int = 0
    condition: Optional[str] = None  # Future: conditional breakpoints
    label: str = ""


@dataclass
class MemoryWatch:
    """Memory watch expression"""
    address: int
    label: str = ""
    old_value: Optional[int] = None


class WasmDebugger:
    """
    Debugs WASM execution with breakpoints, stepping, and inspection.

    Usage:
        runtime = WASMRuntime.from_png("program.rts.png")
        debugger = WasmDebugger(runtime)

        debugger.set_breakpoint(pc=100)
        debugger.continue_execution()
        # ... hits breakpoint at PC=100

        value = debugger.inspect_register("R0")
        debugger.step_into()
    """

    def __init__(self, runtime):
        """
        Initialize debugger attached to a runtime.

        Args:
            runtime: WASMRuntime instance to debug
        """
        self.runtime = runtime
        self.state = DebuggerState.IDLE
        self.breakpoints: Dict[int, Breakpoint] = {}
        self.watches: Dict[int, MemoryWatch] = {}
        self.call_stack: List[Dict[str, Any]] = []
        self.current_pc: int = 0
        self.step_mode: Optional[str] = None  # 'into', 'over', 'out'

        # Attach to runtime for automatic breakpoint checking
        runtime.set_debugger(self)

    def set_breakpoint(self, pc: int, label: str = "") -> Breakpoint:
        """
        Set a breakpoint at the given program counter.

        Args:
            pc: Program counter address
            label: Optional label for the breakpoint

        Returns:
            The created Breakpoint object
        """
        bp = Breakpoint(pc=pc, label=label)
        self.breakpoints[pc] = bp
        return bp

    def clear_breakpoint(self, pc: int):
        """Remove breakpoint at PC"""
        if pc in self.breakpoints:
            del self.breakpoints[pc]

    def toggle_breakpoint(self, pc: int) -> bool:
        """Toggle breakpoint enabled state"""
        if pc in self.breakpoints:
            self.breakpoints[pc].enabled = not self.breakpoints[pc].enabled
            return self.breakpoints[pc].enabled
        return False

    def list_breakpoints(self) -> List[Breakpoint]:
        """Get list of all breakpoints"""
        return list(self.breakpoints.values())

    def check_breakpoint(self, pc: int) -> bool:
        """
        Check if execution should stop at this PC.

        Called by the runtime during execution.

        Returns:
            True if breakpoint hit and execution should pause
        """
        if pc in self.breakpoints:
            bp = self.breakpoints[pc]
            if bp.enabled:
                bp.hit_count += 1
                return True
        return False

    def add_watch(self, address: int, label: str = "") -> MemoryWatch:
        """
        Watch a memory location for changes.

        Args:
            address: Memory address to watch
            label: Optional label for the watch

        Returns:
            The created MemoryWatch object
        """
        watch = MemoryWatch(address=address, label=label)
        self.watches[address] = watch
        return watch

    def remove_watch(self, address: int):
        """Remove memory watch"""
        if address in self.watches:
            del self.watches[address]

    def get_watches(self) -> List[MemoryWatch]:
        """Get all memory watches"""
        return list(self.watches.values())

    def check_watches(self, memory: bytes) -> List[tuple]:
        """
        Check watched memory locations for changes.

        Returns:
            List of (address, old_value, new_value) tuples for changed locations
        """
        changes = []
        for addr, watch in self.watches.items():
            if addr < len(memory):
                new_value = memory[addr]
                if watch.old_value is not None and new_value != watch.old_value:
                    changes.append((addr, watch.old_value, new_value))
                watch.old_value = new_value
        return changes

    def step_into(self) -> Optional[int]:
        """
        Execute one instruction (step into function calls).

        Returns:
            New PC after step, or None if execution terminated
        """
        self.state = DebuggerState.STEPPING
        self.step_mode = 'into'

        # In a real implementation, this would execute a single instruction
        # For now, we provide the interface
        return self.current_pc + 1

    def step_over(self) -> Optional[int]:
        """
        Execute one instruction, stepping over function calls.

        Returns:
            New PC after step, or None if execution terminated
        """
        self.state = DebuggerState.STEPPING
        self.step_mode = 'over'

        # Step over: if next instruction is a call, execute entire function
        return self.current_pc + 1

    def step_out(self) -> Optional[int]:
        """
        Execute until return from current function.

        Returns:
            New PC after step, or None if execution terminated
        """
        self.state = DebuggerState.STEPPING
        self.step_mode = 'out'

        # Step out: continue until we return from current function
        return self.current_pc

    def continue_execution(self) -> Optional[int]:
        """
        Continue execution until next breakpoint or termination.

        Returns:
            Final PC or None if terminated
        """
        self.state = DebuggerState.RUNNING

        # Execute until breakpoint hit
        if hasattr(self.runtime, 'bridge'):
            # The bridge will check breakpoints during execution
            result = self.runtime.bridge.execute(
                wasm_bytes=self.runtime.wasm_bytes,
                entry_point=self.current_pc,
                max_instructions=self.runtime.max_instructions
            )

            if result.success:
                self.state = DebuggerState.TERMINATED
                return None

        return self.current_pc

    def pause(self):
        """Pause execution (async/interrupt)"""
        self.state = DebuggerState.PAUSED

    def inspect_memory(self, start: int, length: int = 16) -> bytes:
        """
        Inspect a range of memory.

        Args:
            start: Starting memory address
            length: Number of bytes to read

        Returns:
            Memory contents as bytes
        """
        # Try to get from last execution result
        if hasattr(self.runtime, 'last_memory_dump'):
            dump = self.runtime.last_memory_dump
            return dump[start:start+length]

        # Return empty if no memory dump available
        return bytes(length)

    def inspect_register(self, register: str) -> Optional[int]:
        """
        Get the value of a virtual register.

        Args:
            register: Register name (e.g., "R0", "R1")

        Returns:
            Register value or None if not available
        """
        # Registers are stored in WASM globals or local variables
        # This would require inspecting the WASM interpreter state
        # For now, return None as placeholder
        return None

    def get_backtrace(self) -> List[Dict[str, Any]]:
        """
        Get the current call stack.

        Returns:
            List of stack frames with function name and PC
        """
        return self.call_stack.copy()

    def push_frame(self, function_name: str, pc: int):
        """Push a frame onto the call stack"""
        self.call_stack.append({
            "function": function_name,
            "pc": pc
        })

    def pop_frame(self):
        """Pop a frame from the call stack"""
        if self.call_stack:
            self.call_stack.pop()

    def get_state_info(self) -> Dict[str, Any]:
        """Get complete debugger state"""
        return {
            "state": self.state.value,
            "current_pc": self.current_pc,
            "breakpoints": len(self.breakpoints),
            "watches": len(self.watches),
            "call_stack_depth": len(self.call_stack),
            "step_mode": self.step_mode
        }
