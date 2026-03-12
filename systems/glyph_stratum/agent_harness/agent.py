#!/usr/bin/env python3
"""GlyphStratum AI Agent Harness.

An AI agent that uses GlyphStratum to write programs.
Tests the hypothesis: does structured visual programming help AI stay coherent?
"""
from typing import Optional, List, Dict, Any, Callable
from dataclasses import dataclass, field
import json

# Import core components from cli_anything (sibling directory)
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "cli_anything"))

from glyph_stratum.core.stratum import Stratum, Opcode, GlyphInfo, GlyphMetadata, ProvenanceInfo
from glyph_stratum.core.glyph_registry import GlyphRegistry
from glyph_stratum.core.executor import GlyphStratumExecutor, run_program


@dataclass
class AgentState:
    """State of the AI agent during program construction."""
    current_goal: str = ""
    phase: str = "idle"  # idle, planning, building, testing, done
    glyphs_built: int = 0
    last_action: str = ""
    errors: List[str] = field(default_factory=list)
    reasoning_trace: List[str] = field(default_factory=list)


class GlyphStratumAgent:
    """
    An AI agent that constructs GlyphStratum programs.

    The agent follows a structured approach:
    1. Set high-level INTENT (goal)
    2. Decompose into SPEC (interfaces)
    3. Implement LOGIC (control flow)
    4. Allocate MEMORY (data)
    5. Ground in SUBSTRATE (primitives)

    This bottom-up approach prevents the "AI gets lost" problem
    by forcing explicit dependencies and layered reasoning.
    """

    def __init__(self):
        self.registry = GlyphRegistry()
        self.state = AgentState()
        self.executor = None

        # Callbacks for external integration (LLM, UI, etc.)
        self.on_glyph_created: Optional[Callable[[GlyphInfo], None]] = None
        self.on_phase_change: Optional[Callable[[str, str], None]] = None
        self.on_reasoning: Optional[Callable[[str], None]] = None

        self._log(f"Agent initialized with empty registry")

    def _log(self, message: str):
        """Log reasoning trace."""
        self.state.reasoning_trace.append(message)
        if self.on_reasoning:
            self.on_reasoning(message)

    def _change_phase(self, new_phase: str):
        """Change agent phase."""
        old_phase = self.state.phase
        self.state.phase = new_phase
        if self.on_phase_change:
            self.on_phase_change(old_phase, new_phase)
        self._log(f"Phase: {old_phase} -> {new_phase}")

    def set_goal(self, goal: str):
        """Set the high-level goal for the program."""
        self.state.current_goal = goal
        self._change_phase("planning")
        self._log(f"Goal set: {goal}")

    def add_intent_glyph(self, name: str, dependencies: List[int], rationale: str = "") -> int:
        """Add a glyph at the INTENT stratum."""
        glyph = self.registry.create(
            stratum=Stratum.INTENT,
            opcode=Opcode.MODULE,
            metadata=GlyphMetadata(
                dependencies=dependencies,
                invariants={"name": name},
                rationale=rationale,
            )
        )
        self.state.glyphs_built += 1
        if self.on_glyph_created:
            self.on_glyph_created(glyph)
        self._log(f"[INTENT] Added glyph {glyph.index}: {name}")
        return glyph.index

    def add_spec_glyph(self, name: str, rationale: str, dependencies: List[int]) -> int:
        """Add a glyph in SPEC stratum."""
        glyph = self.registry.create(
            stratum=Stratum.SPEC,
            opcode=Opcode.CALL,
            metadata=GlyphMetadata(
                dependencies=dependencies,
                invariants={"name": name},
                rationale=rationale
            )
        )
        self.state.glyphs_built += 1
        if self.on_glyph_created:
            self.on_glyph_created(glyph)
        self._log(f"[SPEC] Added glyph {glyph.index}: {name}")
        return glyph.index

    def add_logic_glyph(self, opcode: Opcode, rationale: str, dependencies: List[int]) -> int:
        """Add a glyph in LOGIC stratum."""
        glyph = self.registry.create(
            stratum=Stratum.LOGIC,
            opcode=opcode,
            metadata=GlyphMetadata(
                dependencies=dependencies,
                invariants={},
                rationale=rationale
            )
        )
        self.state.glyphs_built += 1
        if self.on_glyph_created:
            self.on_glyph_created(glyph)
        self._log(f"[LOGIC] Added glyph {glyph.index}: {opcode.name}")
        return glyph.index

    def add_memory_glyph(self, value: Any, rationale: str, dependencies: List[int]) -> int:
        """Add a glyph in MEMORY stratum with a data value."""
        glyph = self.registry.create(
            stratum=Stratum.MEMORY,
            opcode=Opcode.DATA,
            metadata=GlyphMetadata(
                dependencies=dependencies,
                invariants={"value": value},
                rationale=rationale
            )
        )
        self.state.glyphs_built += 1
        if self.on_glyph_created:
            self.on_glyph_created(glyph)
        self._log(f"[MEMORY] Added glyph {glyph.index}: value={value}")
        return glyph.index

    def add_substrate_glyph(self, data_type: str, dependencies: List[int], value: Any = None, rationale: str = "") -> int:
        """Add a glyph in SUBSTRATE stratum."""
        glyph = self.registry.create(
            stratum=Stratum.SUBSTRATE,
            opcode=Opcode.DATA,
            metadata=GlyphMetadata(
                dependencies=dependencies,
                invariants={"type": data_type, "value": value},
                rationale=rationale
            )
        )
        self.state.glyphs_built += 1
        if self.on_glyph_created:
            self.on_glyph_created(glyph)
        self._log(f"[SUBSTRATE] Added glyph {glyph.index}: {data_type}={value}")
        return glyph.index

    def build_program(self) -> Dict:
        """Build and validate the complete program."""
        self._change_phase("building")

        # Validate dependency graph
        errors = self.registry.validate_dependencies()
        if errors:
            self.state.errors.extend(errors)
            self._log(f"Dependency errors: {errors}")
            return None

        program = {
            "name": f"agent_program_{self.state.glyphs_built}",
            "goal": self.state.current_goal,
            "registry": self.registry.to_dict(),
        }
        self._log(f"Built program with {len(self.registry.glyphs)} glyphs")
        self._change_phase("testing")
        return program

    def run(self, entry: int = None) -> Dict:
        """Execute the built program."""
        if not self.registry.glyphs:
            return {"error": "No glyphs to program", "status": {}}

        self.executor = GlyphStratumExecutor(self.registry)
        result = self.executor.run(entry)

        status = self.executor.status()
        self._change_phase("done")
        self._log(f"Execution result: {result}")
        return {"result": result, "status": status}

    def get_program_json(self) -> str:
        """Get program as JSON string."""
        return json.dumps(self.build_program(), indent=2)

    def save_program(self, path: str) -> None:
        """Save program to file."""
        program = self.build_program()
        if program:
            with open(path, 'w') as f:
                json.dump(program, f, indent=2)
            self._log(f"Saved program to {path}")

    def load_program(self, path: str) -> bool:
        """Load program from file."""
        try:
            with open(path, 'r') as f:
                data = json.load(f)

            self.registry = GlyphRegistry.from_dict(data.get("registry", {}))
            self.state.glyphs_built = len(self.registry.glyphs)
            self._log(f"Loaded {self.state.glyphs_built} glyphs from {path}")
            return True
        except Exception as e:
            self._log(f"Error loading program: {e}")
            return False

    def get_dependencies(self, glyph_index: int) -> List[int]:
        """Get glyphs that depend on the glyph."""
        return self.registry.get_dependents(glyph_index)

    def get_glyph_info(self, index: int) -> Optional[GlyphInfo]:
        """Get glyph info by index."""
        return self.registry.get(index)


