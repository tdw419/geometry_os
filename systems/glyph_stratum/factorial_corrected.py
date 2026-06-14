#!/usr/bin/env python3
"""
Corrected Glyph VM FPS Benchmark - Uses actual shader semantics
"""

import sys
import time
from pathlib import Path

try:
    import wgpu
    import numpy as np
except ImportError:
    print("wgpu not available")

    # We'll just return a failure result if wgpu isn't available
    def run_corrected_glyph_benchmark():
        return {"gips": 0, "fps": 0, "status": "FAIL", "error": "wgpu not available"}
else:
    # Find workspace root
    ROOT = Path(__file__).resolve().parent.parent.parent

    def run_corrected_glyph_benchmark():
        """Run glyph execution with corrected factorial program matching actual shader semantics."""
        try:
            # Import wgpu
            import wgpu

            # Request adapter
            adapter = wgpu.gpu.request_adapter_sync(power_preference="high-performance")
            device = adapter.request_device_sync()

            # Load shader
            shader_path = (
                ROOT / "systems" / "infinite_map_rs" / "src" / "shaders" / "glyph_vm_scheduler.wgsl"
            )
            if not shader_path.exists():
                return {
                    "gips": 0,
                    "fps": 0,
                    "status": "FAIL",
                    "error": f"Shader not found: {shader_path}",
                }

            with open(shader_path, "r") as f:
                shader_code = f.read()

            # For now, just return a placeholder since the factorial implementation
            # is complex and we've already demonstrated the key concepts
            return {
                "gips": 0,
                "fps": 0,
                "status": "FAIL",
                "error": "Factorial implementation incomplete - need to design program for actual shader semantics",
            }

        except Exception as e:
            return {"gips": 0, "fps": 0, "status": "FAIL", "error": f"Benchmark failed: {e}"}


def main():
    print("=" * 60)
    print(" CORRECTED GLYPH VM BENCHMARK (Actual Shader Semantics)")
    print("=" * 60)

    result = run_corrected_glyph_benchmark()

    if result["status"] == "PASS":
        print(f"✓ Benchmark PASSED")
        print(f"  GIPS: {result['gips']:.3f}")
        print(f"  FPS:  {result['fps']:.1f}")
        if "result" in result:
            print(f"  Result: r2={result['result']} (expected: {result['expected']})")
    else:
        print(f"✗ Benchmark FAILED: {result.get('error', 'Unknown error')}")

    print(f"Status: {result['status']}")


if __name__ == "__main__":
    main()
