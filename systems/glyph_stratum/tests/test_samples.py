#!/usr/bin/env python3
"""
Sample Program Loader for GlyphStratum

Loads and validates sample programs from sample_programs.json
"""

import sys
import json
sys.path.insert(0, 'agent-harness/cli_anything')

from glyph_stratum.core.stratum import Stratum, Opcode
from glyph_stratum.core.glyph_registry import GlyphRegistry


def load_samples():
    """Load sample programs from JSON file."""
    with open('sample_programs.json', 'r') as f:
        return json.load(f)


def validate_program(name: str, program: dict) -> dict:
    """Validate a sample program and return stats."""
    registry = GlyphRegistry()

    glyphs = program.get('glyphs', {})
    for idx_str, glyph_data in glyphs.items():
        idx = int(idx_str)
        stratum = Stratum.from_value(glyph_data.get('stratum', 'SUBSTRATE'))
        opcode = Opcode.from_value(glyph_data.get('opcode', 'NOP'))

        deps = glyph_data.get('dependencies', [])
        runtime_refs = glyph_data.get('runtime_refs', [])

        # Create in registry
        g = registry.create(
            stratum=stratum,
            opcode=opcode,
            rationale=glyph_data.get('rationale', ''),
            dependencies=deps,
            invariants=glyph_data.get('invariants', {})
        )

        # Set runtime refs if any
        if runtime_refs:
            g.metadata.runtime_refs = runtime_refs

    # Validate
    errors = registry.validate_stratum_order()
    has_cycle = registry.has_cycle(use_runtime_refs=False)
    runtime_cycle = registry.has_cycle(use_runtime_refs=True)

    # Calculate coherence
    valid_deps = 0
    total_deps = 0
    for idx, glyph in registry.glyphs.items():
        for dep_idx in glyph.metadata.dependencies:
            total_deps += 1
            dep = registry.get(dep_idx)
            if dep and dep.stratum <= glyph.stratum:
                valid_deps += 1

    coherence = valid_deps / total_deps if total_deps > 0 else 1.0

    return {
        'name': name,
        'description': program.get('description', ''),
        'difficulty': program.get('difficulty', 'unknown'),
        'glyphs': len(glyphs),
        'dependencies': total_deps,
        'coherence': coherence,
        'errors': errors,
        'has_construction_cycle': has_cycle,
        'has_runtime_cycle': runtime_cycle,
        'strata': registry.strata_summary()
    }


def main():
    print("=" * 70)
    print("GlyphStratum Sample Programs Validation")
    print("=" * 70)

    data = load_samples()
    samples = data.get('samples', {})

    results = []
    for name, program in samples.items():
        result = validate_program(name, program)
        results.append(result)

        status = "✓" if result['coherence'] == 1.0 and not result['has_construction_cycle'] else "✗"
        print(f"\n{status} {name}")
        print(f"   Description: {result['description']}")
        print(f"   Difficulty: {result['difficulty']}")
        print(f"   Glyphs: {result['glyphs']}")
        print(f"   Dependencies: {result['dependencies']}")
        print(f"   Coherence: {result['coherence']*100:.0f}%")

        if result['errors']:
            print(f"   Errors: {len(result['errors'])}")
            for e in result['errors'][:3]:
                print(f"      - {e}")

        if result['has_runtime_cycle']:
            print(f"   Runtime cycles: Yes (expected for recursive)")

        print(f"   Strata: ", end="")
        parts = []
        for s, c in result['strata'].items():
            if c > 0:
                parts.append(f"{s}:{c}")
        print(", ".join(parts))

    # Summary
    print("\n" + "=" * 70)
    print("Summary")
    print("=" * 70)

    total_glyphs = sum(r['glyphs'] for r in results)
    avg_coherence = sum(r['coherence'] for r in results) / len(results) if results else 0

    print(f"Programs: {len(results)}")
    print(f"Total glyphs: {total_glyphs}")
    print(f"Average coherence: {avg_coherence*100:.0f}%")

    by_difficulty = {}
    for r in results:
        d = r['difficulty']
        by_difficulty[d] = by_difficulty.get(d, 0) + 1

    print(f"By difficulty: {by_difficulty}")

    # Export for visualizers
    print("\n" + "-" * 70)
    print("Copy any program JSON below to use in visualizers:")
    print("-" * 70)

    for name in ['add_two_numbers', 'factorial', 'calculator', 'json_parser', 'fibonacci']:
        if name in samples:
            prog = samples[name]
            print(f"\n# {name}")
            print(json.dumps({"name": name, "glyphs": prog['glyphs']}, indent=2)[:500] + "...")


if __name__ == "__main__":
    main()