# Demo / test function
def demo_agent():
    """Demonstrate the AI agent building a simple program."""
    agent = GlyphStratumAgent()

    # Set up callback to see reasoning
    def on_reason(msg):
        print(f"[Reasoning] {msg}")
    agent.on_reasoning = on_reason

    # Set goal
    agent.set_goal("Calculate the sum of two numbers")

    # Build a simple addition program
    # INTENT: Module
    module_idx = agent.add_intent_glyph(
        "addition_module",
        rationale="Module to add two numbers",
        dependencies=[]
    )
    # SPEC: Function signature
    spec_idx = agent.add_spec_glyph(
        "add",
        rationale="Function to add two numbers",
        dependencies=[module_idx]
    )
    # MEMORY: Input values
    a_idx = agent.add_memory_glyph(3, "First operand", dependencies=[])
    b_idx = agent.add_memory_glyph(4, "Second operand", dependencies=[])

    # LOGIC: Addition operation
    add_idx = agent.add_logic_glyph(
        Opcode.CALL,
        rationale="Add the two operands",
        dependencies=[spec_idx, a_idx, b_idx]
    )
    # Build and run
    program = agent.build_program()
    if program:
        print(f"\nBuilt program: {program['name']}")
        result = agent.run()
        print(f"Result: {result}")


if __name__ == "__main__":
    demo_agent()
