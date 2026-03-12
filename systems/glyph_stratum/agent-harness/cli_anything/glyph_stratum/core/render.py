"""Visual rendering for GlyphStratum programs."""
from typing import Optional, List, Dict
from pathlib import Path
import json

from .stratum import GlyphInfo, Stratum, Opcode
from .glyph_registry import GlyphRegistry


# Glyph visual representations (ASCII art for terminal, Unicode for visual)
GLYPH_CHARS = {
    Opcode.NOP: "·",
    Opcode.ALLOC: "◼",
    Opcode.FREE: "◻",
    Opcode.LOAD: "◀",
    Opcode.STORE: "▶",
    Opcode.LOOP: "↻",
    Opcode.BRANCH: "◇",
    Opcode.CALL: "○",
    Opcode.RETURN: "●",
    Opcode.DATA: "░",
    Opcode.TYPE: "▓",
    Opcode.PTR: "→",
    Opcode.STRUCT: "█",
    Opcode.MODULE: "▣",
    Opcode.EXPORT: "↑",
    Opcode.IMPORT: "↓",
    Opcode.HALT: "✕",
}

STRATUM_COLORS = {
    Stratum.SUBSTRATE: "\033[90m",  # Dark gray
    Stratum.MEMORY: "\033[94m",     # Blue
    Stratum.LOGIC: "\033[92m",      # Green
    Stratum.SPEC: "\033[93m",       # Yellow
    Stratum.INTENT: "\033[95m",     # Magenta
}
RESET = "\033[0m"


class ProgramRenderer:
    """Renders GlyphStratum programs visually."""

    def __init__(self, registry: GlyphRegistry, width: int = 80):
        self.registry = registry
        self.width = width

    def render_ascii(self) -> str:
        """Render program as ASCII art grid."""
        if not self.registry.glyphs:
            return "(empty program)"

        # Find grid bounds
        max_x = max(g.x for g in self.registry.glyphs.values()) + 1
        max_y = max(g.y for g in self.registry.glyphs.values()) + 1

        # Create grid
        grid = [[" " for _ in range(max_x)] for _ in range(max_y)]

        # Place glyphs
        for glyph in self.registry.glyphs.values():
            char = GLYPH_CHARS.get(glyph.opcode, "?")
            if 0 <= glyph.y < max_y and 0 <= glyph.x < max_x:
                grid[glyph.y][glyph.x] = char

        # Render with line numbers
        lines = []
        for y, row in enumerate(grid):
            line = "".join(row)
            lines.append(f"{y:3d} │ {line}")

        header = "    ┌" + "─" * max_x
        footer = "    └" + "─" * max_x

        return "\n".join([header] + lines + [footer])

    def render_colored(self) -> str:
        """Render program with colored glyphs by stratum."""
        if not self.registry.glyphs:
            return "(empty program)"

        # Find grid bounds
        max_x = max(g.x for g in self.registry.glyphs.values()) + 1
        max_y = max(g.y for g in self.registry.glyphs.values()) + 1

        # Create grid
        grid = [[" " for _ in range(max_x)] for _ in range(max_y)]

        # Place glyphs with colors
        for glyph in self.registry.glyphs.values():
            char = GLYPH_CHARS.get(glyph.opcode, "?")
            color = STRATUM_COLORS.get(glyph.stratum, "")
            if 0 <= glyph.y < max_y and 0 <= glyph.x < max_x:
                grid[glyph.y][glyph.x] = f"{color}{char}{RESET}"

        # Render
        lines = []
        for y, row in enumerate(grid):
            line = "".join(row)
            lines.append(f"{y:3d} │ {line}")

        header = "    ┌" + "─" * max_x
        footer = "    └" + "─" * max_x

        # Legend
        legend = self._render_legend()

        return "\n".join([header] + lines + [footer, "", legend])

    def _render_legend(self) -> str:
        """Render legend for opcodes and strata."""
        opcode_lines = ["Opcodes:"]
        for opcode in [Opcode.ALLOC, Opcode.FREE, Opcode.LOAD, Opcode.STORE,
                       Opcode.LOOP, Opcode.BRANCH, Opcode.CALL, Opcode.RETURN,
                       Opcode.DATA, Opcode.TYPE, Opcode.MODULE]:
            char = GLYPH_CHARS.get(opcode, "?")
            opcode_lines.append(f"  {char} = {opcode.name}")

        stratum_lines = ["Strata:"]
        for stratum in Stratum:
            color = STRATUM_COLORS.get(stratum, "")
            stratum_lines.append(f"  {color}■{RESET} = {stratum.name} ({stratum.value})")

        return "\n".join(opcode_lines + [""] + stratum_lines)

    def render_dependency_graph(self) -> str:
        """Render dependency graph as ASCII."""
        if not self.registry.glyphs:
            return "(no dependencies)"

        lines = ["Dependency Graph:"]
        for idx, glyph in sorted(self.registry.glyphs.items()):
            deps = glyph.metadata.dependencies
            if deps:
                dep_str = ", ".join(str(d) for d in deps)
                lines.append(f"  [{idx}] → depends on: {dep_str}")

        # Reverse: what depends on each
        lines.append("")
        lines.append("Dependents (what depends on each):")
        for idx in sorted(self.registry.glyphs.keys()):
            dependents = self.registry.dependents(idx)
            if dependents:
                dep_str = ", ".join(str(d) for d in dependents)
                lines.append(f"  [{idx}] ← used by: {dep_str}")

        return "\n".join(lines)

    def render_strata_view(self) -> str:
        """Render program organized by stratum."""
        lines = ["Program by Stratum:", ""]

        for stratum in reversed(list(Stratum)):  # Top to bottom
            glyphs = self.registry.by_stratum(stratum)
            if glyphs:
                lines.append(f"Layer {stratum.value} - {stratum.name}:")
                for idx, glyph in glyphs:
                    opcode_char = GLYPH_CHARS.get(glyph.opcode, "?")
                    rationale = glyph.metadata.rationale[:40] if glyph.metadata.rationale else ""
                    lines.append(f"  [{idx}] {opcode_char} {glyph.opcode.name:<8} {rationale}")
                lines.append("")

        return "\n".join(lines)

    def render_json(self) -> str:
        """Render program as JSON."""
        return self.registry.to_json()

    def render_summary(self) -> str:
        """Render program summary."""
        lines = [
            f"GlyphStratum Program Summary",
            f"{'=' * 40}",
            f"Total glyphs: {self.registry.count()}",
            "",
            "By Stratum:",
        ]

        for stratum, count in self.registry.strata_summary().items():
            if count > 0:
                lines.append(f"  {stratum}: {count}")

        lines.append("")
        lines.append("By Opcode:")
        for opcode, count in sorted(self.registry.opcodes_summary().items()):
            lines.append(f"  {opcode}: {count}")

        return "\n".join(lines)
