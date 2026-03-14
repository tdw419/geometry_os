"""
PixelRTS Verification Infrastructure.

Provides composable verification steps for validating .rts.png files.

Key Components:
- VerificationStep: Abstract base class for verification steps
- VerificationResult: Result dataclass with pass/fail and details
- StepResult: Single step result
- VerificationStatus: Enum for pass/fail/warning/skip
- VerificationContext: Shared state and lazy data access

Verifiers:
- StructureVerifier: PNG structure validation
- ConsistencyVerifier: SHA256 hash verification
- SegmentIntegrityChecker: Per-segment hash verification
- SignatureVerifier: Ed25519 cryptographic signature verification

Signing:
- FileSigner: Ed25519 signing for PixelRTS files

Usage:
    from systems.pixel_compiler.verification import (
        VerificationStep,
        VerificationResult,
        VerificationContext,
        FileSigner
    )

    # Create context
    context = VerificationContext(Path("file.rts.png"))

    # Sign a file
    private_key, _ = FileSigner.generate_keypair()
    signer = FileSigner(private_key)
    signer.sign_file(Path("boot.rts.png"))
"""

from .base import VerificationStep
from .consistency_verifier import ConsistencyVerifier
from .context import VerificationContext

# Import signing utilities
from .file_signer import FileSigner
from .result import StepResult, VerificationResult, VerificationStatus
from .segment_integrity_checker import SegmentIntegrityChecker
from .signature_verifier import SignatureVerifier

# Import verifiers for convenience
from .structure_verifier import StructureVerifier

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
    "SignatureVerifier",
    # Signing
    "FileSigner",
]
