"""
Signature verifier for Ed25519 cryptographic signature validation.

Verifies that file signatures are valid using Ed25519 public key cryptography.
This ensures file authenticity and detects tampering.
"""

import os
import time

from .base import VerificationStep
from .context import VerificationContext
from .result import StepResult, VerificationStatus


class SignatureVerifier(VerificationStep):
    """
    Verifies Ed25519 cryptographic signatures.

    This verifier:
    1. Gets public key (precedence: env var PIXELRTS_PUBLIC_KEY > metadata)
    2. Gets signature from metadata["signature"]["value"]
    3. Gets data hash from metadata["hashes"]["data"] (SHA256, 32 bytes)
    4. Performs Ed25519 verification of signature against hash

    Returns:
    - PASS if signature is valid
    - FAIL if signature is invalid (file may be tampered)
    - SKIP if file is unsigned or no public key available
    """

    @property
    def name(self) -> str:
        return "signature"

    @property
    def description(self) -> str:
        return "Verifies Ed25519 cryptographic signature"

    def verify(self, context: VerificationContext) -> StepResult:
        """
        Perform Ed25519 signature verification.

        Args:
            context: Verification context with file access

        Returns:
            StepResult with verification outcome
        """
        start_time = time.time()

        # Step 1: Get public key (env var takes precedence)
        public_key_hex = os.environ.get("PIXELRTS_PUBLIC_KEY")

        # Load metadata to check for embedded public key if env var not set
        metadata = context.metadata

        if public_key_hex is None:
            # Try to get public key from metadata
            if metadata is None:
                return StepResult(
                    step_name=self.name,
                    status=VerificationStatus.SKIP,
                    message="No public key available",
                    details={"note": "No PIXELRTS_PUBLIC_KEY env var and no metadata found"},
                    duration_ms=(time.time() - start_time) * 1000
                )

            signature_info = metadata.get("signature", {})
            public_key_hex = signature_info.get("public_key")

            if public_key_hex is None:
                return StepResult(
                    step_name=self.name,
                    status=VerificationStatus.SKIP,
                    message="No public key available",
                    details={"note": "No PIXELRTS_PUBLIC_KEY env var and no embedded public key"},
                    duration_ms=(time.time() - start_time) * 1000
                )

        # Step 2: Get signature from metadata
        if metadata is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.SKIP,
                message="No metadata found - cannot verify signature",
                details={"error": "Metadata not available"},
                duration_ms=(time.time() - start_time) * 1000
            )

        signature_info = metadata.get("signature", {})
        signature_hex = signature_info.get("value")

        if signature_hex is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.SKIP,
                message="File is not signed",
                details={"note": "No signature found in metadata"},
                duration_ms=(time.time() - start_time) * 1000
            )

        # Step 3: Get data hash from metadata
        hashes = metadata.get("hashes", {})
        data_hash_hex = hashes.get("data")

        if data_hash_hex is None:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Cannot compute data hash for verification",
                details={"error": "No data hash found in metadata"},
                duration_ms=(time.time() - start_time) * 1000
            )

        # Step 4: Perform Ed25519 verification
        try:
            from cryptography.exceptions import InvalidSignature
            from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PublicKey

            # Convert hex strings to bytes
            # Public key: 64 hex chars = 32 bytes
            # Signature: 128 hex chars = 64 bytes
            # Data hash: 64 hex chars = 32 bytes
            public_key_bytes = bytes.fromhex(public_key_hex)
            signature_bytes = bytes.fromhex(signature_hex)
            data_hash_bytes = bytes.fromhex(data_hash_hex)

            # Create public key object and verify
            public_key = Ed25519PublicKey.from_public_bytes(public_key_bytes)
            public_key.verify(signature_bytes, data_hash_bytes)

            # Verification passed
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.PASS,
                message="Signature verification passed",
                details={
                    "public_key": public_key_hex[:16] + "...",
                    "hash_verified": data_hash_hex[:16] + "..."
                },
                duration_ms=(time.time() - start_time) * 1000
            )

        except InvalidSignature:
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message="Signature verification failed - file may be tampered",
                details={
                    "error": "Invalid signature",
                    "public_key_prefix": public_key_hex[:16] + "..."
                },
                duration_ms=(time.time() - start_time) * 1000
            )

        except ValueError as e:
            # Handle malformed hex strings
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message=f"Malformed cryptographic data: {e}",
                details={"error": str(e)},
                duration_ms=(time.time() - start_time) * 1000
            )

        except Exception as e:
            # Handle any other errors (e.g., invalid key format)
            return StepResult(
                step_name=self.name,
                status=VerificationStatus.FAIL,
                message=f"Signature verification error: {e}",
                details={"error": str(e)},
                duration_ms=(time.time() - start_time) * 1000
            )
