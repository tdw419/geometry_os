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


# =============================================================================
# Phase 11 Security Encryption Tests
# =============================================================================

import json
from datetime import datetime, timedelta
from unittest.mock import patch, MagicMock

from systems.pixel_compiler.security.encryption import (
    EncryptionConfig, EncryptedData, Encryptor, KeyManager,
    EncryptionError, DecryptionError,
    encrypt_data, decrypt_data, generate_key
)
from systems.pixel_compiler.security.key_manager import (
    KeyInfo, KeyStorageConfig, KeyStorage, KeyRotator,
    create_default_key_manager
)


class TestPhase11EncryptionConfig:
    """Test EncryptionConfig dataclass"""

    def test_default_config(self):
        """Test default configuration values"""
        config = EncryptionConfig()
        assert config.algorithm == "AES-256-GCM"
        assert config.key_size == 32
        assert config.iv_size == 12
        assert config.tag_size == 16
        assert config.kdf_iterations == 100000

    def test_custom_config(self):
        """Test custom configuration values"""
        config = EncryptionConfig(
            algorithm="CUSTOM",
            key_size=64,
            iv_size=16
        )
        assert config.algorithm == "CUSTOM"
        assert config.key_size == 64
        assert config.iv_size == 16


class TestPhase11EncryptedData:
    """Test EncryptedData container"""

    def test_create_encrypted_data(self):
        """Test creating EncryptedData"""
        data = EncryptedData(
            iv=b'\x00' * 12,
            ciphertext=b'encrypted content',
            tag=b'\x01' * 16
        )
        assert data.iv == b'\x00' * 12
        assert data.ciphertext == b'encrypted content'
        assert data.tag == b'\x01' * 16
        assert data.version == 1

    def test_serialization(self):
        """Test to_bytes and from_bytes"""
        original = EncryptedData(
            iv=b'\x02' * 12,
            ciphertext=b'secret data here',
            tag=b'\x03' * 16,
            version=2
        )

        serialized = original.to_bytes()
        assert isinstance(serialized, bytes)
        assert len(serialized) > len(original.ciphertext)

        restored = EncryptedData.from_bytes(serialized)
        assert restored.iv == original.iv
        assert restored.ciphertext == original.ciphertext
        assert restored.tag == original.tag
        assert restored.version == original.version

    def test_len(self):
        """Test __len__ method"""
        data = EncryptedData(
            iv=b'\x00' * 12,
            ciphertext=b'test',
            tag=b'\x00' * 16
        )
        assert len(data) == len(data.to_bytes())


