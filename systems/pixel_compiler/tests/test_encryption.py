"""
Tests for encryption and secure storage modules.

Tests AES-256-GCM encryption, secure storage with sharding,
and secure metadata storage with sensitive field separation.
"""

import os
import tempfile
import shutil
import pytest
from pathlib import Path

from systems.pixel_compiler.auth.encryption import EncryptionManager
from systems.pixel_compiler.auth.secure_storage import SecureStorage, SecureMetadataStore


class TestEncryptionManager:
    """Test suite for EncryptionManager class."""

    def test_init_with_master_key(self):
        """Test initialization with provided master key."""
        key = os.urandom(32)
        manager = EncryptionManager(master_key=key)
        assert manager._master_key == key

    def test_init_generates_key_if_none_provided(self):
        """Test that a key is generated if none provided."""
        manager = EncryptionManager(master_key=None)
        assert manager._master_key is not None
        assert len(manager._master_key) == 32

    def test_init_loads_from_env(self):
        """Test loading master key from environment variable."""
        test_key = os.urandom(32)
        env_key_hex = test_key.hex()
        os.environ['PIXELRTS_MASTER_KEY'] = env_key_hex

        try:
            manager = EncryptionManager()
            assert manager._master_key == test_key
        finally:
            del os.environ['PIXELRTS_MASTER_KEY']

    def test_encrypt_decrypt_bytes(self):
        """Test basic encryption and decryption of bytes."""
        manager = EncryptionManager()
        plaintext = b"Hello, World!"
        associated_data = b"context"

        encrypted = manager.encrypt(plaintext, associated_data)
        assert encrypted != plaintext
        assert len(encrypted) > len(plaintext)

        decrypted = manager.decrypt(encrypted, associated_data)
        assert decrypted == plaintext

    def test_encrypt_decrypt_different_nonces(self):
        """Test that each encryption produces different ciphertext (different nonce)."""
        manager = EncryptionManager()
        plaintext = b"Same plaintext"

        encrypted1 = manager.encrypt(plaintext)
        encrypted2 = manager.encrypt(plaintext)

        # Different nonces should produce different ciphertexts
        assert encrypted1 != encrypted2

        # But both should decrypt to the same plaintext
        assert manager.decrypt(encrypted1) == plaintext
        assert manager.decrypt(encrypted2) == plaintext

    def test_decrypt_with_wrong_associated_data_fails(self):
        """Test that decryption fails with wrong associated data."""
        manager = EncryptionManager()
        plaintext = b"Secret data"

        encrypted = manager.encrypt(plaintext, associated_data=b"correct")

        # Should fail to decrypt with different associated data
        with pytest.raises(Exception):  # cryptography.exceptions.InvalidTag
            manager.decrypt(encrypted, associated_data=b"wrong")

    def test_encrypt_decrypt_dict(self):
        """Test encryption and decryption of dictionaries."""
        manager = EncryptionManager()
        data = {
            "username": "alice",
            "email": "alice@example.com",
            "age": 30
        }

        encrypted_hex = manager.encrypt_dict(data)
        assert isinstance(encrypted_hex, str)
        assert encrypted_hex != str(data)

        decrypted = manager.decrypt_dict(encrypted_hex)
        assert decrypted == data

    def test_encrypt_decrypt_string(self):
        """Test encryption and decryption of strings."""
        manager = EncryptionManager()
        plaintext = "Sensitive information"

        encrypted_hex = manager.encrypt_string(plaintext)
        assert isinstance(encrypted_hex, str)
        assert encrypted_hex != plaintext

        decrypted = manager.decrypt_string(encrypted_hex)
        assert decrypted == plaintext

    def test_derive_key_from_password(self):
        """Test PBKDF2 key derivation from password."""
        password = b"secure_password_123"
        salt = os.urandom(16)

        key, returned_salt = EncryptionManager.derive_key(password, salt)

        assert len(key) == 32  # 256 bits
        assert returned_salt == salt
        assert key != password  # Key should be different from password

    def test_derive_key_generates_salt_if_not_provided(self):
        """Test that derive_key generates salt if not provided."""
        password = b"secure_password_123"

        key, salt = EncryptionManager.derive_key(password)

        assert len(key) == 32
        assert len(salt) == 16
        assert isinstance(salt, bytes)

    def test_derive_key_same_password_same_salt(self):
        """Test that same password and salt produces same key."""
        password = b"password"
        salt = os.urandom(16)

        key1, _ = EncryptionManager.derive_key(password, salt)
        key2, _ = EncryptionManager.derive_key(password, salt)

        assert key1 == key2

    def test_derive_key_different_salts_different_keys(self):
        """Test that different salts produce different keys."""
        password = b"password"
        salt1 = os.urandom(16)
        salt2 = os.urandom(16)

        key1, _ = EncryptionManager.derive_key(password, salt1)
        key2, _ = EncryptionManager.derive_key(password, salt2)

        assert key1 != key2


