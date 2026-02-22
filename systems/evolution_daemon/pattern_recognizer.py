"""
Pattern Recognizer - Phase 20-25: Generative Evolution

Detects semantic patterns in terminal textures for Area Agent perception.
"""

import numpy as np
from enum import Enum, auto
from dataclasses import dataclass
from typing import List, Tuple, Optional

class PatternType(Enum):
    """Types of detectable patterns."""
    SHELL_PROMPT = auto()
    CODE_BLOCK = auto()
    EMPTY_REGION = auto()
    ERROR_MESSAGE = auto()
    COMMAND_OUTPUT = auto()
    HORIZONTAL_LINE = auto()
    PROGRESS_BAR = auto()

@dataclass
class DetectedPattern:
    """A detected pattern in the texture."""
    type: PatternType
    bbox: Tuple[int, int, int, int]  # x1, y1, x2, y2
    confidence: float
    metadata: dict

class PatternRecognizer:
    """
    Recognizes semantic patterns in terminal textures.

    Uses morphological analysis to identify:
    - Shell prompts ($, #, user@host)
    - Code blocks (indented regions)
    - Error messages (red text patterns)
    - Progress indicators
    """

    def __init__(self):
        # Define pattern signatures
        self.prompt_chars = {ord('$'), ord('#'), ord('>'), ord('%')}
        self.error_colors = {1, 9}  # Red colors
        self.patterns = [
            PatternType.SHELL_PROMPT,
            PatternType.CODE_BLOCK,
            PatternType.EMPTY_REGION,
            PatternType.ERROR_MESSAGE,
            PatternType.COMMAND_OUTPUT,
            PatternType.HORIZONTAL_LINE,
            PatternType.PROGRESS_BAR,
        ]

    def detect_patterns(self, texture: np.ndarray) -> List[DetectedPattern]:
        """
        Detect all patterns in texture.

        Args:
            texture: RGBA texture array (H, W, 4)

        Returns:
            List of detected patterns
        """
        patterns = []

        # Check for shell prompts
        patterns.extend(self._detect_shell_prompts(texture))

        # Check for code blocks
        patterns.extend(self._detect_code_blocks(texture))

        # Check for empty regions
        patterns.extend(self._detect_empty_regions(texture))

        return patterns

    def _detect_shell_prompts(self, texture: np.ndarray) -> List[DetectedPattern]:
        """Detect shell prompt characters."""
        patterns = []
        chars = texture[:, :, 0]

        for y in range(chars.shape[0]):
            for x in range(min(5, chars.shape[1])):  # Check first 5 columns
                if chars[y, x] in self.prompt_chars:
                    patterns.append(DetectedPattern(
                        type=PatternType.SHELL_PROMPT,
                        bbox=(x, y, x + 1, y + 1),
                        confidence=0.8,
                        metadata={'char': chr(chars[y, x])}
                    ))

        return patterns

    def _detect_code_blocks(self, texture: np.ndarray) -> List[DetectedPattern]:
        """Detect code block regions (consecutive non-empty cells)."""
        patterns = []
        chars = texture[:, :, 0]

        for y in range(chars.shape[0]):
            # Find runs of non-empty cells
            run_start = None
            for x in range(chars.shape[1]):
                if chars[y, x] > 32:  # Non-empty
                    if run_start is None:
                        run_start = x
                else:
                    if run_start is not None and x - run_start >= 4:
                        patterns.append(DetectedPattern(
                            type=PatternType.CODE_BLOCK,
                            bbox=(run_start, y, x, y + 1),
                            confidence=0.7,
                            metadata={'length': x - run_start}
                        ))
                    run_start = None

        return patterns

    def _detect_empty_regions(self, texture: np.ndarray) -> List[DetectedPattern]:
        """Detect empty/sparse regions."""
        patterns = []
        chars = texture[:, :, 0]

        # Calculate density
        density = np.sum(chars > 0) / chars.size

        if density < 0.1:
            patterns.append(DetectedPattern(
                type=PatternType.EMPTY_REGION,
                bbox=(0, 0, chars.shape[1], chars.shape[0]),
                confidence=0.9,
                metadata={'density': float(density)}
            ))

        return patterns
