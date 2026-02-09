#!/usr/bin/env python3
"""Tests for WASM performance profiler"""
import unittest
import sys
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from pixel_compiler.wasm_profiler import WasmProfiler, ProfilerReport


class TestProfilerInitialization(unittest.TestCase):
    """Test profiler can be initialized"""

    def test_profiler_initialization(self):
        """Test profiler can be initialized"""
        profiler = WasmProfiler()
        self.assertIsNotNone(profiler)
        self.assertFalse(profiler.is_recording)


class TestProfilerRecording(unittest.TestCase):
    """Test profiling recording controls"""

    def test_profiler_start_recording(self):
        """Test starting profiling"""
        profiler = WasmProfiler()
        profiler.start()

        self.assertTrue(profiler.is_recording)

    def test_profiler_stop_recording(self):
        """Test stopping profiling"""
        profiler = WasmProfiler()
        profiler.start()
        profiler.stop()

        self.assertFalse(profiler.is_recording)


class TestProfilerInstructionRecording(unittest.TestCase):
    """Test instruction recording functionality"""

    def test_profiler_record_instruction(self):
        """Test recording instruction timing"""
        profiler = WasmProfiler()
        profiler.start()

        profiler.record_instruction(pc=0, opcode=0x41, duration_ns=100)

        self.assertEqual(profiler.get_total_instructions(), 1)


class TestProfilerReport(unittest.TestCase):
    """Test profiler report generation"""

    def test_profiler_get_report(self):
        """Test getting profiler report"""
        profiler = WasmProfiler()
        profiler.start()

        profiler.record_instruction(pc=0, opcode=0x41, duration_ns=100)
        profiler.record_instruction(pc=1, opcode=0x6a, duration_ns=200)
        profiler.record_instruction(pc=2, opcode=0x41, duration_ns=50)

        report = profiler.get_report()

        self.assertEqual(report.total_instructions, 3)
        self.assertEqual(report.total_duration_ns, 350)

    def test_profiler_hotspots(self):
        """Test identifying execution hotspots"""
        profiler = WasmProfiler()
        profiler.start()

        # Simulate hot function at PC 100
        for _ in range(10):
            profiler.record_instruction(pc=100, opcode=0x6a, duration_ns=100)

        # One instruction elsewhere
        profiler.record_instruction(pc=0, opcode=0x41, duration_ns=50)

        report = profiler.get_report()
        hotspots = report.get_hotspots(top_n=5)

        self.assertGreater(len(hotspots), 0)
        self.assertEqual(hotspots[0]['pc'], 100)

    def test_profiler_opcode_distribution(self):
        """Test opcode distribution analysis"""
        profiler = WasmProfiler()
        profiler.start()

        profiler.record_instruction(pc=0, opcode=0x41, duration_ns=100)
        profiler.record_instruction(pc=1, opcode=0x41, duration_ns=100)
        profiler.record_instruction(pc=2, opcode=0x6a, duration_ns=200)

        report = profiler.get_report()
        distribution = report.get_opcode_distribution()

        self.assertEqual(distribution[0x41]['count'], 2)
        self.assertEqual(distribution[0x6a]['count'], 1)

    def test_profiler_memory_usage(self):
        """Test memory usage profiling"""
        profiler = WasmProfiler()
        profiler.start()

        profiler.record_memory_alloc(size_bytes=1024)
        profiler.record_memory_alloc(size_bytes=2048)

        report = profiler.get_report()
        self.assertEqual(report.total_memory_allocated, 3072)

    def test_profiler_function_timing(self):
        """Test per-function timing"""
        profiler = WasmProfiler()
        profiler.start()

        profiler.enter_function("main")
        profiler.record_instruction(pc=0, opcode=0x41, duration_ns=100)
        profiler.exit_function("main")

        profiler.enter_function("helper")
        profiler.record_instruction(pc=50, opcode=0x6a, duration_ns=200)
        profiler.exit_function("helper")

        report = profiler.get_report()
        timing = report.get_function_timing()

        # Check that both functions were recorded
        self.assertIn("main", timing)
        self.assertIn("helper", timing)

        # Check that each function has timing data
        self.assertGreater(timing["main"]["duration_ns"], 0)
        self.assertGreater(timing["helper"]["duration_ns"], 0)

        # Check that call counts are correct
        self.assertEqual(timing["main"]["calls"], 1)
        self.assertEqual(timing["helper"]["calls"], 1)


class TestProfilerExport(unittest.TestCase):
    """Test profiler export functionality"""

    def test_profiler_export_json(self):
        """Test exporting profile as JSON"""
        profiler = WasmProfiler()
        profiler.start()

        profiler.record_instruction(pc=0, opcode=0x41, duration_ns=100)

        import json
        export = json.loads(profiler.export_json())

        self.assertIn("report", export)
        self.assertEqual(export["report"]["total_instructions"], 1)


class TestProfilerReset(unittest.TestCase):
    """Test profiler reset functionality"""

    def test_profiler_reset(self):
        """Test resetting profiler data"""
        profiler = WasmProfiler()
        profiler.start()

        profiler.record_instruction(pc=0, opcode=0x41, duration_ns=100)
        self.assertEqual(profiler.get_total_instructions(), 1)

        profiler.reset()
        self.assertEqual(profiler.get_total_instructions(), 0)


if __name__ == '__main__':
    unittest.main(verbosity=2)