class TestSecureStorage:
    """Test suite for SecureStorage class."""

    def setup_method(self):
        """Set up temporary storage directory for each test."""
        self.temp_dir = tempfile.mkdtemp()
        self.storage_path = Path(self.temp_dir) / "secure_storage"
        self.encryption_manager = EncryptionManager()
        self.storage = SecureStorage(
            storage_path=str(self.storage_path),
            encryption_manager=self.encryption_manager
        )

    def teardown_method(self):
        """Clean up temporary storage directory."""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def test_get_file_path_uses_sharding(self):
        """Test that file paths use sharding (00-99 subdirs)."""
        # Hash of key should determine shard
        file_path = self.storage._get_file_path("test_key")

        # Path should be in one of 100 shard directories
        shard_dir = file_path.parent.name
        assert shard_dir.isdigit()
        assert 0 <= int(shard_dir) <= 99

    def test_set_and_get(self):
        """Test storing and retrieving encrypted data."""
        key = "user:123"
        value = {"username": "alice", "token": "secret123"}

        self.storage.set(key, value)
        retrieved = self.storage.get(key)

        assert retrieved == value

    def test_get_nonexistent_key_returns_none(self):
        """Test that getting a nonexistent key returns None."""
        result = self.storage.get("nonexistent")
        assert result is None

    def test_delete_existing_key(self):
        """Test deleting an existing key."""
        key = "test_key"
        value = {"data": "value"}

        self.storage.set(key, value)
        assert self.storage.get(key) == value

        self.storage.delete(key)
        assert self.storage.get(key) is None

    def test_delete_nonexistent_key_does_not_raise(self):
        """Test that deleting a nonexistent key doesn't raise an error."""
        # Should not raise
        self.storage.delete("nonexistent")

    def test_list_keys(self):
        """Test listing all stored keys."""
        keys = ["key1", "key2", "key3"]

        for key in keys:
            self.storage.set(key, {"value": key})

        retrieved_keys = sorted(self.storage.list_keys())
        assert retrieved_keys == sorted(keys)

    def test_list_keys_empty_storage(self):
        """Test listing keys when storage is empty."""
        keys = self.storage.list_keys()
        assert keys == []

    def test_data_is_encrypted_on_disk(self):
        """Test that stored data is actually encrypted on disk."""
        key = "sensitive_key"
        value = {"secret": "password123"}

        self.storage.set(key, value)

        # Read the file directly - should not contain plaintext
        file_path = self.storage._get_file_path(key)
        with open(file_path, 'rb') as f:
            raw_data = f.read()

        # Should not contain plaintext "password"
        assert b"password" not in raw_data
        assert b"secret" not in raw_data


