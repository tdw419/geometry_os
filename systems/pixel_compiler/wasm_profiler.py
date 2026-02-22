"""
WASM Performance Profiler

Profiles WASM execution for performance analysis:
- Instruction timing
- Memory usage tracking
- Function timing
- Hotspot identification
- Opcode distribution
"""

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any
import json
import time


@dataclass
class ProfilerReport:
    """Profiler execution report"""
    total_instructions: int = 0
    total_duration_ns: int = 0
    total_memory_allocated: int = 0

    # Per-PC statistics
    pc_instruction_counts: Dict[int, int] = field(default_factory=dict)
    pc_durations: Dict[int, int] = field(default_factory=dict)

    # Per-opcode statistics
    opcode_counts: Dict[int, int] = field(default_factory=dict)
    opcode_durations: Dict[int, int] = field(default_factory=dict)

    # Per-function statistics
    function_timings: Dict[str, Dict[str, int]] = field(default_factory=dict)

    def get_hotspots(self, top_n: int = 10) -> List[Dict[str, Any]]:
        """
        Get execution hotspots (most time-consuming PCs).

        Returns:
            List of dicts with 'pc', 'count', 'duration_ns', 'avg_duration_ns'
        """
        hotspots = []

        for pc, duration in self.pc_durations.items():
            count = self.pc_instruction_counts.get(pc, 0)
            if count > 0:
                hotspots.append({
                    'pc': pc,
                    'count': count,
                    'duration_ns': duration,
                    'avg_duration_ns': duration // count if count > 0 else 0
                })

        # Sort by total duration descending
        hotspots.sort(key=lambda x: -x['duration_ns'])

        return hotspots[:top_n]

    def get_opcode_distribution(self) -> Dict[int, Dict[str, Any]]:
        """
        Get opcode execution distribution.

        Returns:
            Dict mapping opcode to {'count', 'duration_ns', 'avg_duration_ns'}
        """
        distribution = {}

        for opcode, count in self.opcode_counts.items():
            duration = self.opcode_durations.get(opcode, 0)
            distribution[opcode] = {
                'count': count,
                'duration_ns': duration,
                'avg_duration_ns': duration // count if count > 0 else 0
            }

        return distribution

    def get_function_timing(self) -> Dict[str, Dict[str, int]]:
        """
        Get per-function execution timing.

        Returns:
            Dict mapping function name to {'calls', 'duration_ns', 'avg_duration_ns'}
        """
        return self.function_timings.copy()


