#!/usr/bin/env python3
"""
GlyphStratum LLM Test Harness

Tests the hypothesis: Does structured visual programming help AI stay coherent?

This harness provides a prompt template for LLMs to build programs using
GlyphStratum's 5-strata approach, then measures:
- Coherence: Does the LLM follow the strata order?
- Completeness: Are all necessary glyphs created?
- Correctness: Do dependencies form a valid DAG?
- Self-awareness: Can the LLM query and explain what it built?
"""
import json
import sys
import os
from datetime import datetime
from typing import Dict, List, Any, Optional
from dataclasses import dataclass, field

# Add path for imports
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "agent-harness", "cli_anything"))

from glyph_stratum.core.stratum import Stratum, Opcode, GlyphInfo, GlyphMetadata, ProvenanceInfo
from glyph_stratum.core.glyph_registry import GlyphRegistry
from glyph_stratum.core.executor import GlyphStratumExecutor, run_program


@dataclass
class LLMTestResult:
    """Results from an LLM building a GlyphStratum program."""
    task: str
    success: bool
    glyphs_created: int
    strata_used: Dict[str, int]
    coherence_score: float  # 0-1, did they follow strata order?
    completeness_score: float  # 0-1, are all needed glyphs present?
    execution_result: Any
    errors: List[str] = field(default_factory=list)
    reasoning_trace: List[str] = field(default_factory=list)


