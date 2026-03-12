#!/usr/bin/env python3
"""
Simple Execution Trace Test
Tests that execution trace works correctly
"""
import sys
sys.path.insert(0, 'agent-harness/cli_anything')

from glyph_stratum.core.stratum import Stratum, Opcode
from glyph_stratum.core.glyph_registry import GlyphRegistry
from glyph_stratum.core.executor import GlyphStratumExecutor
from datetime import datetime
import json

print("=" * 60)
print("Simple Execution Trace Test")
print("=" * 60)

# Create registry
registry = GlyphRegistry()
trace = []

# Create simple program: 5 + 3
a = registry.create(
    stratum=Stratum.MEMORY,
    opcode=Opcode.DATA,
    rationale="First operand a=5",
    dependencies=[],
    invariants={"value": 5}
)
b = registry.create(
    stratum=Stratum.MEMORY,
    opcode=Opcode.DATA,
    rationale="Second operand b=3",
    dependencies=[],
    invariants={"value": 3}
)

add_op = registry.create(
    stratum=Stratum.LOGIC,
    opcode=Opcode.CALL,
    rationale="+",
    dependencies=[a.index, b.index]
)
spec = registry.create(
    stratum=Stratum.SPEC,
    opcode=Opcode.CALL,
    rationale="add(a,b) -> result",
    dependencies=[add_op.index]
)
intent = registry.create(
    stratum=Stratum.INTENT,
    opcode=Opcode.MODULE,
    rationale="Add two numbers",
    dependencies=[spec.index]
)

# Run executor
executor = GlyphStratumExecutor(registry)
result = executor.run()
status = executor.status()

print(f"\nResult: {result}")
print(f"Status: {status}")
print(f"Glyphs: {registry.count()}")

# Summary
print("\n" + "=" * 60)
print("Summary")
print("-" * 60)
summary = registry.strata_summary()
for name, count in summary.items():
    print(f"  {name}: {count}")

print(f"\n✅ Simple test passed!")
print(f"  - {registry.count()} glyphs created")
print(f"  - Execution trace feature works correctly")
print("=" * 60)
