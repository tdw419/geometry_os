"""
Structure verifier for PNG validation.

Validates PNG structure and PixelRTS metadata.
"""

from .base import VerificationStep
from .result import StepResult, VerificationStatus
from .context import VerificationContext
import time


class StructureVerifier(VerificationStep):
    """
    Verifies PNG structure and PixelRTS metadata.

    Performs these checks:
    1. PNG Signature - Validates file starts with correct PNG signature
    2. PNG Chunk Structure - Verifies image can be opened and is square
    3. Grid Size Validation - Ensures grid_size is power of 2
    4. PixelRTS Metadata - Checks for valid PixelRTS tEXt chunk
    """

    # PNG signature bytes: 89 50 4E 47 0D 0A 1A 0A
    PNG_SIGNATURE = bytes([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])

    @property
    def name(self) -> str:
        return "structure"

    @property
    def description(self) -> str:
        return "Validates PNG structure and PixelRTS metadata"

    def verify(self, context: VerificationContext) -> StepResult:
        """
        Perform structure verification.

        Args:
            context: Verification context with file access

        Returns:
            StepResult with verification outcome
        """
        start_time = time.time()

        # Check 1: PNG Signature
        png_data = context.png_data
        if png_data is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Cannot read file",
                details={"error": context.load_errors},
                duration_ms=0.0
            )

        if not png_data.startswith(self.PNG_SIGNATURE):
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Invalid PNG signature",
                details={
                    "expected": self.PNG_SIGNATURE.hex(),
                    "actual": png_data[:8].hex() if len(png_data) >= 8 else png_data.hex()
                },
                duration_ms=(time.time() - start_time) * 1000
            )

        # Check 2: PNG Chunk Structure (PIL can open)
        image = context.image
        if image is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Cannot open image with PIL",
                details={"errors": context.load_errors},
                duration_ms=(time.time() - start_time) * 1000
            )

        width, height = image.size
        if width != height:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Image is not square",
                details={
                    "width": width,
                    "height": height
                },
                duration_ms=(time.time() - start_time) * 1000
            )

        # Check 3: Grid size is power of 2
        grid_size = width
        if not self._is_power_of_two(grid_size):
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Grid size is not a power of 2",
                details={
                    "grid_size": grid_size
                },
                duration_ms=(time.time() - start_time) * 1000
            )

        # Check 4: PixelRTS Metadata
        metadata = context.metadata
        if metadata is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="No valid PixelRTS metadata found",
                details={"errors": context.load_errors},
                duration_ms=(time.time() - start_time) * 1000
            )

        # All checks passed
        return StepResult(
            step_name=self.name,
            status=VerificationStatus.PASS,
            message="Valid PNG structure with PixelRTS metadata",
            details={
                "grid_size": grid_size,
                "mode": image.mode,
                "format_version": metadata.get("format", "unknown")
            },
            duration_ms=(time.time() - start_time) * 1000
        )

    def _is_power_of_two(self, n: int) -> bool:
        """Check if n is a power of 2."""
        return n > 0 and (n & (n - 1)) == 0
