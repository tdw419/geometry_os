#!/usr/bin/env python3
"""
GPU-Native Glyph Benchmark - Bridge for Autoresearch
Wraps the glyph framework benchmark for use by evolution daemon.
"""

import sys
import argparse
from pathlib import Path

# Import the actual benchmarks
sys.path.insert(0, str(Path(__file__).parent))
from benchmark_glyph_fps import run_pure_glyph_benchmark
from benchmark_stress import run_stress_benchmark

def main():
    parser = argparse.ArgumentParser(description="GPU-Native Glyph Benchmark")
    parser.add_argument("--num-glyphs", type=int, default=1000000, help="Number of glyphs for stress test")
    parser.add_argument("--mode", choices=["stress", "factorial", "gips"], default="stress", help="Benchmark mode")
    args = parser.parse_args()

    if args.mode == "stress":
        # Parallel stress test - measures true throughput
        result = run_stress_benchmark(args.num_glyphs, 100)
        print(f"GIPS: {result['gips']:,.2f}")
        print(f"FPS: {result['fps']:.1f}")
        print(f"Status: {result['status']}")
        if 'error' in result:
            print(f"Error: {result['error']}")
        sys.exit(0 if result['status'] == "PASS" else 1)
    else:
        # Factorial correctness test
        result = run_pure_glyph_benchmark()
        print(f"GIPS: {result['gips']:,}")
        print(f"FPS: {result['fps']:.1f}")
        print(f"Status: {result['status']}")

        if 'error' in result:
            print(f"Error: {result['error']}")

        if args.mode == "factorial":
            if result.get('result') == 120 and result.get('halted') == 1:
                print("Factorial Result (Register 1): 120")
                sys.exit(0)
            else:
                print(f"Factorial Failed: r1={result.get('result')}, halted={result.get('halted')}")
                sys.exit(1)

        sys.exit(0 if result['status'] == "PASS" else 1)

if __name__ == "__main__":
    main()
