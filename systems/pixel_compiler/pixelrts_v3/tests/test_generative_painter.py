"""
Tests for GenerativePainter - Phase 20-25: Generative Evolution
"""

import pytest
import numpy as np
from pathlib import Path
import sys

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from generative_painter import GenerativePainter, PaintOp


class TestGenerativePainter:
    def test_painter_initialization(self):
        """Painter should initialize with canvas."""
        painter = GenerativePainter(cols=8, rows=8)
        # grid_size is smallest power of 2 >= sqrt(cols * rows)
        # 8*8 = 64 cells, sqrt(64) = 8, so grid_size = 8
        assert painter.canvas.shape == (8, 8, 4)
        assert painter.cols == 8
        assert painter.rows == 8

    def test_paint_opcode(self):
        """Painter should paint single opcode."""
        painter = GenerativePainter(cols=4, rows=4)

        # Paint ADD instruction at (0, 0)
        painter.paint_opcode(
            opcode=0x33,  # ADD
            rs1=10, rs2=11, rd=12,
            hilbert_index=0
        )

        cell = painter.get_cell(0, 0)
        assert cell[0] == 0x33  # Opcode in R
        assert cell[1] == 10    # RS1 in G
        assert cell[2] == 11    # RS2 in B
        assert cell[3] == 12    # RD in A

    def test_paint_function(self):
        """Painter should paint a simple function."""
        painter = GenerativePainter(cols=4, rows=4)

        # Paint: def add(a, b): return a + b
        ops = [
            PaintOp(opcode=0x08, rs1=1, rs2=0, rd=0),  # LDI r0, 1
            PaintOp(opcode=0x08, rs1=2, rs2=0, rd=1),  # LDI r1, 2
            PaintOp(opcode=0x33, rs1=0, rs2=1, rd=2), # ADD r2, r0, r1
            PaintOp(opcode=0x07, rs1=0, rs2=0, rd=0),  # HALT
        ]

        painter.paint_sequence(ops)

        # Verify sequence painted correctly
        assert painter.get_cell_at_hilbert(0)[0] == 0x08
        assert painter.get_cell_at_hilbert(3)[0] == 0x07

    def test_export_texture(self, tmp_path):
        """Painter should export to .rts.png."""
        painter = GenerativePainter(cols=4, rows=4)
        painter.paint_opcode(0x33, 1, 2, 3, hilbert_index=0)

        output_path = tmp_path / "generated.rts.png"
        painter.export(str(output_path))

        assert output_path.exists()

    def test_hilbert_mapping(self):
        """Test that Hilbert mapping works correctly."""
        painter = GenerativePainter(cols=4, rows=4, use_hilbert=True)

        # Paint at Hilbert index 5
        painter.paint_opcode(0x42, 1, 2, 3, hilbert_index=5)

        # Verify the cell is somewhere on the canvas
        found = False
        for y in range(painter.grid_size):
            for x in range(painter.grid_size):
                cell = painter.get_cell(x, y)
                if cell[0] == 0x42:
                    found = True
                    break
            if found:
                break

        assert found, "Painted opcode should be found on canvas"
