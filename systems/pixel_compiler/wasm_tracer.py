"""
WASM Execution Tracer

Provides detailed tracing of WASM execution including:
- Instruction-level tracing
- Memory access logging
- Function call tracking
- Performance profiling
"""

from dataclasses import dataclass, field
from enum import Enum
from typing import List, Dict, Optional, Any
from datetime import datetime
import json


class TraceLevel(Enum):
    """Trace verbosity levels"""
    NONE = 0         # No tracing
    ERROR = 1        # Errors only
    BASIC = 2        # Function calls and returns
    MEMORY = 3       # Memory accesses
    INSTRUCTIONS = 4 # Every instruction
    FULL = 5         # Everything including internal state


@dataclass
class TraceEvent:
    """Base class for trace events"""
    timestamp: float = field(default_factory=lambda: datetime.now().timestamp())
    event_type: str = "unknown"
    pc: int = 0


@dataclass
class InstructionEvent(TraceEvent):
    """Instruction execution event"""
    event_type: str = "instruction"
    opcode: int = 0
    operand1: Optional[int] = None
    operand2: Optional[int] = None
    result: Optional[int] = None


@dataclass
class MemoryEvent(TraceEvent):
    """Memory access event"""
    event_type: str = "memory"
    address: int = 0
    value: int = 0
    is_write: bool = False


@dataclass
class FunctionEvent(TraceEvent):
    """Function call/return event"""
    event_type: str = "function"
    function_name: str = ""
    is_call: bool = True
    args: List[int] = field(default_factory=list)
    return_value: Optional[int] = None


@dataclass
class SnapshotEvent(TraceEvent):
    """Memory snapshot event"""
    event_type: str = "snapshot"
    memory_snapshot: Dict[int, int] = field(default_factory=dict)
    label: str = ""


