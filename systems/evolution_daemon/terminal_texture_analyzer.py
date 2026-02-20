"""
Terminal Texture Analyzer - Phase 20-25: Generative Evolution

Analyzes terminal textures (PixelRTS v3) as morphological patterns
for Area Agent perception and generative evolution.

Terminal Cell Encoding (RGBA):
- R: ASCII character (0-127)
- G: Foreground color (0-15)
- B: Background color (0-15)
- A: Style flags (bold=1, dim=2, italic=4, underline=8, blink=16, inverse=32)
"""

import numpy as np
from PIL import Image
from pathlib import Path
from typing import Dict, Any, Optional
from dataclasses import dataclass
import logging

logger = logging.getLogger(__name__)


@dataclass
class TextureAnalysis:
    """Results of terminal texture analysis."""
    non_empty_cells: int
    space_cells: int
    fg_color_counts: Dict[int, int]
    bg_color_counts: Dict[int, int]
    style_flag_counts: Dict[int, int]
    entropy: float
    density: float


class TerminalTextureAnalyzer:
    """
    Analyzes terminal textures for pattern recognition and evolution.

    Terminal cells are encoded as RGBA:
    - R: ASCII character (0-127)
    - G: Foreground color (0-15)
    - B: Background color (0-15)
    - A: Style flags
    """

    def __init__(self, cols: int = 80, rows: int = 24):
        """
        Initialize the analyzer.

        Args:
            cols: Number of columns in the terminal grid
            rows: Number of rows in the terminal grid
        """
        self.cols = cols
        self.rows = rows
        self.texture: Optional[np.ndarray] = None

    def load_texture(self, path: str) -> None:
        """
        Load a .rts.png texture file.

        Args:
            path: Path to the texture file
        """
        img = Image.open(path).convert('RGBA')
        self.texture = np.array(img, dtype=np.uint8)
        logger.info(f"Loaded texture: {self.texture.shape}")

    def load_from_buffer(self, buffer: np.ndarray) -> None:
        """
        Load texture from numpy buffer.

        Args:
            buffer: RGBA texture array (H, W, 4)
        """
        self.texture = buffer

    def extract_cell_distribution(self) -> Dict[str, Any]:
        """
        Extract statistical distribution of cell values.

        Returns:
            Dictionary with:
            - non_empty_cells: Count of non-space, non-zero cells
            - space_cells: Count of space character cells
            - fg_color_counts: Dict mapping foreground colors to counts
            - bg_color_counts: Dict mapping background colors to counts
            - style_flag_counts: Dict mapping style flags to counts
        """
        if self.texture is None:
            return {
                'non_empty_cells': 0,
                'space_cells': 0,
                'fg_color_counts': {},
                'bg_color_counts': {},
                'style_flag_counts': {},
            }

        # Flatten to cell list
        cells = self.texture.reshape(-1, 4)

        non_empty = 0
        space_cells = 0
        fg_counts: Dict[int, int] = {}
        bg_counts: Dict[int, int] = {}
        flag_counts: Dict[int, int] = {}

        for char, fg, bg, flags in cells:
            if char > 0 and char != 32:
                # Non-empty cell
                non_empty += 1
                fg_counts[fg] = fg_counts.get(fg, 0) + 1
                bg_counts[bg] = bg_counts.get(bg, 0) + 1
                flag_counts[flags] = flag_counts.get(flags, 0) + 1
            elif char == 32:
                # Space cell
                space_cells += 1

        return {
            'non_empty_cells': non_empty,
            'space_cells': space_cells,
            'fg_color_counts': fg_counts,
            'bg_color_counts': bg_counts,
            'style_flag_counts': flag_counts,
        }

    def calculate_entropy(self) -> float:
        """
        Calculate Shannon entropy of the texture's character channel.

        Higher entropy indicates more diverse character usage.
        Lower entropy indicates repetitive content.

        Returns:
            Entropy in bits (0 for uniform/empty, higher for diverse)
        """
        if self.texture is None:
            return 0.0

        # Use character channel for entropy
        chars = self.texture[:, :, 0].flatten()
        chars = chars[chars > 0]  # Ignore empty cells

        if len(chars) == 0:
            return 0.0

        values, counts = np.unique(chars, return_counts=True)
        probabilities = counts / len(chars)
        entropy = -np.sum(probabilities * np.log2(probabilities + 1e-10))

        return float(entropy)

    def calculate_density(self) -> float:
        """
        Calculate cell density (non-empty cells / total cells).

        Returns:
            Density ratio between 0.0 (empty) and 1.0 (full)
        """
        if self.texture is None:
            return 0.0

        total = self.texture.shape[0] * self.texture.shape[1]
        non_empty = np.sum(self.texture[:, :, 0] > 0)

        return float(non_empty / total)

    def analyze(self) -> TextureAnalysis:
        """
        Perform full texture analysis.

        Returns:
            TextureAnalysis dataclass with all metrics
        """
        dist = self.extract_cell_distribution()

        return TextureAnalysis(
            non_empty_cells=dist.get('non_empty_cells', 0),
            space_cells=dist.get('space_cells', 0),
            fg_color_counts=dist.get('fg_color_counts', {}),
            bg_color_counts=dist.get('bg_color_counts', {}),
            style_flag_counts=dist.get('style_flag_counts', {}),
            entropy=self.calculate_entropy(),
            density=self.calculate_density(),
        )
