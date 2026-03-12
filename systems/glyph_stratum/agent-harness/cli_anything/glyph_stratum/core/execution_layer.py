"""
GlyphStratum Execution Layer

Maps GlyphStratum glyphs to executable Python code.
This is the bridge between design/specification and execution.
"""
from typing import Any, Dict, List, Optional
from pathlib import Path
import json

from .stratum import GlyphInfo, Stratum, Opcode
from .glyph_registry import GlyphRegistry


class ExecutionEngine:
    """Executes GlyphStratum programs by mapping glyphs to Python code."""

    def __init__(self, registry: GlyphRegistry):
        self.registry = registry
        self.memory: Dict[int, Any] = {}  # address -> value
        self.call_stack: List[Dict] = []
        self.output: List[Any] = []

    def execute(self) -> Dict:
        """Execute the program and return results."""
        # Start from INTENT stratum (bottom-up)
        intent_glyphs = self.registry.by_stratum(Stratum.INTENT)

        if not intent_glyphs:
            return {"success": False, "error": "No INTENT glyphs found"}

        # Execute each intent in order
        for idx, glyph in intent_glyphs:
            result = self._execute_glyph(glyph)
            self.output.append(result)

        return {
            "success": True,
            "output": self.output,
            "memory": self.memory,
        }

    def _execute_glyph(self, glyph: GlyphInfo) -> Any:
        """Execute a single glyph."""
        opcode = glyph.opcode

        if opcode == Opcode.MODULE:
            return self._execute_module(glyph)
        elif opcode == Opcode.CALL:
            return self._execute_call(glyph)
        elif opcode == Opcode.ALLOC:
            return self._execute_alloc(glyph)
        elif opcode == Opcode.STORE:
            return self._execute_store(glyph)
        elif opcode == Opcode.LOAD:
            return self._execute_load(glyph)
        elif opcode == Opcode.LOOP:
            return self._execute_loop(glyph)
        elif opcode == Opcode.BRANCH:
            return self._execute_branch(glyph)
        elif opcode == Opcode.DATA:
            return self._execute_data(glyph)
        elif opcode == Opcode.TYPE:
            return self._execute_type(glyph)
        elif opcode == Opcode.RETURN:
            return self._execute_return(glyph)
        elif opcode == Opcode.HALT:
            self.halted = True
            return {"halted": True}
        else:
            return {"opcode": opcode.name, "executed": False}

    def _execute_module(self, glyph: GlyphInfo) -> Any:
        """Execute a MODULE opcode."""
        # Get all glyphs that depend on this module
        dependents = [
            self.registry.get(dep_idx)
            for dep_idx in glyph.metadata.dependencies
            if self.registry.get(dep_idx)
        ]

        results = []
        for dep_idx in dependents:
            dep = self.registry.get(dep_idx)
            if dep:
                result = self._execute_glyph(dep)
                results.append(result)

        return {
            "opcode": "MODULE",
            "module": glyph.metadata.rationale,
            "results": results,
        }

    def _execute_call(self, glyph: GlyphInfo) -> any:
        """Execute a CALL opcode."""
        # Get function name from rationale
        func_name = glyph.metadata.rationale

        # Look up the function glyph
        for idx, g in self.registry.glyphs.items():
            if g.opcode == Opcode.TYPE and func_name in g.metadata.rationale:
                # Execute the function
                return self._execute_glyph(g)

        return {"error": f"Function {func_name} not found"}

    def _execute_alloc(self, glyph: GlyphInfo) -> any:
        """Execute an ALLOC opcode."""
        # Get size from invariants
        size = glyph.metadata.invariants.get("size", 1024)
        addr = len(self.memory)
        self.memory[addr] = None  # None = uninitialized memory
        return {"opcode": "ALLOC", "address": addr, "size": size}

    def _execute_store(self, glyph: GlyphInfo) -> any:
        """Execute a STORE opcode."""
        # Get address and value from dependencies
        if len(glyph.metadata.dependencies) >= 2:
            addr = glyph.metadata.dependencies[0]
            value_addr = glyph.metadata.dependencies[1]
            value = self.memory.get(value_addr)
            if addr in self.memory:
                self.memory[addr] = value
                return {"opcode": "STORE", "address": addr, "success": True}
        return {"error": "Invalid store parameters"}

    def _execute_load(self, glyph: GlyphInfo) -> any:
        """Execute a LOAD opcode."""
        if glyph.metadata.dependencies:
            addr = glyph.metadata.dependencies[0]
            value = self.memory.get(addr)
            return {"opcode": "LOAD", "address": addr, "value": value}
        return {"error": "No address specified"}

    def _execute_loop(self, glyph: GlyphInfo) -> any:
        """Execute a LOOP opcode."""
        # Get condition and body, and initial state from dependencies
        if len(glyph.metadata.dependencies) >= 3:
            cond_glyph = self.registry.get(glyph.metadata.dependencies[0])
            body_glyph = self.registry.get(glyph.metadata.dependencies[1])
            init_glyph = self.registry.get(glyph.metadata.dependencies[2])

            if not all([cond_glyph, body_glyph, init_glyph]):
                return {"error": "Invalid loop parameters"}

            # Execute loop
            state = self._execute_glyph(init_glyph)
            iterations = 0
            max_iterations = 10000

            while iterations < max_iterations:
                # Check condition
                cond_result = self._execute_glyph(cond_glyph)
                if not cond_result.get("value", True):
                    break

                # Execute body
                state = self._execute_glyph(body_glyph)
                iterations += 1

            return {"opcode": "LOOP", "iterations": iterations, "result": state}

        return {"error": "Invalid loop parameters"}

    def _execute_branch(self, glyph: GlyphInfo) -> any:
        """Execute a BRANCH opcode."""
        if len(glyph.metadata.dependencies) >= 2:
            cond_glyph = self.registry.get(glyph.metadata.dependencies[0])
            then_glyph = self.registry.get(glyph.metadata.dependencies[1])
            else_glyph = (
                self.registry.get(glyph.metadata.dependencies[2])
                if len(glyph.metadata.dependencies) >= 3
                else None
            )

            if not cond_glyph or not then_glyph:
                return {"error": "Invalid branch parameters"}

            # Execute condition
            cond_result = self._execute_glyph(cond_glyph)

            if cond_result.get("value", True):
                return self._execute_glyph(then_glyph)
            elif else_glyph:
                return self._execute_glyph(else_glyph)

            return {"opcode": "BRANCH", "taken": cond_result.get("value", True)}

        return {"error": "Invalid branch parameters"}

    def _execute_data(self, glyph: GlyphInfo) -> any:
        """Execute a DATA opcode."""
        # Get value from invariants
        value = glyph.metadata.invariants.get("value")
        if value is not None:
            return {"opcode": "DATA", "value": value}
        return {"error": "No value specified"}

    def _execute_type(self, glyph: GlyphInfo) -> any:
        """Execute a TYPE opcode."""
        # Types are declarations, just register them
        return {
            "opcode": "TYPE",
            "name": glyph.metadata.rationale,
            "fields": glyph.metadata.invariants.get("fields", {}),
        }

    def _execute_return(self, glyph: GlyphInfo) -> any:
        """Execute a RETURN opcode."""
        if glyph.metadata.dependencies:
            addr = glyph.metadata.dependencies[0]
            value = self.memory.get(addr)
            return {"opcode": "RETURN", "value": value}
        return {"opcode": "RETURN", "value": None}

    def status(self) -> Dict:
        """Get execution status."""
        return {
            "memory_allocated": len(self.memory),
            "call_stack_depth": len(self.call_stack),
            "output_count": len(self.output),
            "halted": getattr(self, 'halted', False),
        }


def run_glyph_program(program_path: str) -> Dict:
    """Load and execute a GlyphStratum program."""
    registry = GlyphRegistry()

    # Load program
    with open(program_path, 'r') as f:
        data = json.load(f)
        for glyph_data in data.get("glyphs", {}).values():
            glyph = GlyphInfo.from_dict(glyph_data)
            registry.glyphs[glyph.index] = glyph

    # Execute
    engine = ExecutionEngine(registry)
    return engine.execute()