class LLMTestHarness:
    """
    Harness for testing LLMs building GlyphStratum programs.

    Provides structured prompts and measures coherence.
    """

    # The prompt template for LLMs
    LLM_PROMPT_TEMPLATE = """
You are building a program using GlyphStratum, an AI-native visual programming language.

## GlyphStratum Architecture

GlyphStratum has 5 layers (strata) numbered from bottom to top:

0. **SUBSTRATE** - Raw data primitives (integers, strings, bytes)
1. **MEMORY** - Data storage (variables, arrays, structs)
2. **LOGIC** - Control flow (loops, branches, calls)
3. **SPEC** - Interfaces and contracts
4. **INTENT** - Goals and requirements

## CRITICAL: Dependency Direction Rule

Dependencies must point DOWNWARD (to lower strata):
- INTENT (4) can depend on SPEC (3), LOGIC (2), MEMORY (1), SUBSTRATE (0)
- SPEC (3) can depend on LOGIC (2), MEMORY (1), SUBSTRATE (0)
- LOGIC (2) can depend on MEMORY (1), SUBSTRATE (0)
- MEMORY (1) can depend on SUBSTRATE (0)
- SUBSTRATE (0) has no dependencies

❌ WRONG: SPEC depending on INTENT (lower depending on higher)
✓ CORRECT: INTENT depending on SPEC (higher depending on lower)

## Available Opcodes

- ALLOC, FREE, LOAD, STORE - Memory operations
- LOOP, BRANCH, CALL, RETURN - Control flow
- DATA, TYPE, PTR, STRUCT - Data types
- MODULE, EXPORT, IMPORT - Program structure
- NOP, HALT - Special

## Your Task

Build a program to: {task}

## Instructions

1. Start with SUBSTRATE: Define raw data values
2. Build upward: SUBSTRATE → MEMORY → LOGIC → SPEC → INTENT
3. Each glyph's dependencies must be at LOWER strata
4. Each glyph needs:
   - `stratum`: Which layer (SUBSTRATE/MEMORY/LOGIC/SPEC/INTENT)
   - `opcode`: What operation
   - `rationale`: Why this glyph exists
   - `dependencies`: List of glyph indices at LOWER strata this depends on

## Example (Add 5 + 3)

```json
{{
  "name": "addition",
  "glyphs": {{
    "0": {{"stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "value 5", "dependencies": [], "invariants": {{"value": 5}}}},
    "1": {{"stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "value 3", "dependencies": [], "invariants": {{"value": 3}}}},
    "2": {{"stratum": "MEMORY", "opcode": "LOAD", "rationale": "load operand a", "dependencies": [0], "invariants": {{}}}},
    "3": {{"stratum": "MEMORY", "opcode": "LOAD", "rationale": "load operand b", "dependencies": [1], "invariants": {{}}}},
    "4": {{"stratum": "LOGIC", "opcode": "CALL", "rationale": "add operation", "dependencies": [2, 3], "invariants": {{}}}},
    "5": {{"stratum": "SPEC", "opcode": "EXPORT", "rationale": "add(a,b) interface", "dependencies": [4], "invariants": {{}}}},
    "6": {{"stratum": "INTENT", "opcode": "MODULE", "rationale": "add two numbers", "dependencies": [5], "invariants": {{}}}}
  }}
}}
```

Notice: Each glyph's dependencies point to glyphs at LOWER strata (smaller numbers).

## Output Format

Output a JSON program following the example structure above. Build the program now.
"""

    def __init__(self):
        self.registry = None
        self.trace = []

    def get_prompt_for_task(self, task: str) -> str:
        """Get the LLM prompt for a specific task."""
        return self.LLM_PROMPT_TEMPLATE.format(task=task)

    def load_llm_response(self, json_response: str) -> GlyphRegistry:
        """Load an LLM's JSON response into a registry."""
        self.registry = GlyphRegistry()
        data = json.loads(json_response)

        for idx_str, glyph_data in data.get("glyphs", {}).items():
            idx = int(idx_str)
            stratum = Stratum.from_value(glyph_data.get("stratum", "SUBSTRATE"))
            opcode = Opcode.from_value(glyph_data.get("opcode", "NOP"))

            # Convert dependencies to integers (LLMs may return strings)
            deps = glyph_data.get("dependencies", [])
            deps = [int(d) for d in deps] if deps else []

            metadata = GlyphMetadata(
                dependencies=deps,
                invariants=glyph_data.get("invariants", {}),
                rationale=glyph_data.get("rationale", ""),
                provenance=ProvenanceInfo()
            )

            glyph = GlyphInfo(
                index=idx,
                stratum=stratum,
                opcode=opcode,
                metadata=metadata
            )
            self.registry.glyphs[idx] = glyph

        return self.registry

    def measure_coherence(self) -> float:
        """
        Measure if glyphs follow strata ordering.
        Higher strata should not depend on lower strata in invalid ways.
        """
        if not self.registry or not self.registry.glyphs:
            return 0.0

        valid_deps = 0
        total_deps = 0

        for idx, glyph in self.registry.glyphs.items():
            for dep_idx in glyph.metadata.dependencies:
                total_deps += 1
                dep = self.registry.get(dep_idx)
                if dep:
                    # Dependency should be at same or lower stratum
                    if dep.stratum <= glyph.stratum:
                        valid_deps += 1

        return valid_deps / total_deps if total_deps > 0 else 1.0

    def measure_completeness(self, required_strata: List[str] = None) -> float:
        """
        Measure if all expected strata are represented.
        """
        if not self.registry or not self.registry.glyphs:
            return 0.0

        if required_strata is None:
            required_strata = ["INTENT", "LOGIC", "MEMORY"]

        strata_present = set()
        for glyph in self.registry.glyphs.values():
            strata_present.add(glyph.stratum.name)

        present_count = sum(1 for s in required_strata if s in strata_present)
        return present_count / len(required_strata)

    def get_strata_distribution(self) -> Dict[str, int]:
        """Get count of glyphs per stratum."""
        distribution = {s.name: 0 for s in Stratum}
        if self.registry:
            for glyph in self.registry.glyphs.values():
                distribution[glyph.stratum.name] += 1
        return distribution

    def run_test(self, task: str, llm_json_response: str) -> LLMTestResult:
        """
        Run a complete test: load LLM response and evaluate.
        """
        errors = []

        try:
            self.load_llm_response(llm_json_response)
        except Exception as e:
            errors.append(f"Failed to load LLM response: {e}")
            return LLMTestResult(
                task=task,
                success=False,
                glyphs_created=0,
                strata_used={},
                coherence_score=0,
                completeness_score=0,
                execution_result=None,
                errors=errors
            )

        coherence = self.measure_coherence()
        completeness = self.measure_completeness()
        strata_used = self.get_strata_distribution()
        glyphs_created = len(self.registry.glyphs)

        # Try to execute
        execution_result = None
        try:
            result = run_program(self.registry)
            execution_result = result
        except Exception as e:
            errors.append(f"Execution error: {e}")

        success = coherence > 0.5 and completeness > 0.5 and len(errors) == 0

        return LLMTestResult(
            task=task,
            success=success,
            glyphs_created=glyphs_created,
            strata_used=strata_used,
            coherence_score=coherence,
            completeness_score=completeness,
            execution_result=execution_result,
            errors=errors
        )


