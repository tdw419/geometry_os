#!/usr/bin/env python3
"""
TruthTextureEncoder - RGBA Manifold Encoding for CTRM Results

Encodes CTRM analysis results as a 2D RGBA texture for visualization
on the Geometry OS Infinite Map.

Channel Mapping:
- R: E1_archaeology * 255 (Archaeological evidence)
- G: E2_manuscript * 255 (Manuscript reliability)
- B: E3_prophecy * 255 (Prophetic fulfillment)
- A: confidence * 255 (Overall truth confidence)

Author: Genesis Pilot Batch
Date: February 20, 2026
"""

from typing import List, Dict, Tuple
from PIL import Image


class TruthTextureEncoder:
    """
    Encodes CTRM verse analysis results as an RGBA texture image.

    The texture uses row-major ordering for verse positions:
    - Verse 0 at (0,0)
    - Verse 1 at (1,0)
    - Verse N at (N % size, N // size)
    """

    def __init__(self, size: int = 10):
        """
        Initialize encoder with given texture size.

        Args:
            size: Width and height of square texture (default 10 for 100 verses)
        """
        self.size = size

    def encode(self, results: List[Dict]) -> Image.Image:
        """
        Encode CTRM results as RGBA PIL Image.

        Args:
            results: List of verse analysis dicts with triad_scores and ctrm_evaluation

        Returns:
            PIL Image in RGBA mode with dimensions (size, size)
        """
        img = Image.new('RGBA', (self.size, self.size), (0, 0, 0, 0))
        pixels = img.load()

        for i, result in enumerate(results):
            if i >= self.size * self.size:
                break

            x = i % self.size
            y = i // self.size
            r, g, b, a = self._verse_to_pixel(result)
            pixels[x, y] = (r, g, b, a)

        return img

    def save(self, results: List[Dict], output_path: str) -> None:
        """
        Encode results and save as PNG file.

        Args:
            results: List of verse analysis dicts
            output_path: Path to save .rts.png file
        """
        img = self.encode(results)
        img.save(output_path, 'PNG')
        print(f"Truth manifold saved to {output_path}")

    def _verse_to_pixel(self, result: Dict) -> Tuple[int, int, int, int]:
        """
        Convert single verse result to RGBA tuple.

        Args:
            result: Dict containing triad_scores and ctrm_evaluation

        Returns:
            Tuple of (R, G, B, A) values 0-255
        """
        triad = result.get('triad_scores', {})
        evaluation = result.get('ctrm_evaluation', {})

        # Extract triad scores (E1, E2, E3)
        e1 = triad.get('E1_archaeology', 0.0)
        e2 = triad.get('E2_manuscript', 0.0)
        e3 = triad.get('E3_prophecy', 0.0)

        # Get confidence score
        confidence = evaluation.get('confidence', 0.5)

        # Clamp values to [0, 1]
        e1 = max(0.0, min(1.0, e1))
        e2 = max(0.0, min(1.0, e2))
        e3 = max(0.0, min(1.0, e3))
        confidence = max(0.0, min(1.0, confidence))

        # Scale to 0-255
        r = int(e1 * 255)
        g = int(e2 * 255)
        b = int(e3 * 255)
        a = int(confidence * 255)

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
