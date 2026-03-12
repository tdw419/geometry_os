#!/usr/bin/env python3
"""Test Python parser with simple cases."""
import sys
sys.path.insert(0, 'agent-harness/cli_anything')

from glyph_stratum.core.python_parser import PythonToGlyphParser
from glyph_stratum.core.stratum import Stratum

parser = PythonToGlyphParser()

code = '''def add(a, b):
    return a + b
'''

registry = parser.parse(code, 'add')

print(f'Parsed add function: {len(registry.glyphs)} glyphs')
print(f'Coherence: {registry.validate_stratum_order() *100:.0f}%')
print()
print('Strata distribution:')
for s_name, count in registry.strata_summary().items():
    print(f'  {s_name}: {count}')
print()
print('Glyph details:')
for idx in sorted(registry.glyphs.items()):
    g = registry.glyphs[idx]
    deps = g.metadata.dependencies
    print(f'  [{idx}] {g.stratum.name:10} {g.opcode.name:8} deps={deps}')

print()
print('=' * 60)