class TestSecureMetadataStore:
    """Test suite for SecureMetadataStore class."""

    def setup_method(self):
        """Set up temporary storage for each test."""
        self.temp_dir = tempfile.mkdtemp()
        self.storage_path = Path(self.temp_dir) / "metadata_store"
        self.encryption_manager = EncryptionManager()
        self.store = SecureMetadataStore(
            storage_path=str(self.storage_path),
            encryption_manager=self.encryption_manager
        )

    def teardown_method(self):
        """Clean up temporary storage."""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def test_sensitive_fields_are_defined(self):
        """Test that sensitive fields are properly defined."""
        expected_fields = {
            'api_keys', 'tokens', 'credentials', 'secrets',
            'private_keys', 'webhook_urls', 'integration_keys'
        }
        assert SecureMetadataStore.SENSITIVE_FIELDS == expected_fields

    def test_save_and_load_metadata_with_sensitive_fields(self):
        """Test saving and loading metadata with sensitive fields."""
        file_id = "file_123"
        metadata = {
            "name": "My File",
            "size": 1024,
            "api_keys": {"service_a": "key_abc123"},
            "tokens": {"access_token": "token_xyz"}
        }

        self.store.save_metadata(file_id, metadata)
        loaded = self.store.load_metadata(file_id)

        # All fields should be preserved
        assert loaded["name"] == "My File"
        assert loaded["size"] == 1024
        assert loaded["api_keys"] == {"service_a": "key_abc123"}
        assert loaded["tokens"] == {"access_token": "token_xyz"}

    def test_save_and_load_without_sensitive_fields(self):
        """Test saving metadata without any sensitive fields."""
        file_id = "file_456"
        metadata = {
            "name": "Public File",
            "size": 2048,
            "type": "image/png"
        }

        self.store.save_metadata(file_id, metadata)
        loaded = self.store.load_metadata(file_id)

        assert loaded == metadata

    def test_load_nonexistent_metadata_returns_none(self):
        """Test loading nonexistent metadata returns None."""
        result = self.store.load_metadata("nonexistent")
        assert result is None

    def test_sensitive_fields_encrypted_separately(self):
        """Test that sensitive fields are encrypted separately on disk."""
        file_id = "file_secret"
        metadata = {
            "name": "Secret File",
            "api_keys": {"key": "secret_value_123"},
            "normal_field": "public_value"
        }

        self.store.save_metadata(file_id, metadata)

        # Check that sensitive data is encrypted on disk
        sensitive_key = self.store.storage._get_file_path(f"{file_id}_sensitive")
        with open(sensitive_key, 'rb') as f:
            raw_data = f.read()

        # Should not contain the sensitive plaintext
        assert b"secret_value_123" not in raw_data

    def test_update_metadata_preserves_non_sensitive_fields(self):
        """Test that updating metadata preserves non-sensitive fields."""
        file_id = "file_update"
        initial_metadata = {
            "name": "Original Name",
            "size": 100,
            "api_keys": {"key": "original_secret"}
        }

        self.store.save_metadata(file_id, initial_metadata)

        # Update with new metadata (provide public metadata)
        updated_metadata = {
            "name": "Updated Name",
            "size": 200
        }

        # Load first to get public metadata, then update
        loaded = self.store.load_metadata(file_id)
        loaded.update(updated_metadata)
        self.store.save_metadata(file_id, loaded)

        final = self.store.load_metadata(file_id)
        assert final["name"] == "Updated Name"
        assert final["size"] == 200
        # Sensitive fields should still be there
        assert final["api_keys"] == {"key": "original_secret"}

    def test_multiple_sensitive_fields(self):
        """Test handling multiple sensitive fields at once."""
        file_id = "multi_secret"
        metadata = {
            "name": "Multi Secret File",
            "api_keys": {"service": "key123"},
            "tokens": {"access": "token456"},
            "credentials": {"user": "pass789"},
            "webhook_urls": ["https://example.com/hook"]
        }

        self.store.save_metadata(file_id, metadata)
        loaded = self.store.load_metadata(file_id)

        assert loaded == metadata
        assert loaded["api_keys"]["service"] == "key123"
        assert loaded["tokens"]["access"] == "token456"
        assert loaded["credentials"]["user"] == "pass789"
        assert loaded["webhook_urls"] == ["https://example.com/hook"]
