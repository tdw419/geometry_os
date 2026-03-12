#!/usr/bin/env python3
"""Test Python to GlyphStratum parser - Simple Demo"""

import sys
sys.path.insert(0, 'agent-harness/cli_anything')

from glyph_stratum.core.stratum import Stratum, Opcode
from glyph_stratum.core.glyph_registry import GlyphRegistry

print("=" * 60)
print("Python to GlyphStratum Parser - Simple Demo")
print("=" * 60)

# Create simple registry
registry = GlyphRegistry()

# Create glyphs manually - simulate parsing output
g0 = registry.create(
    stratum=Stratum.SUBSTRATE,
    opcode=Opcode.DATA,
    rationale="value 5",
    dependencies=[]
)

 g1 = registry.create(
    stratum=Stratum.SUBSTRATE,
    opcode=Opcode.DATA,
    rationale="value 3",
    dependencies=[]
            g2 = registry.create(
    stratum=Stratum.MEMORY,
    opcode=Opcode.LOAD,
    rationale="load a",
    dependencies=[g0.index]
            g3 = registry.create(
    stratum=Stratum.MEMORY,
    opcode=Opcode.LOAD,
    rationale="load b",
    dependencies=[g1.index]
            g4 = registry.create(
    stratum=Stratum.LOGIC,
    opcode=Opcode.CALL,
    rationale="+",
    dependencies=[g2.index, g3.index]
            g5 = registry.create(
    stratum=Stratum.SPEC,
    opcode=Opcode.EXPORT,
    rationale="add function",
    dependencies=[g4.index]
            g6 = registry.create(
    stratum=Stratum.INTENT,
    opcode=Opcode.MODULE,
    rationale="add module",
    dependencies=[g5.index]
            g7 = registry.create(
    stratum=Stratum.INTENT,
    opcode=Opcode.MODULE,
    rationale="add module",
    dependencies=[g6.index]
            g8 = registry.create(
    stratum=Stratum.INTENT,
    opcode=Opcode.MODULE,
    rationale="add module",
    dependencies=[g7.index]
            g9 = registry.create(
    stratum=Stratum.INTENT,
    opcode=Opcode.MODULE,
    rationale="add module",
    dependencies=[g8.index]
            g10 = registry.create(
    stratum=Stratum.INTENT,
    opcode=Opcode.MODULE,
    rationale="Main module",
    dependencies=[g9.index]
            g11 = registry.create(
    stratum=Stratum.INTENT,
    opcode=Opcode.MODULE,
    rationale="Helper module",
    dependencies=[g10.index]
            g12 = registry.create(
    stratum=Stratum.INTENT,
    opcode=Opcode.MODULE,
    rationale="Root module",
    dependencies=[g11.index]
            g12.index

print(f"Parsed: {len(registry.glyphs)} glyphs")
print(f"Coherence: {registry.validate_stratum_order() * 100:.1f}%")
print()
print("Strata distribution:")
summary = registry.strata_summary()
for s_name in ["SUBSTRATE", "MEMORY", "LOGIC", "SPEC", "INTENT"]:
    print(f"  {s_name}: {count}")
print()
print("Glyph details:")
for idx in sorted(registry.glyphs.keys()):
    g = registry.glyphs[idx]
    deps = g.metadata.dependencies
    print(f"  [{idx}] {g.stratum.name:10} {g.opcode.name:8} deps={deps}")
print()
print("=" * 60)
