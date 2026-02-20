#!/usr/bin/env python3
"""
TruthTextureEncoder - RGBA Manifold Encoding for CTRM Results

This module provides the TruthTextureEncoder class for encoding CTRM
(Consilient Truth Reliability Method) analysis results as a 2D RGBA texture
suitable for visualization on the Geometry OS Infinite Map.

The encoder transforms verse-level triad evidence scores (E1, E2, E3) and
confidence metrics into pixel color values, creating a visual "truth manifold"
that can be rendered as a texture overlay on the spatial computing substrate.

Example:
    >>> from systems.intelligence.truth_texture import TruthTextureEncoder
    >>> encoder = TruthTextureEncoder(size=10)
    >>> img = encoder.encode(verse_results)
    >>> encoder.save(verse_results, "manifold.rts.png")

Author: Genesis Pilot Batch
Date: February 20, 2026
"""

from typing import List, Dict, Tuple, Any, Optional
from PIL import Image


class TruthTextureEncoder:
    """
    Encodes CTRM verse analysis results as an RGBA texture image.

    This class transforms the triad evidence scores (E1_archaeology, E2_manuscript,
    E3_prophecy) and confidence ratings from CTRM analysis into a 2D RGBA image.
    Each pixel represents one verse, with color channels mapped to evidence scores.

    RGBA Channel Mapping:
        - **R (Red)**: E1_archaeology score scaled to 0-255
            Represents archaeological and historical evidence supporting the verse.
            Higher values indicate stronger archaeological corroboration.

        - **G (Green)**: E2_manuscript score scaled to 0-255
            Represents manuscript reliability and textual transmission quality.
            Higher values indicate better manuscript evidence and fewer variants.

        - **B (Blue)**: E3_prophecy score scaled to 0-255
            Represents prophetic fulfillment or Messianic connection strength.
            Higher values indicate clearer prophetic links to verified events.

        - **A (Alpha)**: Confidence score scaled to 0-255
            Represents overall evaluation confidence in the triad assessment.
            Higher values indicate more reliable/complete scoring data.

    Texture Layout:
        The texture uses row-major ordering for verse positions:
            - Verse 0 at pixel (0, 0)
            - Verse 1 at pixel (1, 0)
            - Verse N at pixel (N % size, N // size)

        For a 10x10 texture (default), verses 0-99 map to positions (0,0) through (9,9).

    Attributes:
        size (int): Width and height of the square texture in pixels.
            Default is 10, suitable for encoding 100 verses.

    Example:
        >>> encoder = TruthTextureEncoder(size=10)
        >>> results = [{"triad_scores": {...}, "ctrm_evaluation": {...}}]
        >>> img = encoder.encode(results)  # Returns PIL Image
        >>> encoder.save(results, "output.rts.png")

    Raises:
        ValueError: If results list is empty when encoding.
    """

    def __init__(self, size: int = 10) -> None:
        """
        Initialize the encoder with a specified texture size.

        Args:
            size: Width and height of the square texture in pixels.
                Must be a positive integer. Default is 10, which creates
                a 10x10 texture capable of encoding up to 100 verses.

        Example:
            >>> encoder = TruthTextureEncoder(size=10)
            >>> encoder.size
            10
        """
        self.size: int = size

    def encode(self, results: List[Dict[str, Any]]) -> Image.Image:
        """
        Encode CTRM analysis results as an RGBA PIL Image.

        Transforms a list of verse analysis dictionaries into a 2D RGBA texture
        where each pixel's color encodes the triad evidence scores for one verse.

        Args:
            results: List of verse analysis dictionaries. Each dictionary must
                contain the following keys:
                - 'triad_scores' (dict): With keys 'E1_archaeology', 'E2_manuscript',
                  'E3_prophecy' (values should be floats in range [0.0, 1.0])
                - 'ctrm_evaluation' (dict): With key 'confidence' (float in [0.0, 1.0])

        Returns:
            PIL.Image.Image: An RGBA image with dimensions (size, size). Unfilled
                pixels (beyond the number of results) are left transparent (0,0,0,0).

        Raises:
            ValueError: If results list is empty.
            TypeError: If results is not a list.

        Example:
            >>> encoder = TruthTextureEncoder(size=10)
            >>> results = [
            ...     {
            ...         "triad_scores": {
            ...             "E1_archaeology": 0.15,
            ...             "E2_manuscript": 0.98,
            ...             "E3_prophecy": 0.85
            ...         },
            ...         "ctrm_evaluation": {"confidence": 0.75}
            ...     }
            ... ]
            >>> img = encoder.encode(results)
            >>> img.size
            (10, 10)
            >>> img.mode
            'RGBA'
        """
        if not isinstance(results, list):
            raise TypeError(f"results must be a list, got {type(results).__name__}")
        if len(results) == 0:
            raise ValueError("results list cannot be empty - no verses to encode")

        img: Image.Image = Image.new('RGBA', (self.size, self.size), (0, 0, 0, 0))
        pixels: Optional[Any] = img.load()

        for i, result in enumerate(results):
            if i >= self.size * self.size:
                break

            x: int = i % self.size
            y: int = i // self.size
            r, g, b, a = self._verse_to_pixel(result)
            if pixels is not None:
                pixels[x, y] = (r, g, b, a)

        return img

    def save(self, results: List[Dict[str, Any]], output_path: str) -> None:
        """
        Encode results and save as a PNG file.

        Convenience method that combines encode() and file saving in one step.
        The output file is saved in PNG format with RGBA color mode.

        Args:
            results: List of verse analysis dictionaries. See encode() for
                the expected structure of each dictionary.
            output_path: File system path where the PNG file will be saved.
                Conventionally uses '.rts.png' extension to indicate this is
                a real-time substrate texture for Geometry OS.

        Raises:
            ValueError: If results list is empty.
            IOError: If the file cannot be written to the specified path.

        Example:
            >>> encoder = TruthTextureEncoder(size=10)
            >>> encoder.save(results, "genesis_truth_manifold.rts.png")
            Truth manifold saved to genesis_truth_manifold.rts.png
        """
        img: Image.Image = self.encode(results)
        img.save(output_path, 'PNG')
        print(f"Truth manifold saved to {output_path}")

    def _verse_to_pixel(self, result: Dict[str, Any]) -> Tuple[int, int, int, int]:
        """
        Convert a single verse analysis result to an RGBA pixel tuple.

        Extracts triad scores and confidence from the result dictionary,
        clamps values to valid range [0.0, 1.0], and scales to 8-bit color
        values (0-255).

        Args:
            result: Dictionary containing verse analysis data with keys:
                - 'triad_scores': Dict with 'E1_archaeology', 'E2_manuscript',
                  'E3_prophecy' float values
                - 'ctrm_evaluation': Dict with 'confidence' float value

        Returns:
            Tuple[int, int, int, int]: RGBA tuple with each channel in range 0-255.
                - Index 0 (R): Archaeological evidence score
                - Index 1 (G): Manuscript reliability score
                - Index 2 (B): Prophetic fulfillment score
                - Index 3 (A): Overall confidence score

        Note:
            Missing or invalid scores default to 0.0 for triad values and
            0.5 for confidence, ensuring the pixel is always visible.
        """
        triad: Dict[str, float] = result.get('triad_scores', {})
        evaluation: Dict[str, float] = result.get('ctrm_evaluation', {})

        # Extract triad scores (E1, E2, E3) with defaults
        e1: float = float(triad.get('E1_archaeology', 0.0))
        e2: float = float(triad.get('E2_manuscript', 0.0))
        e3: float = float(triad.get('E3_prophecy', 0.0))

        # Get confidence score with default
        confidence: float = float(evaluation.get('confidence', 0.5))

        # Clamp values to [0.0, 1.0] range
        e1 = max(0.0, min(1.0, e1))
        e2 = max(0.0, min(1.0, e2))
        e3 = max(0.0, min(1.0, e3))
        confidence = max(0.0, min(1.0, confidence))

        # Scale to 0-255 integer range for 8-bit color channels
        r: int = int(e1 * 255)
        g: int = int(e2 * 255)
        b: int = int(e3 * 255)
        a: int = int(confidence * 255)

        return (r, g, b, a)


if __name__ == "__main__":
    # Test with sample data
    encoder = TruthTextureEncoder(size=10)

    sample_results = [
        {
            "reference": "Genesis 1:1",
            "triad_scores": {
                "E1_archaeology": 0.15,
                "E2_manuscript": 0.98,
                "E3_prophecy": 0.85
            },
            "ctrm_evaluation": {
                "confidence": 0.75
            }
        },
        {
            "reference": "Genesis 1:2",
            "triad_scores": {
                "E1_archaeology": 0.10,
                "E2_manuscript": 0.97,
                "E3_prophecy": 0.70
            },
            "ctrm_evaluation": {
                "confidence": 0.65
            }
        }
    ]

    img = encoder.encode(sample_results)
    print(f"Encoded {len(sample_results)} verses to {img.size} {img.mode} image")
    print(f"Sample pixel (0,0): {img.getpixel((0, 0))}")
    print(f"Sample pixel (1,0): {img.getpixel((1, 0))}")
