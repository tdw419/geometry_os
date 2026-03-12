#!/usr/bin/env python3
"""
Debug LLM Response - Capture and analyze what the LLM actually produces.
"""
import os
import sys
import json

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "agent-harness", "cli_anything"))

from llm_test_harness import LLMTestHarness, TEST_TASKS

def debug_coherence():
    """Debug coherence measurement with detailed output."""
    harness = LLMTestHarness()

    # Simulated LLM response (what a typical LLM might produce)
    simulated_response = json.dumps({
        "name": "addition_program",
        "glyphs": {
            "0": {
                "stratum": "INTENT",
                "opcode": "MODULE",
                "rationale": "Add two numbers and return result",
                "dependencies": [1, 2, 3],  # INTENT depending on lower strata
                "invariants": {}
            },
            "1": {
                "stratum": "SPEC",
                "opcode": "CALL",
                "rationale": "add(a, b) -> result",
                "dependencies": [4],
                "invariants": {}
            },
            "2": {
                "stratum": "MEMORY",
                "opcode": "DATA",
                "rationale": "First operand: a",
                "dependencies": [],
                "invariants": {"value": 5}
            },
            "3": {
                "stratum": "MEMORY",
                "opcode": "DATA",
                "rationale": "Second operand: b",
                "dependencies": [],
                "invariants": {"value": 3}
            },
            "4": {
                "stratum": "LOGIC",
                "opcode": "CALL",
                "rationale": "+ operator",
                "dependencies": [2, 3],  # LOGIC depending on MEMORY
                "invariants": {}
            }
        }
    }, indent=2)

    print("=" * 60)
    print("DEBUG: Coherence Analysis")
    print("=" * 60)

    # Load the response
    harness.load_llm_response(simulated_response)

    print("\nGlyphs loaded:")
    for idx, glyph in harness.registry.glyphs.items():
        print(f"  [{idx}] {glyph.stratum.name:10} {glyph.opcode.name:8} deps={glyph.metadata.dependencies}")

    print("\n" + "-" * 60)
    print("Dependency Analysis:")
    print("-" * 60)

    total_deps = 0
    valid_deps = 0
    invalid_deps = []

    for idx, glyph in harness.registry.glyphs.items():
        for dep_idx in glyph.metadata.dependencies:
            total_deps += 1
            dep = harness.registry.get(dep_idx)
            if dep:
                is_valid = dep.stratum <= glyph.stratum
                if is_valid:
                    valid_deps += 1
                    print(f"  ✓ Glyph {idx} ({glyph.stratum.name}) -> {dep_idx} ({dep.stratum.name})")
                else:
                    invalid_deps.append((idx, glyph.stratum.name, dep_idx, dep.stratum.name))
                    print(f"  ✗ Glyph {idx} ({glyph.stratum.name}) -> {dep_idx} ({dep.stratum.name}) INVALID!")
            else:
                print(f"  ? Glyph {idx} -> {dep_idx} (missing)")

    print(f"\n" + "-" * 60)
    print(f"Results:")
    print(f"  Valid deps: {valid_deps}/{total_deps}")
    print(f"  Coherence: {valid_deps/total_deps*100 if total_deps > 0 else 100:.1f}%")

    if invalid_deps:
        print(f"\nInvalid dependencies (higher stratum depending on lower):")
        for src, src_stratum, dst, dst_stratum in invalid_deps:
            print(f"  {src} ({src_stratum}) -> {dst} ({dst_stratum})")

    return harness


def test_with_real_llm():
    """Test with real LLM and capture the response."""
    anthropic_key = os.environ.get("ANTHROPIC_API_KEY")
    if not anthropic_key:
        print("\nNo ANTHROPIC_API_KEY - skipping real LLM test")
        return None

    try:
        import anthropic
        client = anthropic.Anthropic(api_key=anthropic_key)

        harness = LLMTestHarness()
        task = TEST_TASKS[0]
        prompt = harness.get_prompt_for_task(task)

        print("=" * 60)
        print("Testing with Anthropic (real LLM)")
        print("=" * 60)

        response = client.messages.create(
            model="claude-3-5-sonnet-20241022",
            max_tokens=4096,
            messages=[{"role": "user", "content": prompt}]
        )

        llm_response = response.content[0].text

        # Extract JSON from response
        print("\n" + "-" * 60)
        print("Raw LLM Response (first 2000 chars):")
        print("-" * 60)
        print(llm_response[:2000])

        # Try to find JSON
        json_start = llm_response.find("{")
        json_end = llm_response.rfind("}") + 1
        if json_start >= 0 and json_end > json_start:
            json_str = llm_response[json_start:json_end]
            data = json.loads(json_str)

            print("\n" + "-" * 60)
            print("Parsed Glyphs:")
            print("-" * 60)
            for idx, g in data.get("glyphs", {}).items():
                print(f"  [{idx}] {g.get('stratum', '?'):10} {g.get('opcode', '?'):8} deps={g.get('dependencies', [])}")

            # Analyze coherence
            harness.load_llm_response(json_str)
            coherence = harness.measure_coherence()

            print(f"\nCoherence: {coherence*100:.1f}%")

            # Show invalid deps
            print("\nDependency Analysis:")
            for idx, glyph in harness.registry.glyphs.items():
                for dep_idx in glyph.metadata.dependencies:
                    dep = harness.registry.get(dep_idx)
                    if dep:
                        is_valid = dep.stratum <= glyph.stratum
                        status = "✓" if is_valid else "✗"
                        print(f"  {status} [{idx}] {glyph.stratum.name} -> [{dep_idx}] {dep.stratum.name}")

            return data

    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return None


if __name__ == "__main__":
    print("Choose test:")
    print("1. Debug coherence with simulated response")
    print("2. Test with real Anthropic API")

    choice = input("\nChoice: ").strip()

    if choice == "1":
        debug_coherence()
    elif choice == "2":
        test_with_real_llm()
    else:
        # Default to debug
        debug_coherence()