# Test tasks of varying difficulty
TEST_TASKS = [
    # Easy
    "Add two numbers and return the result",
    "Check if a number is even",

    # Medium
    "Calculate the factorial of a number",
    "Find the maximum value in a list",

    # Hard
    "Parse a JSON string into a data structure",
    "Implement a simple calculator with +, -, *, /",
]


class RealLLMTester:
    """Test with real LLM APIs (OpenAI or Anthropic)."""

    def __init__(self, harness: LLMTestHarness):
        self.harness = harness
        self.client = None

    def setup_openai(self, api_key: str):
        """Set up OpenAI client."""
        try:
            import openai
            self.client = openai.OpenAI(api_key=api_key)
            self.provider = "openai"
            return True
        except ImportError:
            print("OpenAI package not installed")
            return False

    def setup_anthropic(self, api_key: str):
        """Set up Anthropic client."""
        try:
            import anthropic
            self.client = anthropic.Anthropic(api_key=api_key)
            self.provider = "anthropic"
            return True
        except ImportError:
            print("Anthropic package not installed")
            return False

    def test_task(self, task: str) -> LLMTestResult:
        """Run a test with the LLM."""
        if not self.client:
            raise ValueError("No LLM client configured. Call setup_openai() or setup_anthropic() first.")

        prompt = self.harness.get_prompt_for_task(task)

        if self.provider == "openai":
            response = self.client.chat.completions.create(
                model="gpt-4",
                messages=[{"role": "user", "content": prompt}],
                temperature=0.7
            )
            llm_response = response.choices[0].message.content
        else:  # anthropic
            response = self.client.messages.create(
                model="claude-sonnet-4-20250514",
                max_tokens=4096,
                messages=[{"role": "user", "content": prompt}]
            )
            llm_response = response.content[0].text

        return self.harness.run_test(task, llm_response)


def demo_llm_test():
    """Demonstrate the test harness with a simulated LLM response."""
    harness = LLMTestHarness()

    # Get prompt for a task
    task = "Add two numbers and return the result"
    prompt = harness.get_prompt_for_task(task)

    print("=" * 60)
    print("LLM TEST HARNESS DEMO")
    print("=" * 60)
    print(f"\nTask: {task}")
    print(f"\nPrompt would be sent to LLM...")
    print(f"\nPrompt preview (first 500 chars):\n{prompt[:500]}...")

    # Simulate an LLM response (this would come from actual LLM)
    simulated_response = json.dumps({
        "name": "addition_program",
        "glyphs": {
            "0": {
                "stratum": "INTENT",
                "opcode": "MODULE",
                "rationale": "Add two numbers and return result",
                "dependencies": [1],
                "invariants": {}
            },
            "1": {
                "stratum": "SPEC",
                "opcode": "CALL",
                "rationale": "add(a, b) -> result",
                "dependencies": [2, 3, 4],
                "invariants": {}
            },
            "2": {
                "stratum": "LOGIC",
                "opcode": "CALL",
                "rationale": "+",
                "dependencies": [3, 4],
                "invariants": {}
            },
            "3": {
                "stratum": "MEMORY",
                "opcode": "DATA",
                "rationale": "First operand: a",
                "dependencies": [],
                "invariants": {"value": 5}
            },
            "4": {
                "stratum": "MEMORY",
                "opcode": "DATA",
                "rationale": "Second operand: b",
                "dependencies": [],
                "invariants": {"value": 3}
            }
        }
    }, indent=2)

    print("\n" + "=" * 60)
    print("SIMULATED LLM RESPONSE:")
    print("=" * 60)
    print(simulated_response)

    # Evaluate the response
    result = harness.run_test(task, simulated_response)

    print("\n" + "=" * 60)
    print("TEST RESULTS:")
    print("=" * 60)
    print(f"Task: {result.task}")
    print(f"Success: {result.success}")
    print(f"Glyphs Created: {result.glyphs_created}")
    print(f"Strata Distribution: {result.strata_used}")
    print(f"Coherence Score: {result.coherence_score:.2f}")
    print(f"Completeness Score: {result.completeness_score:.2f}")
    if result.execution_result:
        print(f"Execution Result: {result.execution_result.get('result')}")
    if result.errors:
        print(f"Errors: {result.errors}")


if __name__ == "__main__":
    demo_llm_test()
