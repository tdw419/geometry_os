"""
Segment integrity checker for per-segment hash verification.

Verifies individual segment integrity using range-based decode for efficiency.
This is critical for large files where full decode takes ~5 seconds but
range decode is ~1ms.
"""

import time
from typing import Optional, TYPE_CHECKING

from .base import VerificationStep
from .result import StepResult, VerificationStatus
from .context import VerificationContext

if TYPE_CHECKING:
    pass


class SegmentIntegrityChecker(VerificationStep):
    """
    Verifies individual segment integrity using range-based decode.

    This verifier:
    1. Loads segment offsets from metadata['offsets']
    2. Loads expected hashes from metadata['hashes']
    3. Uses decode_range() for efficient partial decode
    4. Compares computed hash with expected hash per segment

    When segment_name is None (default), verifies all segments.
    When segment_name is specified, verifies only that segment.

    Returns:
    - PASS if segment hash(es) match
    - FAIL if any segment hash doesn't match
    - SKIP if no segment metadata found
    """

    def __init__(self, segment_name: Optional[str] = None):
        """
        Initialize segment integrity checker.

        Args:
            segment_name: Optional segment to verify (e.g., "kernel", "initrd", "disk").
                         If None, verifies all segments.
        """
        self.segment_name = segment_name

    @property
    def name(self) -> str:
        return "segment_integrity"

    @property
    def description(self) -> str:
        return "Verifies individual segment integrity using range-based decode"

    def verify(self, context: VerificationContext) -> StepResult:
        """
        Perform segment integrity verification.

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
                message="No metadata found - cannot verify segment integrity",
                details={"error": "Metadata not available"},
                duration_ms=(time.time() - start_time) * 1000
            )

        # Check if 'offsets' key exists in metadata
        if "offsets" not in metadata or not metadata["offsets"]:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.SKIP,
                message="No segment offsets found in metadata",
                details={"note": "Metadata does not contain segment offset information"},
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
                message="Cannot read PNG data for segment verification",
                details={"error": context.load_errors},
                duration_ms=(time.time() - start_time) * 1000
            )

        offsets = metadata["offsets"]
        hashes = metadata["hashes"]

        # Determine which segments to verify
        if self.segment_name:
            # Verify single segment
            segments_to_verify = [self.segment_name]
        else:
            # Verify all segments that have both offset and hash
            segments_to_verify = [
                seg for seg in offsets.keys()
                if seg in hashes
            ]

        if not segments_to_verify:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.SKIP,
                message="No segments found with both offset and hash metadata",
                details={
                    "offsets_available": list(offsets.keys()),
                    "hashes_available": list(hashes.keys())
                },
                duration_ms=(time.time() - start_time) * 1000
            )

        # Import decoder
        try:
            from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder, PixelRTSMetadata
            decoder = PixelRTSDecoder()
        except ImportError as e:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message=f"Failed to import decoder: {e}",
                details={"error": str(e)},
                duration_ms=(time.time() - start_time) * 1000
            )

        # Verify each segment
        results = []
        failed_segments = []

        for segment in segments_to_verify:
            segment_offset = offsets[segment]
            expected_hash = hashes[segment]

            # Validate offset format
            if not isinstance(segment_offset, dict) or "start" not in segment_offset or "size" not in segment_offset:
                failed_segments.append({
                    "segment": segment,
                    "error": f"Invalid offset format for segment '{segment}'"
                })
                continue

            start_byte = segment_offset["start"]
            size = segment_offset["size"]

            try:
                # Use decode_range for efficient partial decode
                segment_data = decoder.decode_range(png_data, start_byte, size)

                # Compute hash of segment data
                actual_hash = PixelRTSMetadata.hash_data(segment_data)

                if actual_hash == expected_hash:
                    results.append({
                        "segment": segment,
                        "status": "pass",
                        "size": size
                    })
                else:
                    failed_segments.append({
                        "segment": segment,
                        "status": "fail",
                        "expected": expected_hash,
                        "actual": actual_hash,
                        "size": size
                    })

            except Exception as e:
                failed_segments.append({
                    "segment": segment,
                    "error": str(e)
                })

        # Determine overall result
        if failed_segments:
            # Format failure details
            failure_details = []
            for fail in failed_segments:
                if "error" in fail:
                    failure_details.append(f"{fail['segment']}: {fail['error']}")
                else:
                    failure_details.append(
                        f"{fail['segment']}: hash mismatch (expected {fail['expected'][:16]}...)"
                    )

            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message=f"Segment integrity verification failed for {len(failed_segments)} segment(s)",
                details={
                    "failed_segments": failed_segments,
                    "passed_segments": len(results),
                    "total_segments": len(segments_to_verify)
                },
                duration_ms=(time.time() - start_time) * 1000
            )

        # All segments passed
        segment_names = [r["segment"] for r in results]
        return StepResult(
            step_name=self.name,
            status=VerificationStatus.PASS,
            message=f"Segment integrity verified for {len(results)} segment(s)",
            details={
                "segments": segment_names,
                "sizes": {r["segment"]: r["size"] for r in results}
            },
            duration_ms=(time.time() - start_time) * 1000
        )