class TestPhase11Encryptor:
    """Test Encryptor class"""

    def test_initialization(self):
        """Test encryptor initialization"""
        encryptor = Encryptor()
        assert encryptor.config is not None

        config = EncryptionConfig(key_size=64)
        encryptor2 = Encryptor(config)
        assert encryptor2.config.key_size == 64

    def test_generate_key(self):
        """Test key generation"""
        encryptor = Encryptor()
        key = encryptor.generate_key()
        assert len(key) == 32
        assert isinstance(key, bytes)

        # Keys should be unique
        key2 = encryptor.generate_key()
        assert key != key2

    def test_encrypt_decrypt_roundtrip(self):
        """Test encrypt and decrypt roundtrip"""
        encryptor = Encryptor()
        key = encryptor.generate_key()
        plaintext = b"Hello, World! This is a test message."

        encrypted = encryptor.encrypt(plaintext, key)
        assert isinstance(encrypted, EncryptedData)
        assert encrypted.ciphertext != plaintext
        assert len(encrypted.iv) == 12
        assert len(encrypted.tag) == 16

        decrypted = encryptor.decrypt(encrypted, key)
        assert decrypted == plaintext

    def test_encrypt_empty_data(self):
        """Test encrypting empty data"""
        encryptor = Encryptor()
        key = encryptor.generate_key()

        encrypted = encryptor.encrypt(b'', key)
        decrypted = encryptor.decrypt(encrypted, key)
        assert decrypted == b''

    def test_encrypt_large_data(self):
        """Test encrypting large data"""
        encryptor = Encryptor()
        key = encryptor.generate_key()
        plaintext = os.urandom(1024 * 1024)  # 1MB

        encrypted = encryptor.encrypt(plaintext, key)
        decrypted = encryptor.decrypt(encrypted, key)
        assert decrypted == plaintext

    def test_encrypt_unicode_data(self):
        """Test encrypting unicode data"""
        encryptor = Encryptor()
        key = encryptor.generate_key()
        plaintext = "Hello 世界! 🌍".encode('utf-8')

        encrypted = encryptor.encrypt(plaintext, key)
        decrypted = encryptor.decrypt(encrypted, key)
        assert decrypted == plaintext

    def test_encrypt_wrong_key(self):
        """Test decrypting with wrong key"""
        encryptor = Encryptor()
        key1 = encryptor.generate_key()
        key2 = encryptor.generate_key()
        plaintext = b"Secret message"

        encrypted = encryptor.encrypt(plaintext, key1)

        # Should raise an exception (DecryptionError or cryptography InvalidTag)
        with pytest.raises(Exception):
            encryptor.decrypt(encrypted, key2)

    def test_encrypt_invalid_key_size(self):
        """Test encryption with invalid key size"""
        encryptor = Encryptor()

        with pytest.raises(EncryptionError):
            encryptor.encrypt(b"test", b"short")

    def test_encrypt_non_bytes(self):
        """Test encryption with non-bytes input"""
        encryptor = Encryptor()
        key = encryptor.generate_key()

        with pytest.raises(EncryptionError):
            encryptor.encrypt("string not bytes", key)

    def test_derive_key(self):
        """Test key derivation"""
        encryptor = Encryptor()
        master_key = encryptor.generate_key()

        derived1 = encryptor.derive_key(master_key, "file1.txt")
        derived2 = encryptor.derive_key(master_key, "file2.txt")

        assert len(derived1) == 32
        assert len(derived2) == 32
        assert derived1 != derived2  # Different context = different key

    def test_derive_key_deterministic(self):
        """Test that key derivation is deterministic"""
        encryptor = Encryptor()
        master_key = encryptor.generate_key()
        salt = b'\x00' * 16

        derived1 = encryptor.derive_key(master_key, "test", salt=salt)
        derived2 = encryptor.derive_key(master_key, "test", salt=salt)

        assert derived1 == derived2

    def test_get_file_key(self):
        """Test file key caching"""
        encryptor = Encryptor()
        master_key = encryptor.generate_key()

        key1 = encryptor.get_file_key("file.txt", master_key)
        key2 = encryptor.get_file_key("file.txt", master_key)

        assert key1 == key2  # Should be cached
        assert len(encryptor._file_keys) == 1

    def test_clear_file_key(self):
        """Test clearing file key cache"""
        encryptor = Encryptor()
        master_key = encryptor.generate_key()

        encryptor.get_file_key("file.txt", master_key)
        assert len(encryptor._file_keys) == 1

        encryptor.clear_file_key("file.txt")
        assert len(encryptor._file_keys) == 0

    def test_clear_all_keys(self):
        """Test clearing all cached keys"""
        encryptor = Encryptor()
        master_key = encryptor.generate_key()

        encryptor.get_file_key("file1.txt", master_key)
        encryptor.get_file_key("file2.txt", master_key)
        assert len(encryptor._file_keys) == 2

        encryptor.clear_all_keys()
        assert len(encryptor._file_keys) == 0


