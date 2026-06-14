"""
FileSigner - Ed25519 signing for PixelRTS files.

Provides cryptographic signing capabilities for boot images using Ed25519.
Signatures are embedded in PNG metadata for verification during boot.
"""

from io import BytesIO
from pathlib import Path

from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import ed25519
from PIL import Image, PngImagePlugin


class FileSigner:
    """
    Signs PixelRTS files with Ed25519 signatures.

    The signature is stored in PNG metadata under the 'signature' key,
    allowing verification by SignatureVerifier during boot.

    Usage:
        # Generate a new keypair
        private_key, public_key_bytes = FileSigner.generate_keypair()

        # Save private key for later use
        FileSigner.save_private_key(private_key, Path("private_key.pem"))

        # Sign a file
        signer = FileSigner(private_key)
        signed_path = signer.sign_file(Path("boot.rts.png"))

        # Later, load the private key
        loaded_key = FileSigner.load_private_key(Path("private_key.pem"))
    """

    def __init__(self, private_key: ed25519.Ed25519PrivateKey):
        """
        Initialize FileSigner with a private key.

        Args:
            private_key: Ed25519 private key for signing
        """
        self.private_key = private_key
        self.public_key = private_key.public_key()

    def sign_file(
        self,
        png_path: Path,
        output_path: Path | None = None
    ) -> Path:
        """
        Sign a PixelRTS file and add signature to metadata.

        Reads the PNG file, extracts its metadata, gets the data hash
        from metadata["hashes"]["data"], signs it with Ed25519, and
        adds the signature to metadata.

        Args:
            png_path: Path to the .rts.png file to sign
            output_path: Optional output path (defaults to overwriting input)

        Returns:
            Path to the signed file

        Raises:
            ValueError: If file is not a valid PixelRTS file or missing hash
            FileNotFoundError: If input file doesn't exist
        """
        png_path = Path(png_path)
        if not png_path.exists():
            raise FileNotFoundError(f"File not found: {png_path}")

        # Read the PNG file
        png_data = png_path.read_bytes()

        # Open image and extract metadata
        img = Image.open(BytesIO(png_data))

        # Find PixelRTS metadata
        metadata_text = img.text.get("PixelRTS")
        if metadata_text is None:
            raise ValueError(f"Not a PixelRTS file: {png_path}")

        # Parse metadata
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata

        try:
            metadata = PixelRTSMetadata.decode_png_text(
                metadata_text.encode("utf-8")
            )
        except ValueError as e:
            raise ValueError(f"Invalid PixelRTS metadata: {e}")

        # Get the data hash to sign
        hashes = metadata.get("hashes", {})
        data_hash = hashes.get("data")

        if data_hash is None:
            raise ValueError(
                f"PixelRTS file missing data hash: {png_path}. "
                "Cannot sign file without hash."
            )

        # Sign the hash (32 bytes as hex = 64 chars)
        # We sign the hash bytes, not the hex string
        hash_bytes = bytes.fromhex(data_hash)
        signature = self.private_key.sign(hash_bytes)

        # Get public key bytes for verification
        public_key_bytes = self.public_key.public_bytes(
            encoding=serialization.Encoding.Raw,
            format=serialization.PublicFormat.Raw
        )

        # Add signature to metadata
        metadata["signature"] = {
            "algorithm": "Ed25519",
            "public_key": public_key_bytes.hex(),
            "value": signature.hex()
        }

        # Re-encode metadata
        encoded_metadata = PixelRTSMetadata.encode_png_text(metadata)

        # Preserve all existing text chunks
        pnginfo = PngImagePlugin.PngInfo()
        for key, value in img.text.items():
            if key == "PixelRTS":
                # Update with new signed metadata
                pnginfo.add_text(key, encoded_metadata.decode("utf-8"))
            else:
                # Preserve other text chunks
                pnginfo.add_text(key, value)

        # Determine output path
        if output_path is None:
            output_path = png_path

        # Save the signed PNG
        # Need to save with the same image data but new metadata
        buffer = BytesIO()
        img.save(buffer, format="PNG", pnginfo=pnginfo)
        buffer.seek(0)

        # Write to output path
        output_path = Path(output_path)
        output_path.write_bytes(buffer.getvalue())

        return output_path

    @staticmethod
    def generate_keypair() -> tuple[ed25519.Ed25519PrivateKey, bytes]:
        """
        Generate a new Ed25519 keypair.

        Returns:
            Tuple of (private_key, public_key_bytes)
            - private_key: Ed25519PrivateKey for signing
            - public_key_bytes: Raw 32-byte public key for distribution
        """
        private_key = ed25519.Ed25519PrivateKey.generate()
        public_key = private_key.public_key()

        public_key_bytes = public_key.public_bytes(
            encoding=serialization.Encoding.Raw,
            format=serialization.PublicFormat.Raw
        )

        return private_key, public_key_bytes

    @staticmethod
    def save_private_key(
        private_key: ed25519.Ed25519PrivateKey,
        path: Path
    ) -> None:
        """
        Save a private key to a PEM file.

        Uses PKCS8 format for broad compatibility.

        Args:
            private_key: Ed25519 private key to save
            path: Output path for the PEM file
        """
        path = Path(path)

        pem_data = private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        )

        path.write_bytes(pem_data)

    @staticmethod
    def load_private_key(path: Path) -> ed25519.Ed25519PrivateKey:
        """
        Load a private key from a PEM file.

        Args:
            path: Path to the PEM file

        Returns:
            Ed25519 private key

        Raises:
            FileNotFoundError: If file doesn't exist
            ValueError: If file is not a valid Ed25519 private key
        """
        path = Path(path)
        if not path.exists():
            raise FileNotFoundError(f"Key file not found: {path}")

        pem_data = path.read_bytes()

        try:
            private_key = serialization.load_pem_private_key(
                pem_data,
                password=None,
                backend=default_backend()
            )
        except Exception as e:
            raise ValueError(f"Failed to load private key: {e}")

        if not isinstance(private_key, ed25519.Ed25519PrivateKey):
            raise ValueError(
                f"Expected Ed25519 private key, got {type(private_key)}"
            )

        return private_key

    @staticmethod
    def load_public_key(public_key_bytes: bytes) -> ed25519.Ed25519PublicKey:
        """
        Load a public key from raw bytes.

        Args:
            public_key_bytes: Raw 32-byte Ed25519 public key

        Returns:
            Ed25519 public key
        """
        return ed25519.Ed25519PublicKey.from_public_bytes(public_key_bytes)
