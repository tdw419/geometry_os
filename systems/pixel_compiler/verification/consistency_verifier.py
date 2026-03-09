"""
Consistency verifier for hash validation.

Verifies that decoded data SHA256 matches the hash stored in metadata.
This catches data corruption and tampering.
"""

import time
from typing import TYPE_CHECKING

from .base import VerificationStep
from .result import StepResult, VerificationStatus
from .context import VerificationContext

if TYPE_CHECKING:
    pass


class ConsistencyVerifier(VerificationStep):
    """
    Verifies hash consistency between metadata and decoded data.

    This verifier:
    1. Loads the expected hash from metadata['hashes']
    2. Decodes the data using PixelRTSDecoder
    3. Computes SHA256 of the decoded data
    4. Compares with the expected hash

    Returns:
    - PASS if hashes match
    - FAIL if hashes don't match (indicates corruption/tampering)
    - SKIP if no hash metadata found
    """

    @property
    def name(self) -> str:
        return "consistency"

    @property
    def description(self) -> str:
        return "Verifies decoded data SHA256 matches metadata hash"

    def verify(self, context: VerificationContext) -> StepResult:
        """
        Perform hash consistency verification.

        Args:
            context: Verification context with file access

        Returns:
            StepResult with verification outcome
        """
        start_time = time.time()

        # Load metadata from context
        metadata = context.metadata
        if metadata is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.SKIP,
                message="No metadata found - cannot verify hash consistency",
                details={"error": "Metadata not available"},
                duration_ms=(time.time() - start_time) * 1000
            )

        # Check if 'hashes' key exists in metadata
        if "hashes" not in metadata or not metadata["hashes"]:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.SKIP,
                message="No hash metadata found",
                details={"note": "Metadata does not contain hash information"},
                duration_ms=(time.time() - start_time) * 1000
            )

        # Get PNG data for decoding
        png_data = context.png_data
        if png_data is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Cannot read PNG data for hash verification",
                details={"error": context.load_errors},
                duration_ms=(time.time() - start_time) * 1000
            )

        # Decode the data using PixelRTSDecoder
        try:
            from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder

            decoder = PixelRTSDecoder()
            decoded_data = decoder.decode(png_data)
        except Exception as e:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message=f"Failed to decode data: {e}",
                details={"error": str(e)},
                duration_ms=(time.time() - start_time) * 1000
            )

        # Compute SHA256 of decoded data
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata
        actual_hash = PixelRTSMetadata.hash_data(decoded_data)

        # Get expected hash from metadata
        # Check for 'data' key first, then fall back to any available hash
        hashes = metadata["hashes"]
        expected_hash = hashes.get("data")

        if expected_hash is None:
            # No 'data' hash, check if there are segment-specific hashes
            # For full data verification, we look for a 'data' key specifically
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.SKIP,
                message="No data hash found in metadata",
                details={
                    "available_hashes": list(hashes.keys()),
                    "note": "Metadata has hashes but no 'data' key for full data verification"
                },
                duration_ms=(time.time() - start_time) * 1000
            )

        # Compare hashes
        if actual_hash == expected_hash:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.PASS,
                message="Hash consistency verified",
                details={
                    "hash": actual_hash[:16] + "...",  # Show first 16 chars for confirmation
                    "data_size": len(decoded_data)
                },
                duration_ms=(time.time() - start_time) * 1000
            )
        else:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Hash mismatch detected - data may be corrupted or tampered",
                details={
                    "expected": expected_hash,
                    "actual": actual_hash,
                    "data_size": len(decoded_data)
                },
                duration_ms=(time.time() - start_time) * 1000
            )