class TestPhase11EncryptorFileOperations:
    """Test file encryption operations"""

    def setup_method(self):
        """Setup temp directory"""
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Cleanup temp directory"""
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_encrypt_file(self):
        """Test encrypting a file"""
        encryptor = Encryptor()
        key = encryptor.generate_key()

        # Create test file
        test_file = Path(self.temp_dir) / "test.txt"
        test_file.write_bytes(b"File content to encrypt")

        encrypted = encryptor.encrypt_file(test_file, key)
        assert encrypted.ciphertext != b"File content to encrypt"

        decrypted = encryptor.decrypt(encrypted, key)
        assert decrypted == b"File content to encrypt"

    def test_encrypt_file_not_found(self):
        """Test encrypting non-existent file"""
        encryptor = Encryptor()
        key = encryptor.generate_key()

        with pytest.raises(EncryptionError):
            encryptor.encrypt_file(Path("/nonexistent/file.txt"), key)

    def test_encrypt_to_file(self):
        """Test encrypting to file"""
        encryptor = Encryptor()
        key = encryptor.generate_key()

        output_file = Path(self.temp_dir) / "encrypted.bin"
        encryptor.encrypt_to_file(b"Secret data", output_file, key)

        assert output_file.exists()
        assert output_file.read_bytes() != b"Secret data"

    def test_decrypt_from_file(self):
        """Test decrypting from file"""
        encryptor = Encryptor()
        key = encryptor.generate_key()

        output_file = Path(self.temp_dir) / "encrypted.bin"
        encryptor.encrypt_to_file(b"Secret data", output_file, key)

        decrypted = encryptor.decrypt_from_file(output_file, key)
        assert decrypted == b"Secret data"

    def test_decrypt_file_not_found(self):
        """Test decrypting non-existent file"""
        encryptor = Encryptor()
        key = encryptor.generate_key()

        with pytest.raises(DecryptionError):
            encryptor.decrypt_file(Path("/nonexistent/file.bin"), key)


class TestPhase11KeyManager:
    """Test KeyManager class"""

    def test_initialization(self):
        """Test key manager initialization"""
        km = KeyManager()
        assert km.master_key is None

        key = os.urandom(32)
        km2 = KeyManager(master_key=key)
        assert km2.master_key == key

    def test_generate_master_key(self):
        """Test master key generation"""
        km = KeyManager()
        key = km.generate_master_key()
        assert len(key) == 32

        key2 = km.generate_master_key()
        assert key != key2

    def test_set_master_key(self):
        """Test setting master key"""
        km = KeyManager()
        key = os.urandom(32)
        km.set_master_key(key)
        assert km.master_key == key

    def test_set_master_key_invalid_size(self):
        """Test setting invalid master key"""
        km = KeyManager()

        with pytest.raises(EncryptionError):
            km.set_master_key(b"short")

    def test_derive_file_key(self):
        """Test deriving file key"""
        km = KeyManager()
        km.set_master_key(os.urandom(32))

        key1 = km.derive_file_key("file1.txt")
        key2 = km.derive_file_key("file2.txt")

        assert len(key1) == 32
        assert len(key2) == 32
        assert key1 != key2

    def test_derive_file_key_no_master(self):
        """Test deriving file key without master key"""
        km = KeyManager()

        with pytest.raises(EncryptionError):
            km.derive_file_key("file.txt")

    def test_rotate_master_key(self):
        """Test master key rotation"""
        km = KeyManager()
        km.set_master_key(os.urandom(32))
        old_version = km.key_version

        new_key = os.urandom(32)
        new_version, rekey_info = km.rotate_master_key(new_key)

        assert new_version == old_version + 1
        assert km.key_version == new_version
        assert km.master_key == new_key
        assert 'old_version' in rekey_info
        assert 'new_version' in rekey_info

    def test_export_import_key(self):
        """Test exporting and importing master key"""
        km = KeyManager()
        original_key = os.urandom(32)
        km.set_master_key(original_key)

        exported = km.export_key("password123")
        assert isinstance(exported, bytes)
        assert len(exported) > 32

        km2 = KeyManager()
        km2.import_key(exported, "password123")
        assert km2.master_key == original_key

    def test_verify_key(self):
        """Test key verification"""
        km = KeyManager()
        assert not km.verify_key()  # No master key

        km.set_master_key(os.urandom(32))
        assert km.verify_key()


class TestPhase11KeyInfo:
    """Test KeyInfo dataclass"""

    def test_create_key_info(self):
        """Test creating KeyInfo"""
        info = KeyInfo(
            key_id="test-key",
            version=1,
            created_at=datetime.now()
        )
        assert info.key_id == "test-key"
        assert info.version == 1
        assert info.expires_at is None

    def test_key_info_with_expiry(self):
        """Test KeyInfo with expiry"""
        info = KeyInfo(
            key_id="test-key",
            version=1,
            created_at=datetime.now(),
            expires_at=datetime.now() + timedelta(days=30)
        )
        assert info.expires_at is not None

    def test_serialization(self):
        """Test KeyInfo serialization"""
        original = KeyInfo(
            key_id="test",
            version=2,
            created_at=datetime.now(),
            rotation_count=3,
            metadata={'owner': 'test-user'}
        )

        data = original.to_dict()
        restored = KeyInfo.from_dict(data)

        assert restored.key_id == original.key_id
        assert restored.version == original.version
        assert restored.rotation_count == original.rotation_count
        assert restored.metadata == original.metadata


class TestPhase11KeyStorage:
    """Test KeyStorage class"""

    def setup_method(self):
        """Setup temp directory"""
        self.temp_dir = tempfile.mkdtemp()
        self.config = KeyStorageConfig(storage_path=Path(self.temp_dir))

    def teardown_method(self):
        """Cleanup temp directory"""
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_initialization(self):
        """Test storage initialization"""
        storage = KeyStorage(self.config)
        assert storage.config.storage_path == self.config.storage_path

    def test_store_key(self):
        """Test storing a key"""
        storage = KeyStorage(self.config)
        key = os.urandom(32)

        info = storage.store_key("test-key", key)
        assert info.key_id == "test-key"
        assert info.version == 1

        # Check files exist
        key_file = self.config.storage_path / "test-key.key"
        meta_file = self.config.storage_path / "test-key.meta"
        assert key_file.exists()
        assert meta_file.exists()

    def test_retrieve_key(self):
        """Test retrieving a key"""
        storage = KeyStorage(self.config)
        original_key = os.urandom(32)
        storage.store_key("test-key", original_key)

        retrieved = storage.retrieve_key("test-key")
        assert retrieved == original_key

    def test_delete_key(self):
        """Test deleting a key"""
        storage = KeyStorage(self.config)
        storage.store_key("test-key", os.urandom(32))

        result = storage.delete_key("test-key")
        assert result is True

        key_file = self.config.storage_path / "test-key.key"
        assert not key_file.exists()

    def test_list_keys(self):
        """Test listing stored keys"""
        storage = KeyStorage(self.config)
        storage.store_key("key1", os.urandom(32))
        storage.store_key("key2", os.urandom(32))

        keys = storage.list_keys()
        assert len(keys) == 2
        key_ids = [k.key_id for k in keys]
        assert "key1" in key_ids
        assert "key2" in key_ids


class TestPhase11ConvenienceFunctions:
    """Test convenience functions"""

    def test_encrypt_data_function(self):
        """Test encrypt_data function"""
        key = generate_key()
        encrypted = encrypt_data(b"test data", key)

        assert isinstance(encrypted, EncryptedData)
        assert encrypted.ciphertext != b"test data"

    def test_decrypt_data_function(self):
        """Test decrypt_data function"""
        key = generate_key()
        encrypted = encrypt_data(b"test data", key)

        decrypted = decrypt_data(encrypted, key)
        assert decrypted == b"test data"

    def test_generate_key_function(self):
        """Test generate_key function"""
        key = generate_key()
        assert len(key) == 32

        key2 = generate_key()
        assert key != key2


class TestPhase11EdgeCases:
    """Test edge cases and error handling"""

    def test_multiple_encryptions_different_ivs(self):
        """Test that multiple encryptions produce different ciphertexts"""
        encryptor = Encryptor()
        key = encryptor.generate_key()
        plaintext = b"same message"

        encrypted1 = encryptor.encrypt(plaintext, key)
        encrypted2 = encryptor.encrypt(plaintext, key)

        assert encrypted1.iv != encrypted2.iv
        assert encrypted1.ciphertext != encrypted2.ciphertext

    def test_corrupted_ciphertext(self):
        """Test decryption with corrupted ciphertext"""
        encryptor = Encryptor()
        key = encryptor.generate_key()

        encrypted = encryptor.encrypt(b"test", key)
        corrupted = EncryptedData(
            iv=encrypted.iv,
            ciphertext=b'corrupted' + encrypted.ciphertext,
            tag=encrypted.tag
        )

        # Should raise an exception (DecryptionError or cryptography InvalidTag)
        with pytest.raises(Exception):
            encryptor.decrypt(corrupted, key)

    def test_corrupted_tag(self):
        """Test decryption with corrupted tag"""
        encryptor = Encryptor()
        key = encryptor.generate_key()

        encrypted = encryptor.encrypt(b"test", key)
        corrupted = EncryptedData(
            iv=encrypted.iv,
            ciphertext=encrypted.ciphertext,
            tag=b'\x00' * 16
        )

        # Should raise an exception (DecryptionError or cryptography InvalidTag)
        with pytest.raises(Exception):
            encryptor.decrypt(corrupted, key)