class WasmTracer:
    """
    Traces WASM execution with configurable verbosity.

    Usage:
        tracer = WasmTracer()
        tracer.set_level(TraceLevel.INSTRUCTIONS)

        # During execution
        tracer.record_instruction(pc=100, opcode=0x6a, operand1=5, operand2=3)

        # After execution
        stats = tracer.get_statistics()
        export = tracer.export_json()
    """

    def __init__(self, level: TraceLevel = TraceLevel.NONE):
        self.level = level
        self.events: List[TraceEvent] = []
        self._instruction_count = 0
        self._memory_access_count = 0
        self._function_call_count = 0
        self._opcode_counts: Dict[int, int] = {}

    def set_level(self, level: TraceLevel):
        """Set trace verbosity level"""
        self.level = level

    def clear(self):
        """Clear all trace events"""
        self.events.clear()
        self._instruction_count = 0
        self._memory_access_count = 0
        self._function_call_count = 0
        self._opcode_counts.clear()

    def record_instruction(self, pc: int, opcode: int,
                          operand1: Optional[int] = None,
                          operand2: Optional[int] = None,
                          result: Optional[int] = None):
        """Record an instruction execution"""
        if self.level.value < TraceLevel.INSTRUCTIONS.value:
            return

        event = InstructionEvent(
            pc=pc,
            opcode=opcode,
            operand1=operand1,
            operand2=operand2,
            result=result
        )
        self.events.append(event)
        self._instruction_count += 1
        self._opcode_counts[opcode] = self._opcode_counts.get(opcode, 0) + 1

    def record_memory_access(self, pc: int, address: int, value: int, is_write: bool):
        """Record a memory read or write"""
        if self.level.value < TraceLevel.MEMORY.value:
            return

        event = MemoryEvent(
            pc=pc,
            address=address,
            value=value,
            is_write=is_write
        )
        self.events.append(event)
        self._memory_access_count += 1

    def record_function_call(self, pc: int, function_name: str,
                           args: List[int] = None):
        """Record a function call"""
        if self.level.value < TraceLevel.BASIC.value:
            return

        event = FunctionEvent(
            pc=pc,
            function_name=function_name,
            is_call=True,
            args=args or []
        )
        self.events.append(event)
        self._function_call_count += 1

    def record_function_return(self, pc: int, function_name: str,
                              return_value: int = None):
        """Record a function return"""
        if self.level.value < TraceLevel.BASIC.value:
            return

        event = FunctionEvent(
            pc=pc,
            function_name=function_name,
            is_call=False,
            return_value=return_value
        )
        self.events.append(event)

    def record_memory_snapshot(self, pc: int, memory: Dict[int, int],
                              label: str = ""):
        """Record a complete memory snapshot"""
        if self.level.value < TraceLevel.MEMORY.value:
            return

        event = SnapshotEvent(
            pc=pc,
            memory_snapshot=memory.copy(),
            label=label
        )
        self.events.append(event)

    def record_error(self, pc: int, message: str):
        """Record an error during execution"""
        if self.level.value < TraceLevel.ERROR.value:
            return

        # Create a generic event for errors
        event = TraceEvent(
            pc=pc,
            event_type="error"
        )
        # Store message in a custom attribute
        setattr(event, 'message', message)
        self.events.append(event)

    def get_statistics(self) -> Dict[str, Any]:
        """Get trace statistics"""
        return {
            'total_events': len(self.events),
            'instruction_count': self._instruction_count,
            'memory_access_count': self._memory_access_count,
            'function_call_count': self._function_call_count,
            'unique_opcodes': len(self._opcode_counts),
            'opcode_distribution': self._opcode_counts.copy(),
            'level': self.level.name
        }

    def filter_by_opcode(self, opcode: int) -> List[TraceEvent]:
        """Filter events by specific opcode"""
        return [
            e for e in self.events
            if isinstance(e, InstructionEvent) and e.opcode == opcode
        ]

    def filter_by_pc_range(self, start: int, end: int) -> List[TraceEvent]:
        """Filter events by program counter range [start, end]"""
        return [
            e for e in self.events
            if start <= e.pc <= end
        ]

    def filter_by_type(self, event_type: str) -> List[TraceEvent]:
        """Filter events by type"""
        return [
            e for e in self.events
            if e.event_type == event_type
        ]

    def export_json(self) -> str:
        """Export trace as JSON string"""
        export_data = {
            'statistics': self.get_statistics(),
            'events': []
        }

        for event in self.events:
            event_dict = {
                'timestamp': event.timestamp,
                'type': event.event_type,
                'pc': event.pc
            }

            if isinstance(event, InstructionEvent):
                event_dict.update({
                    'opcode': hex(event.opcode),
                    'operand1': event.operand1,
                    'operand2': event.operand2,
                    'result': event.result
                })
            elif isinstance(event, MemoryEvent):
                event_dict.update({
                    'address': hex(event.address),
                    'value': event.value,
                    'is_write': event.is_write
                })
            elif isinstance(event, FunctionEvent):
                event_dict.update({
                    'function': event.function_name,
                    'is_call': event.is_call,
                    'args': event.args,
                    'return_value': event.return_value
                })
            elif isinstance(event, SnapshotEvent):
                event_dict.update({
                    'label': event.label,
                    'memory_size': len(event.memory_snapshot)
                })
            elif hasattr(event, 'message'):
                event_dict['message'] = event.message

            export_data['events'].append(event_dict)

        return json.dumps(export_data, indent=2)

    def print_summary(self):
        """Print a human-readable summary"""
        stats = self.get_statistics()
        print(f"\n=== WASM Execution Trace Summary ===")
        print(f"Trace Level: {stats['level']}")
        print(f"Total Events: {stats['total_events']}")
        print(f"Instructions: {stats['instruction_count']}")
        print(f"Memory Accesses: {stats['memory_access_count']}")
        print(f"Function Calls: {stats['function_call_count']}")
        print(f"Unique Opcodes: {stats['unique_opcodes']}")

        if stats['opcode_distribution']:
            print(f"\nOpcode Distribution:")
            for opcode, count in sorted(stats['opcode_distribution'].items(),
                                      key=lambda x: -x[1])[:10]:
                print(f"  0x{opcode:02x}: {count}")
