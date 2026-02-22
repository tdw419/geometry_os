"""
Secure Storage for PixelRTS Phase 4 Security

Provides encrypted file-based storage with sharding for scalability,
and secure metadata storage with automatic sensitive field separation.
"""

import os
import json
import hashlib
from pathlib import Path
from typing import Dict, Any, Optional, List, Set

from .encryption import EncryptionManager


class SecureStorage:
    """
    Encrypted file-based storage with sharding.

    Files are stored in subdirectories 00-99 based on key hash
    to avoid too many files in a single directory.

    Each stored value is encrypted using the provided EncryptionManager
    before being written to disk.
    """

    def __init__(self, storage_path: str, encryption_manager: EncryptionManager):
        """
        Initialize secure storage.

        Args:
            storage_path: Base directory for storage. Will be created if doesn't exist.
            encryption_manager: EncryptionManager instance for encryption/decryption.
        """
        self.storage_path = Path(storage_path)
        self.encryption_manager = encryption_manager

        # Create storage directory if it doesn't exist
        self.storage_path.mkdir(parents=True, exist_ok=True)

        # Create shard directories
        for i in range(100):
            shard_dir = self.storage_path / f"{i:02d}"
            shard_dir.mkdir(exist_ok=True)

    def _get_file_path(self, key: str) -> Path:
        """
        Get the file path for a given key using sharding.

        The shard is determined by the first 2 digits of the key's SHA256 hash.
        This provides an even distribution across 100 shards.

        Args:
            key: Storage key.

        Returns:
            Path to the file where the value should be stored.
        """
        # Hash the key to determine shard
        key_hash = hashlib.sha256(key.encode('utf-8')).hexdigest()
        shard_num = int(key_hash[:2], 16) % 100

        # Create path: storage_path/XX/key
        shard_dir = self.storage_path / f"{shard_num:02d}"
        return shard_dir / key

    def set(self, key: str, value: Dict[str, Any]) -> None:
        """
        Store an encrypted value at the given key.

        Args:
            key: Storage key.
            value: Dictionary value to encrypt and store.

        Raises:
            TypeError: If value is not a dictionary.
        """
        if not isinstance(value, dict):
            raise TypeError(f"Value must be a dict, got {type(value).__name__}")

        # Encrypt the value
        encrypted_hex = self.encryption_manager.encrypt_dict(value)

        # Write to file
        file_path = self._get_file_path(key)
        with open(file_path, 'w') as f:
            f.write(encrypted_hex)

    def get(self, key: str) -> Optional[Dict[str, Any]]:
        """
        Retrieve and decrypt a value from storage.

        Args:
            key: Storage key.

        Returns:
            The decrypted dictionary value, or None if key doesn't exist.
        """
        file_path = self._get_file_path(key)

        if not file_path.exists():
            return None

        with open(file_path, 'r') as f:
            encrypted_hex = f.read().strip()

        if not encrypted_hex:
            return None

        try:
            return self.encryption_manager.decrypt_dict(encrypted_hex)
        except (ValueError, TypeError):
            return None

    def delete(self, key: str) -> None:
        """
        Delete a value from storage.

        Silently succeeds if the key doesn't exist.

        Args:
            key: Storage key to delete.
        """
        file_path = self._get_file_path(key)

        if file_path.exists():
            file_path.unlink()

    def list_keys(self) -> List[str]:
        """
        List all stored keys.

        Returns:
            List of all keys in storage.
        """
        keys = []

        for shard_dir in sorted(self.storage_path.glob("[0-9][0-9]")):
            for file_path in shard_dir.iterdir():
                if file_path.is_file():
                    keys.append(file_path.name)

        return sorted(keys)


class SecureMetadataStore:
    """
    Secure metadata storage with automatic sensitive field separation.

    This class extends SecureStorage to provide specialized handling for
    metadata with sensitive fields. Sensitive fields are automatically
    separated and encrypted in their own files.

    Sensitive fields include:
    - api_keys
    - tokens
    - credentials
    - secrets
    - private_keys
    - webhook_urls
    - integration_keys
    """

    SENSITIVE_FIELDS: Set[str] = {
        'api_keys',
        'tokens',
        'credentials',
        'secrets',
        'private_keys',
        'webhook_urls',
        'integration_keys',
    }

    def __init__(self, storage_path: str, encryption_manager: EncryptionManager):
        """
        Initialize secure metadata store.

        Args:
            storage_path: Base directory for storage.
            encryption_manager: EncryptionManager instance.
        """
        self.storage = SecureStorage(storage_path, encryption_manager)

    def _split_metadata(self, metadata: Dict[str, Any]) -> tuple[Dict[str, Any], Dict[str, Any]]:
        """
        Split metadata into public and sensitive parts.

        Args:
            metadata: Complete metadata dictionary.

        Returns:
            Tuple of (public_metadata, sensitive_metadata).
        """
        public = {}
        sensitive = {}

        for key, value in metadata.items():
            if key in self.SENSITIVE_FIELDS:
                sensitive[key] = value
            else:
                public[key] = value

        return public, sensitive

    def save_metadata(self, file_id: str, metadata: Dict[str, Any]) -> None:
        """
        Save metadata with sensitive fields encrypted separately.

        Args:
            file_id: Unique identifier for the file/metadata.
            metadata: Complete metadata dictionary.

        The method splits the metadata into public and sensitive parts.
        Public metadata is stored in {file_id}.json
        Sensitive metadata is encrypted and stored in {file_id}_sensitive
        """
        public, sensitive = self._split_metadata(metadata)

        # Save public metadata as plain JSON
        public_path = self.storage.storage_path / f"{file_id}.json"
        with open(public_path, 'w') as f:
            json.dump(public, f)

        # Save sensitive metadata encrypted
        if sensitive:
            self.storage.set(f"{file_id}_sensitive", sensitive)

    def load_metadata(self, file_id: str, public_metadata: Optional[Dict[str, Any]] = None) -> Optional[Dict[str, Any]]:
        """
        Load and merge metadata for a file.

        Args:
            file_id: Unique identifier for the file/metadata.
            public_metadata: Optional pre-loaded public metadata.
                            If None, will attempt to load from disk.

        Returns:
            Complete metadata dictionary with public and sensitive fields merged,
            or None if file_id doesn't exist.
        """
        # Load public metadata
        if public_metadata is None:
            public_path = self.storage.storage_path / f"{file_id}.json"
            if not public_path.exists():
                return None
            with open(public_path, 'r') as f:
                public_metadata = json.load(f)

        # Load sensitive metadata
        sensitive_data = self.storage.get(f"{file_id}_sensitive")
        if sensitive_data is None:
            sensitive_data = {}

        # Merge and return
        return {**public_metadata, **sensitive_data}

    def delete_metadata(self, file_id: str) -> None:
        """
        Delete all metadata for a file.

        Args:
            file_id: Unique identifier for the file/metadata.

        Deletes both public and sensitive metadata.
        """
        # Delete public metadata
        public_path = self.storage.storage_path / f"{file_id}.json"
        if public_path.exists():
            public_path.unlink()

        # Delete sensitive metadata
        self.storage.delete(f"{file_id}_sensitive")

    def list_files(self) -> List[str]:
        """
        List all file IDs that have metadata.

        Returns:
            List of file IDs (without .json extension).
        """
        files = []
        for json_file in self.storage.storage_path.glob("*.json"):
            files.append(json_file.stem)

        return sorted(files)
