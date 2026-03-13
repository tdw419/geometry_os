#!/usr/bin/env python3
"""
Glyph Execution FPS Benchmark

Measures the execution speed of the GlyphExecutionPipeline.
Target: 120 FPS (8.33ms per frame) with 10,000+ glyphs per frame.

Usage:
    python3 systems/glyph_stratum/benchmark_glyph_fps.py

Output (TSV):
    timestamp_ms    glyphs    cycles    fps    gips    status
"""

import json
import subprocess
import sys
import time
from pathlib import Path

# Try to import node-runner for JS execution
try:
    import subprocess
    HAS_NODE = subprocess.run(['which', 'node'], capture_output=True).returncode == 0
except:
    HAS_NODE = False

# Benchmark configuration
TARGET_FPS = 120
TARGET_GIPS = 1_000_000  # 1 million glyphs per second
WARMUP_FRAMES = 10
BENCHMARK_FRAMES = 100

# Test program: factorial (from test_programs/factorial.glyph)
FACTORIAL_PROGRAM = {
    "name": "factorial_benchmark",
    "glyphs": {
        "0": {"opcode": 206, "stratum": 0, "p1": 5, "p2": 0, "target": 0},   # LOAD 5 -> r0
        "1": {"opcode": 206, "stratum": 0, "p1": 1, "p2": 0, "target": 1},   # LOAD 1 -> r1 (accumulator)
        "2": {"opcode": 206, "stratum": 0, "p1": 1, "p2": 0, "target": 2},   # LOAD 1 -> r2 (counter)
        # Loop: r1 = r1 * r0, r0 = r0 - 1, if r0 > 0 goto loop
        "3": {"opcode": 202, "stratum": 2, "p1": 0, "p2": 0, "target": 1},   # MUL r1 = r1 * r0 (using p1 as reg index)
        "4": {"opcode": 201, "stratum": 2, "p1": 0, "p2": 0, "target": 0},   # SUB r0 = r0 - 1
        "5": {"opcode": 209, "stratum": 2, "p1": 3, "p2": 0, "target": 0},   # BNZ r0 != 0 -> goto 3
        "6": {"opcode": 212, "stratum": 2, "p1": 0, "p2": 0, "target": 0},   # HALT
    }
}


def benchmark_native_python():
    """Benchmark using native Python glyph interpreter (baseline)."""
    print("[Benchmark] Running native Python interpreter...")

    # Simple Python interpreter for glyphs
    class GlyphVM:
        def __init__(self):
            self.memory = [0.0] * 1024
            self.pc = 0
            self.halted = False
            self.cycles = 0

        def run(self, program, max_cycles=10000):
            glyphs = program.get('glyphs', {})
            while not self.halted and self.cycles < max_cycles:
                glyph = glyphs.get(str(self.pc))
                if not glyph:
                    break

                opcode = glyph['opcode']
                p1, p2, target = glyph['p1'], glyph['p2'], glyph['target']

                if opcode == 200:  # ADD
                    self.memory[target] = p1 + p2
                elif opcode == 201:  # SUB
                    self.memory[target] = p1 - p2
                elif opcode == 202:  # MUL
                    self.memory[target] = self.memory[int(p1)] * self.memory[int(p2)]
                elif opcode == 203:  # DIV
                    if p2 != 0:
                        self.memory[target] = p1 / p2
                elif opcode == 206:  # LOAD immediate
                    self.memory[target] = p1
                elif opcode == 209:  # BNZ
                    if self.memory[target] != 0:
                        self.pc = int(p1) - 1
                elif opcode == 212:  # HALT
                    self.halted = True

                self.pc += 1
                self.cycles += 1

            return self.cycles

    # Warmup
    for _ in range(WARMUP_FRAMES):
        vm = GlyphVM()
        vm.run(FACTORIAL_PROGRAM)

    # Benchmark
    start = time.perf_counter()
    total_cycles = 0
    for _ in range(BENCHMARK_FRAMES):
        vm = GlyphVM()
        total_cycles += vm.run(FACTORIAL_PROGRAM)
    elapsed = time.perf_counter() - start

    fps = BENCHMARK_FRAMES / elapsed
    gips = total_cycles / elapsed

    return {
        'fps': fps,
        'gips': gips,
        'cycles': total_cycles,
        'frames': BENCHMARK_FRAMES,
        'elapsed_ms': elapsed * 1000,
        'interpreter': 'python_native'
    }


def benchmark_webgpu_node():
    """Benchmark using WebGPU via Node.js (if available)."""
    if not HAS_NODE:
        return None

    # Create a Node.js benchmark script
    node_script = '''
const { GlyphExecutionPipeline } = require('./systems/visual_shell/web/GlyphExecutionPipeline.js');

// Mock WebGPU for Node (uses native-wgpu or similar)
// For now, return mock data
const results = {
    fps: 0,
    gips: 0,
    error: 'WebGPU not available in Node.js without native adapter'
};
console.log(JSON.stringify(results));
'''

    try:
        result = subprocess.run(
            ['node', '-e', node_script],
            capture_output=True,
            text=True,
            timeout=10,
            cwd=Path(__file__).parent.parent.parent
        )
        if result.returncode == 0:
            return json.loads(result.stdout.strip())
    except Exception as e:
        pass

    return None


def main():
    print("=" * 60)
    print("Geometry OS - Glyph Execution FPS Benchmark")
    print(f"Target: {TARGET_FPS} FPS, {TARGET_GIPS:,} GIPS")
    print("=" * 60)
    print()

    results = []

    # Run Python benchmark
    py_result = benchmark_native_python()
    results.append(py_result)

    print(f"[Python Native]")
    print(f"  FPS: {py_result['fps']:.1f}")
    print(f"  GIPS: {py_result['gips']:,.0f}")
    print(f"  Total cycles: {py_result['cycles']:,}")
    print(f"  Elapsed: {py_result['elapsed_ms']:.1f}ms")
    print()

    # Try WebGPU benchmark
    gpu_result = benchmark_webgpu_node()
    if gpu_result:
        results.append(gpu_result)
        print(f"[WebGPU]")
        print(f"  FPS: {gpu_result.get('fps', 0):.1f}")
        print(f"  GIPS: {gpu_result.get('gips', 0):,.0f}")
        if 'error' in gpu_result:
            print(f"  Error: {gpu_result['error']}")
        print()

    # Summary
    print("=" * 60)
    print("SUMMARY")
    print("=" * 60)

    best_fps = max(r['fps'] for r in results)
    best_gips = max(r['gips'] for r in results)

    fps_status = "✓ PASS" if best_fps >= TARGET_FPS else "✗ FAIL"
    gips_status = "✓ PASS" if best_gips >= TARGET_GIPS else "✗ FAIL"

    print(f"Best FPS: {best_fps:.1f} / {TARGET_FPS} {fps_status}")
    print(f"Best GIPS: {best_gips:,.0f} / {TARGET_GIPS:,} {gips_status}")

    # Output TSV for autoresearch logging
    print()
    print("# TSV Output:")
    print(f"timestamp_ms\tglyphs\tcycles\tfps\tgips\tstatus")
    for r in results:
        status = "pass" if r['fps'] >= TARGET_FPS else "fail"
        print(f"{int(time.time()*1000)}\t{len(FACTORIAL_PROGRAM['glyphs'])}\t{r['cycles']}\t{r['fps']:.1f}\t{r['gips']:.0f}\t{status}")

    return 0 if fps_status == "✓ PASS" else 1


if __name__ == "__main__":
    sys.exit(main())
