"""
PixelRTS Verification Infrastructure.

Provides composable verification steps for validating .rts.png files.

Key Components:
- VerificationStep: Abstract base class for verification steps
- VerificationResult: Result dataclass with pass/fail and details
- StepResult: Single step result
- VerificationStatus: Enum for pass/fail/warning/skip
- VerificationContext: Shared state and lazy data access

Usage:
    from systems.pixel_compiler.verification import (
        VerificationStep,
        VerificationResult,
        VerificationContext,
        StructureVerifier
    )

    # Create context
    context = VerificationContext(Path("file.rts.png"))

    # Run verification
    verifier = StructureVerifier()
    result = verifier.verify(context)

    # Check result
    if result.is_pass():
        print("Verification passed!")
    else:
        print(result.format_cli())
"""

from .result import VerificationStatus, StepResult, VerificationResult
from .base import VerificationStep
from .context import VerificationContext

# Import verifiers for convenience
from .structure_verifier import StructureVerifier
from .consistency_verifier import ConsistencyVerifier
from .segment_integrity_checker import SegmentIntegrityChecker

__all__ = [
    # Result types
    "VerificationStatus",
    "StepResult",
    "VerificationResult",
    # Base classes
    "VerificationStep",
    # Context
    "VerificationContext",
    # Verifiers
    "StructureVerifier",
    "ConsistencyVerifier",
    "SegmentIntegrityChecker",
]
