#!/usr/bin/env python3
"""
Geometry OS - Phase 70 Verification Script
Chunk 4: Integration & Verification

Verifies all Phase 70 components work together:
- Distributed shader compiles to SPIR-V
- Glyph-to-glyph compiler generates programs
- Factorial and counter programs are compiled
- Distributed coordinator runs
"""

import subprocess
import sys
from pathlib import Path


def run_command(cmd: str, description: str) -> bool:
    """
    Run a shell command and report results.

    Args:
        cmd: Shell command to execute
        description: Human-readable description of the check

    Returns:
        True if command succeeded, False otherwise
    """
    print(f"[VERIFY] {description}")
    print(f"  Running: {cmd}")

    result = subprocess.run(
        cmd,
        shell=True,
        capture_output=True,
        text=True
    )

    if result.returncode == 0:
        print("  \u2713 PASS")
        return True
    else:
        print("  \u2717 FAIL")
        if result.stderr:
            print(f"  Error: {result.stderr.strip()}")
        return False


def verify_phase70() -> int:
    """
    Run all Phase 70 verification checks.

    Returns:
        0 if all checks pass, 1 otherwise
    """
    print("=" * 60)
    print("GEOMETRY OS - PHASE 70 VERIFICATION")
    print("=" * 60)
    print()

    checks = [
        (
            "~/.cargo/bin/naga systems/visual_shell/web/shaders/glyph_distributed.wgsl /tmp/test.spv",
            "Distributed shader compiles to SPIR-V"
        ),
        (
            "python3 systems/glyph_stratum/compiler/glyph_to_glyph.py",
            "Glyph-to-glyph compiler generates programs"
        ),
        (
            "test -f systems/glyph_stratum/bricks/factorial.rts.png",
            "Factorial program compiled"
        ),
        (
            "test -f systems/glyph_stratum/bricks/counter.rts.png",
            "Counter program compiled"
        ),
        (
            "timeout 10 python3 systems/glyph_stratum/distributed/swarm_coordinator.py",
            "Distributed coordinator runs"
        ),
    ]

    results = []
    for cmd, description in checks:
        result = run_command(cmd, description)
        results.append(result)
        print()

    # Print summary
    print("=" * 60)
    print("RESULTS SUMMARY")
    print("=" * 60)
    passed = sum(results)
    total = len(results)
    print(f"  Passed: {passed}/{total}")

    if all(results):
        print("\n  STATUS: ALL CHECKS PASSED")
        return 0
    else:
        print("\n  STATUS: SOME CHECKS FAILED")
        return 1


if __name__ == "__main__":
    sys.exit(verify_phase70())
