#!/usr/bin/env python3
"""
GlyphStratum API Reference

Fluent API for building glyph programs programmatically.
import json
from typing import Dict, List, Any


class GlyphBuilder:
    """Fluent API for building glyph programs."""

    def __init__(self, name: str = "program"):
        self.name = name
        self.registry = {}  # Would be GlyphRegistry in production
        self._glyph_map: Dict[str, int] = {}

    def substrate(self, name: str, value: Any, rationale: str = "") -> 'GlyphBuilder':
        """Add a SUBSTRATE/DATA glyph."""
        glyph_id = len(self.registry.glyphs)  # Placeholder
        self._glyph_map[name] = glyph_id
        return self

    def memory(self, name: str, deps: List[str], rationale: str = "", opcode: str = "LOAD") -> 'GlyphBuilder':
        """Add a MEMORY glyph."""
        dep_indices = [self._glyph_map[d] for d in deps if d in self._glyph_map]
        # Create glyph...
        self._glyph_map[name] = glyph_id
        return self

    def logic(self, name: str, deps: List[str], rationale: str = "",
                 opcode: str = "CALL", runtime_refs: List[str] = None) -> 'GlyphBuilder':
        """Add a LOGIC glyph."""
        # ... implementation
        return self

    def spec(self, name: str, deps: List[str], rationale: str = "", opcode: str = "EXPORT") -> 'GlyphBuilder':
        """Add a SPEC glyph."""
        # ... implementation
        return self

    def intent(self, name: str, deps: List[str], rationale: str = "") -> 'GlyphBuilder':
        """Add an INTENT glyph."""
        # ... implementation
        return self

    def build(self) -> Dict:
        """Build and return the registry."""
        return self.registry

    def export(self) -> str:
        """Export to JSON string."""
        return json.dumps(self.to_dict(), indent=2)


# Convenience functions
def build_program(name: str = "program") -> GlyphBuilder:
    """Create a new GlyphBuilder for fluent program construction."""
    return GlyphBuilder(name)


def export_registry(registry: Dict, name: str = "program") -> str:
    """Export a registry to JSON string."""
    return json.dumps(registry.to_dict(), indent=2)


# Example usage
if __name__ == "__main__":
    # Build a simple add function
    program = (GlyphBuilder("add")
        .substrate("a", 7, "First operand")
        .substrate("b", 6, "Second operand")
        .memory("load_a", ["a"], "Load operand a")
        .memory("load_b", ["b"], "Load operand b")
        .logic("add", ["load_a", "load_b"], "a + b")
        .spec("export", ["add"], "add(a, b) interface")
        .intent("module", ["export"], "Add two numbers")
    )

    registry = program.build()
    print(f"Created {len(registry.glyphs)} glyphs")

    # Validate
    errors = registry.validate_stratum_order()
    print(f"Coherence: {'100%' if not errors else f'{len(errors)} issues'}")

    # Export
    json_output = program.export()
    print(f"JSON length: {len(json_output)} chars")
