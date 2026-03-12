#!/usr/bin/env python3
"""Demo Python to GlyphStratum conversion."""

import sys
sys.path.insert(0, 'agent-harness/cli_anything')

from glyph_stratum.core.stratum import Stratum, Opcode
from glyph_stratum.core.glyph_registry import GlyphRegistry

print("=" * 60)
print("GlyphStratum Simple Test")
print("=" * 60)

registry = GlyphRegistry()

# Create glyphs manually
g0 = registry.create(Stratum.SUBSTRATE, Opcode.DATA, "value 5", [])
g1 = registry.create(Stratum.SUBSTRATE, Opcode.DATA, "value 3", [])
g2 = registry.create(Stratum.MEMORY, Opcode.LOAD, "load a", [g0.index])
g3 = registry.create(Stratum.MEMORY, Opcode.LOAD, "load b", [g1.index])
g4 = registry.create(Stratum.LOGIC, Opcode.CALL, "+", [g2.index, g3.index])
g5 = registry.create(Stratum.SPEC, Opcode.EXPORT, "add function", [g4.index])
g6 = registry.create(Stratum.INTENT, Opcode.MODULE, "add module", [g5.index])

print("Parsed:", len(registry.glyphs), "glyphs")
print()

result = registry.validate_stratum_order()
if result:
    print("Coherence: 100%")
else:
    print("Issues found:")
    for issue in result:
        print(f"  - {issue}")

print()
print("Strata distribution:")
summary = registry.strata_summary()
for s_name in ["SUBSTRATE", "MEMORY", "LOGIC", "SPEC", "INTENT"]:
    count = summary.get(s_name, 0)
print(f"  {s_name}: {count}")

print()
print("Glyph details:")
for idx in sorted(registry.glyphs.keys()):
    g = registry.glyphs[idx]
    deps = g.metadata.dependencies
    print(f"  [{idx}] {g.stratum.name:10} {g.opcode.name:8} deps={deps}")

print()
print("=" * 60)
