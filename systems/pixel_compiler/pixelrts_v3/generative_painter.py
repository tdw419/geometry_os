"""
Generative Code Painter - Phase 20-25

Enables AI to "paint" logic directly into the geometric substrate,
bypassing the linguistic bottleneck of human-readable text.

RGBA Encoding:
- R: Opcode (0x00-0xFF)
- G: RS1 / Immediate
- B: RS2
- A: RD
"""

import numpy as np
from PIL import Image
from dataclasses import dataclass
from typing import List, Optional, Tuple
import logging

# Import Hilbert curve from geometric_terminal
from geometric_terminal import HilbertCurve

logger = logging.getLogger(__name__)


@dataclass
class PaintOp:
    """A single paint operation (geometric instruction)."""
    opcode: int
    rs1: int
    rs2: int
    rd: int


class GenerativePainter:
    """
    Paints geometric code directly onto the substrate.

    RGBA Encoding:
    - R: Opcode (0x00-0xFF)
    - G: RS1 / Immediate
    - B: RS2
    - A: RD
    """

    def __init__(self, cols: int, rows: int, use_hilbert: bool = True):
        """
        Initialize the painter.

        Args:
            cols: Number of columns
            rows: Number of rows
            use_hilbert: Whether to use Hilbert curve mapping
        """
        self.cols = cols
        self.rows = rows
        self.use_hilbert = use_hilbert

        # Calculate grid size (power of 2 >= total cells)
        total_cells = cols * rows
        self.grid_size = 1
        while self.grid_size * self.grid_size < total_cells:
            self.grid_size *= 2

        # Initialize canvas
        self.canvas = np.zeros((self.grid_size, self.grid_size, 4), dtype=np.uint8)

        # Initialize Hilbert curve
        self.hilbert = HilbertCurve(self.grid_size) if use_hilbert else None

        logger.info(f"Initialized GenerativePainter: {cols}x{rows}, grid_size={self.grid_size}")

    def paint_opcode(
        self,
        opcode: int,
        rs1: int,
        rs2: int,
        rd: int,
        hilbert_index: int
    ) -> None:
        """
        Paint a single opcode at Hilbert index.

        Args:
            opcode: Operation code
            rs1: Source register 1
            rs2: Source register 2
            rd: Destination register
            hilbert_index: Position in Hilbert space
        """
        if self.use_hilbert:
            x, y = self.hilbert.d2xy(hilbert_index)
        else:
            x = hilbert_index % self.grid_size
            y = hilbert_index // self.grid_size

        if 0 <= x < self.grid_size and 0 <= y < self.grid_size:
            self.canvas[y, x] = [opcode & 0xFF, rs1 & 0xFF, rs2 & 0xFF, rd & 0xFF]

    def paint_sequence(self, ops: List[PaintOp]) -> None:
        """
        Paint a sequence of operations.

        Args:
            ops: List of PaintOp objects
        """
        for i, op in enumerate(ops):
            self.paint_opcode(op.opcode, op.rs1, op.rs2, op.rd, i)

    def get_cell(self, x: int, y: int) -> np.ndarray:
        """
        Get cell at (x, y) coordinates.

        Args:
            x: X coordinate
            y: Y coordinate

        Returns:
            RGBA array for the cell
        """
        if 0 <= x < self.grid_size and 0 <= y < self.grid_size:
            return self.canvas[y, x]
        return np.zeros(4, dtype=np.uint8)

    def get_cell_at_hilbert(self, d: int) -> np.ndarray:
        """
        Get cell at Hilbert index.

        Args:
            d: Hilbert index

        Returns:
            RGBA array for the cell
        """
        if self.use_hilbert:
            x, y = self.hilbert.d2xy(d)
            return self.get_cell(x, y)
        return self.get_cell(d % self.grid_size, d // self.grid_size)

    def export(self, path: str) -> None:
        """
        Export canvas to .rts.png.

        Args:
            path: Output file path
        """
        img = Image.fromarray(self.canvas, mode='RGBA')
        img.save(path)
        logger.info(f"Exported canvas to {path}")

    def apply_morphology(self, operation: str, **kwargs) -> None:
        """
        Apply morphological operation to canvas.

        Args:
            operation: Operation name ('erode', 'dilate', 'blur', 'sharpen')
            **kwargs: Additional arguments for the operation
        """
        # Import from evolution_daemon
        from evolution_daemon.morphological_ops import (
            erode_texture, dilate_texture, blur_texture, sharpen_texture
        )

        if operation == 'erode':
            self.canvas = erode_texture(self.canvas, **kwargs)
        elif operation == 'dilate':
            self.canvas = dilate_texture(self.canvas, **kwargs)
        elif operation == 'blur':
            self.canvas = blur_texture(self.canvas, **kwargs)
        elif operation == 'sharpen':
            self.canvas = sharpen_texture(self.canvas, **kwargs)
        else:
            logger.warning(f"Unknown morphological operation: {operation}")
