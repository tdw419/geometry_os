#!/usr/bin/env python3
"""Example: Building a factorial program with the AI Agent."""
import sys
import os

# Add cli_anything to path
cli_anything_path = os.path.join(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "cli_anything"
)
sys.path.insert(0, cli_anything_path)

from agent import GlyphStratumAgent
from glyph_stratum.core.stratum import Opcode


def build_factorial():
    """
    Build a program to compute factorial(n).
    """
    agent = GlyphStratumAgent()

    # INTENT: Set the goal
    agent.set_goal("Calculate factorial of n")

    print(f"Goal: {agent.state.current_goal}")
    print(f"Phase: {agent.state.phase}")

    # INTENT: Add module glyph
    module_idx = agent.add_intent_glyph(
        "factorial_module",
        dependencies=[],
        rationale="Encapsulate factorial computation"
    )

    # SPEC: Function specification
    spec_idx = agent.add_spec_glyph(
        "factorial_spec",
        dependencies=[module_idx],
        rationale="Define factorial function signature"
    )

    # LOGIC: Base case check
    base_check = agent.add_logic_glyph(
        Opcode.BRANCH,
        dependencies=[spec_idx],
        rationale="if n <= 1 return 1"
    )

    # MEMORY: Input parameter n
    n_glyph = agent.add_memory_glyph(
        5,
        dependencies=[],
        rationale="Input value n=5"
    )

    # MEMORY: Base case value
    one_glyph = agent.add_memory_glyph(
        1,
        dependencies=[],
        rationale="Base case return value"
    )

    print(f"\nBuilt {len(agent.registry.glyphs)} glyphs")

    # Print dependency graph
    for idx in sorted(agent.registry.glyphs.keys()):
        glyph = agent.registry.glyphs[idx]
        deps = glyph.metadata.dependencies
        print(f"  [{idx}] {glyph.stratum.name}.{glyph.opcode.name} -> deps: {deps}")

    # Run the program
    result = agent.run()
    print(f"\nExecution result: {result}")


if __name__ == "__main__":
    build_factorial()