class WasmProfiler:
    """
    Profiles WASM execution performance.

    Usage:
        profiler = WasmProfiler()
        profiler.start()

        # During execution
        profiler.record_instruction(pc=100, opcode=0x6a, duration_ns=150)

        # After execution
        report = profiler.get_report()
        hotspots = report.get_hotspots()
    """

    def __init__(self):
        self.is_recording = False
        self._report = ProfilerReport()
        self._call_stack: List[str] = []
        self._function_start_times: Dict[str, float] = {}

    def start(self):
        """Start profiling"""
        self.is_recording = True
        self._report = ProfilerReport()

    def stop(self):
        """Stop profiling"""
        self.is_recording = False

    def reset(self):
        """Reset all profiling data"""
        self._report = ProfilerReport()
        self._call_stack.clear()
        self._function_start_times.clear()

    def record_instruction(self, pc: int, opcode: int, duration_ns: int):
        """
        Record an instruction execution.

        Args:
            pc: Program counter
            opcode: Instruction opcode
            duration_ns: Execution time in nanoseconds
        """
        if not self.is_recording:
            return

        self._report.total_instructions += 1
        self._report.total_duration_ns += duration_ns

        # Per-PC stats
        self._report.pc_instruction_counts[pc] = \
            self._report.pc_instruction_counts.get(pc, 0) + 1
        self._report.pc_durations[pc] = \
            self._report.pc_durations.get(pc, 0) + duration_ns

        # Per-opcode stats
        self._report.opcode_counts[opcode] = \
            self._report.opcode_counts.get(opcode, 0) + 1
        self._report.opcode_durations[opcode] = \
            self._report.opcode_durations.get(opcode, 0) + duration_ns

    def record_memory_alloc(self, size_bytes: int):
        """
        Record a memory allocation.

        Args:
            size_bytes: Size of allocation in bytes
        """
        if not self.is_recording:
            return

        self._report.total_memory_allocated += size_bytes

    def enter_function(self, function_name: str):
        """
        Record entering a function.

        Args:
            function_name: Name of the function
        """
        if not self.is_recording:
            return

        self._call_stack.append(function_name)
        self._function_start_times[function_name] = time.time()

    def exit_function(self, function_name: str):
        """
        Record exiting a function.

        Args:
            function_name: Name of the function
        """
        if not self.is_recording:
            return

        if function_name in self._function_start_times:
            start_time = self._function_start_times[function_name]
            duration_ns = int((time.time() - start_time) * 1e9)

            # Update function timing
            if function_name not in self._report.function_timings:
                self._report.function_timings[function_name] = {
                    'calls': 0,
                    'duration_ns': 0
                }

            self._report.function_timings[function_name]['calls'] += 1
            self._report.function_timings[function_name]['duration_ns'] += duration_ns

            del self._function_start_times[function_name]

        if self._call_stack and self._call_stack[-1] == function_name:
            self._call_stack.pop()

    def get_total_instructions(self) -> int:
        """Get total instruction count"""
        return self._report.total_instructions

    def get_report(self) -> ProfilerReport:
        """Get profiling report"""
        return self._report

    def export_json(self) -> str:
        """Export profile as JSON string"""
        export_data = {
            'report': {
                'total_instructions': self._report.total_instructions,
                'total_duration_ns': self._report.total_duration_ns,
                'total_memory_allocated': self._report.total_memory_allocated,
                'avg_instruction_duration_ns': (
                    self._report.total_duration_ns / self._report.total_instructions
                    if self._report.total_instructions > 0 else 0
                )
            },
            'hotspots': self._report.get_hotspots(),
            'opcode_distribution': {
                f"0x{op:02x}": stats
                for op, stats in self._report.get_opcode_distribution().items()
            },
            'function_timing': self._report.get_function_timing()
        }

        return json.dumps(export_data, indent=2)

    def print_summary(self):
        """Print human-readable summary"""
        report = self._report

        print(f"\n=== WASM Performance Profile ===")
        print(f"Total Instructions: {report.total_instructions}")
        print(f"Total Duration: {report.total_duration_ns / 1e6:.2f} ms")
        print(f"Total Memory Allocated: {report.total_memory_allocated / 1024:.2f} KB")

        if report.total_instructions > 0:
            avg_ns = report.total_duration_ns / report.total_instructions
            print(f"Avg Instruction Duration: {avg_ns:.2f} ns")

        print(f"\nTop Hotspots:")
        for i, hotspot in enumerate(report.get_hotspots()[:5], 1):
            print(f"  {i}. PC={hotspot['pc']}: "
                  f"{hotspot['count']}x, "
                  f"{hotspot['duration_ns'] / 1e6:.2f} ms total, "
                  f"{hotspot['avg_duration_ns']:.2f} ns avg")

        print(f"\nOpcode Distribution:")
        for opcode, stats in sorted(
            report.get_opcode_distribution().items(),
            key=lambda x: -x[1]['count']
        )[:5]:
            print(f"  0x{opcode:02x}: {stats['count']}x, "
                  f"{stats['duration_ns'] / 1e6:.2f} ms")

        if report.function_timings:
            print(f"\nFunction Timing:")
            for func, timing in sorted(
                report.function_timings.items(),
                key=lambda x: -x[1]['duration_ns']
            ):
                calls = timing['calls']
                duration_ms = timing['duration_ns'] / 1e6
                avg_ms = duration_ms / calls if calls > 0 else 0
                print(f"  {func}: {calls} calls, "
                      f"{duration_ms:.2f} ms total, "
                      f"{avg_ms:.3f} ms avg")
