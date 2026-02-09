"""
AES-256-GCM Encryption Manager for PixelRTS Phase 4 Security

Provides secure encryption services using AES-256-GCM with:
- 96-bit nonces (12 bytes) for each encryption
- 32-byte master key (256 bits)
- PBKDF2 key derivation from passwords
- Support for associated data (AAD) for authenticated encryption
"""

import os
from typing import Dict, Any, Tuple, Optional
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.backends import default_backend


class EncryptionManager:
    """
    Manages AES-256-GCM encryption for PixelRTS secure storage.

    The encryption manager uses AES-256-GCM which provides:
    - Confidentiality (encryption)
    - Integrity (authentication tag)
    - Authenticated encryption with associated data (AAD)

    Master key can be provided directly, loaded from PIXELRTS_MASTER_KEY
    environment variable, or auto-generated.
    """

    NONCE_SIZE = 12  # 96 bits (12 bytes) - recommended for GCM
    KEY_SIZE = 32  # 256 bits (32 bytes) for AES-256
    PBKDF2_ITERATIONS = 100000  # Number of iterations for key derivation

    def __init__(self, master_key: Optional[bytes] = None):
        """
        Initialize the EncryptionManager with a master key.

        Args:
            master_key: Optional 32-byte master key. If None, will attempt
                       to load from PIXELRTS_MASTER_KEY env var or generate
                       a new random key.

        Raises:
            ValueError: If provided master key is not 32 bytes.
        """
        if master_key is not None:
            if len(master_key) != self.KEY_SIZE:
                raise ValueError(
                    f"Master key must be {self.KEY_SIZE} bytes, "
                    f"got {len(master_key)} bytes"
                )
            self._master_key = master_key
        else:
            self._master_key = self._get_master_key_from_env()

    def _get_master_key_from_env(self) -> bytes:
        """
        Load master key from PIXELRTS_MASTER_KEY environment variable.

        Returns:
            32-byte master key.

        Raises:
            ValueError: If environment variable contains invalid hex.
        """
        env_key = os.environ.get('PIXELRTS_MASTER_KEY')
        if env_key:
            try:
                key = bytes.fromhex(env_key)
                if len(key) != self.KEY_SIZE:
                    raise ValueError(
                        f"PIXELRTS_MASTER_KEY must be {self.KEY_SIZE} bytes "
                        f"({self.KEY_SIZE * 2} hex chars), got {len(key)} bytes"
                    )
                return key
            except ValueError as e:
                raise ValueError(
                    f"PIXELRTS_MASTER_KEY must be a valid hex string: {e}"
                )

        # Generate a new random key if none provided
        return os.urandom(self.KEY_SIZE)

    def encrypt(self, plaintext: bytes, associated_data: Optional[bytes] = None) -> bytes:
        """
        Encrypt data using AES-256-GCM.

        Args:
            plaintext: The data to encrypt.
            associated_data: Optional additional authenticated data (AAD).
                           This data is not encrypted but is authenticated.
                           Use for context like user IDs or file IDs.

        Returns:
            Nonce (12 bytes) + ciphertext + authentication tag (16 bytes).
            The format is: nonce || ciphertext, where AESGCM appends the tag.

        Raises:
            ValueError: If plaintext is empty.
        """
        if not plaintext:
            raise ValueError("Plaintext cannot be empty")

        # Generate a random nonce for each encryption
        nonce = os.urandom(self.NONCE_SIZE)

        # Create AESGCM cipher with master key
        aesgcm = AESGCM(self._master_key)

        # Encrypt with optional associated data
        # AESGCM.encrypt returns nonce || ciphertext || tag
        ciphertext = aesgcm.encrypt(nonce, plaintext, associated_data)

        # Prepend nonce to ciphertext for storage
        return nonce + ciphertext

    def decrypt(self, data: bytes, associated_data: Optional[bytes] = None) -> bytes:
        """
        Decrypt data that was encrypted with encrypt().

        Args:
            data: Nonce + ciphertext + authentication tag (as returned by encrypt).
            associated_data: Optional additional authenticated data.
                           Must match the associated_data used during encryption.

        Returns:
            The decrypted plaintext.

        Raises:
            ValueError: If data is too short or decryption fails.
            cryptography.exceptions.InvalidTag: If authentication tag is invalid
                                               (wrong key or corrupted data).
        """
        if len(data) < self.NONCE_SIZE:
            raise ValueError(
                f"Data must be at least {self.NONCE_SIZE} bytes "
                f"(nonce size), got {len(data)} bytes"
            )

        # Extract nonce from the beginning
        nonce = data[:self.NONCE_SIZE]
        ciphertext = data[self.NONCE_SIZE:]

        # Create AESGCM cipher and decrypt
        aesgcm = AESGCM(self._master_key)

        try:
            plaintext = aesgcm.decrypt(nonce, ciphertext, associated_data)
            return plaintext
        except Exception as e:
            raise ValueError(f"Decryption failed: {e}")

    def encrypt_dict(self, data: Dict[str, Any]) -> str:
        """
        Encrypt a dictionary to a hex string.

        The dictionary is serialized to JSON before encryption.

        Args:
            data: Dictionary to encrypt.

        Returns:
            Hex-encoded encrypted data (nonce + ciphertext + tag).

        Raises:
            ValueError: If data is empty.
            TypeError: If data is not a dictionary or contains non-serializable items.
        """
        if not isinstance(data, dict):
            raise TypeError(f"Expected dict, got {type(data).__name__}")

        if not data:
            raise ValueError("Dictionary cannot be empty")

        import json

        # Serialize to JSON bytes
        plaintext = json.dumps(data, separators=(',', ':')).encode('utf-8')

        # Encrypt
        encrypted = self.encrypt(plaintext)

        # Return as hex string
        return encrypted.hex()

    def decrypt_dict(self, encrypted_hex: str) -> Dict[str, Any]:
        """
        Decrypt a hex string to a dictionary.

        Args:
            encrypted_hex: Hex-encoded encrypted data from encrypt_dict().

        Returns:
            The decrypted dictionary.

        Raises:
            ValueError: If hex string is invalid or decryption fails.
            TypeError: If decrypted data is not a valid JSON dict.
        """
        try:
            encrypted = bytes.fromhex(encrypted_hex)
        except ValueError as e:
            raise ValueError(f"Invalid hex string: {e}")

        plaintext = self.decrypt(encrypted)

        import json

        try:
            data = json.loads(plaintext.decode('utf-8'))
        except (json.JSONDecodeError, UnicodeDecodeError) as e:
            raise TypeError(f"Decrypted data is not valid JSON: {e}")

        if not isinstance(data, dict):
            raise TypeError(f"Expected dict, got {type(data).__name__}")

        return data

    def encrypt_string(self, plaintext: str) -> str:
        """
        Encrypt a string to a hex string.

        Args:
            plaintext: String to encrypt.

        Returns:
            Hex-encoded encrypted data (nonce + ciphertext + tag).

        Raises:
            ValueError: If plaintext is empty.
        """
        if not plaintext:
            raise ValueError("Plaintext cannot be empty")

        plaintext_bytes = plaintext.encode('utf-8')
        encrypted = self.encrypt(plaintext_bytes)

        return encrypted.hex()

    def decrypt_string(self, encrypted_hex: str) -> str:
        """
        Decrypt a hex string to a string.

        Args:
            encrypted_hex: Hex-encoded encrypted data from encrypt_string().

        Returns:
            The decrypted string.

        Raises:
            ValueError: If hex string is invalid or decryption fails.
        """
        try:
            encrypted = bytes.fromhex(encrypted_hex)
        except ValueError as e:
            raise ValueError(f"Invalid hex string: {e}")

        plaintext_bytes = self.decrypt(encrypted)

        return plaintext_bytes.decode('utf-8')

    @staticmethod
    def derive_key(password: bytes, salt: Optional[bytes] = None) -> Tuple[bytes, bytes]:
        """
        Derive a cryptographic key from a password using PBKDF2.

        Args:
            password: The password to derive from.
            salt: Optional salt for key derivation. If None, generates a random 16-byte salt.

        Returns:
            Tuple of (derived_key, salt_used). The derived key is 32 bytes.

        Note:
            This uses PBKDF2-HMAC-SHA256 with 100,000 iterations.
            For production use, consider increasing iterations or using
            Argon2id for better resistance against GPU attacks.
        """
        if salt is None:
            salt = os.urandom(16)

        if not isinstance(password, bytes):
            raise TypeError(f"Password must be bytes, got {type(password).__name__}")

        if not isinstance(salt, bytes):
            raise TypeError(f"Salt must be bytes, got {type(salt).__name__}")

        kdf = PBKDF2HMAC(
            algorithm=hashes.SHA256(),
            length=32,
            salt=salt,
            iterations=EncryptionManager.PBKDF2_ITERATIONS,
            backend=default_backend()
        )

        derived_key = kdf.derive(password)

        return derived_key, salt
