#!/usr/bin/env python3
"""
Tests for Infinite Map Configuration Management System.

Comprehensive test coverage for:
- ConfigValue and ConfigSchema dataclasses
- ConfigManager (get, set, watch, reload)
- Configuration sources (file, environment, runtime)
- Validation and type casting

Run with:
    PYTHONPATH=. pytest systems/pixel_compiler/tests/test_infinite_map_config.py -v
"""

import os
import sys
import json
import tempfile
import threading
import time
from pathlib import Path
from datetime import datetime
from unittest.mock import Mock, patch

import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.infinite_map_config import (
    ConfigSource,
    ConfigDataType,
    ConfigValue,
    ConfigSchema,
    ConfigManager,
    create_default_schema,
)


class TestConfigSource:
    """Tests for ConfigSource enum."""

    def test_config_sources(self):
        """Test all config sources exist."""
        assert ConfigSource.DEFAULT.value == "default"
        assert ConfigSource.FILE.value == "file"
        assert ConfigSource.ENVIRONMENT.value == "environment"
        assert ConfigSource.RUNTIME.value == "runtime"


class TestConfigDataType:
    """Tests for ConfigDataType enum."""

    def test_data_types(self):
        """Test all data types exist."""
        assert ConfigDataType.STRING.value == "string"
        assert ConfigDataType.INTEGER.value == "integer"
        assert ConfigDataType.FLOAT.value == "float"
        assert ConfigDataType.BOOLEAN.value == "boolean"
        assert ConfigDataType.LIST.value == "list"
        assert ConfigDataType.DICT.value == "dict"
        assert ConfigDataType.PATH.value == "path"


class TestConfigValue:
    """Tests for ConfigValue dataclass."""

    def test_create_config_value(self):
        """Test creating a config value."""
        value = ConfigValue(
            key="test.key",
            value=42,
            data_type=ConfigDataType.INTEGER,
            default=0,
            description="Test value"
        )
        assert value.key == "test.key"
        assert value.value == 42
        assert value.default == 0

    def test_config_value_serialization(self):
        """Test config value serialization."""
        value = ConfigValue(
            key="test",
            value="hello",
            data_type=ConfigDataType.STRING,
            default="",
            description="Test",
            source=ConfigSource.FILE
        )
        data = value.to_dict()

        assert data["key"] == "test"
        assert data["value"] == "hello"
        assert data["type"] == "string"
        assert data["source"] == "file"

    def test_secret_value_masking(self):
        """Test that secret values are masked in serialization."""
        value = ConfigValue(
            key="password",
            value="secret123",
            data_type=ConfigDataType.STRING,
            secret=True
        )
        data = value.to_dict()

        assert data["value"] == "***"

    def test_validate_required_missing(self):
        """Test validation fails for missing required value."""
        value = ConfigValue(
            key="required",
            value=None,
            data_type=ConfigDataType.STRING,
            required=True
        )
        valid, message = value.validate()

        assert valid is False
        assert "required" in message.lower()

    def test_validate_type_mismatch(self):
        """Test validation fails for type mismatch."""
        value = ConfigValue(
            key="count",
            value="not_an_int",
            data_type=ConfigDataType.INTEGER
        )
        valid, message = value.validate()

        assert valid is False
        assert "type" in message.lower()

    def test_validate_min_value(self):
        """Test validation fails for value below minimum."""
        value = ConfigValue(
            key="port",
            value=10,
            data_type=ConfigDataType.INTEGER,
            min_value=1024
        )
        valid, message = value.validate()

        assert valid is False
        assert "below minimum" in message

    def test_validate_max_value(self):
        """Test validation fails for value above maximum."""
        value = ConfigValue(
            key="rate",
            value=1000,
            data_type=ConfigDataType.INTEGER,
            max_value=100
        )
        valid, message = value.validate()

        assert valid is False
        assert "above maximum" in message

    def test_validate_choices(self):
        """Test validation fails for invalid choice."""
        value = ConfigValue(
            key="level",
            value="DEBUG",
            data_type=ConfigDataType.STRING,
            choices=["INFO", "WARNING", "ERROR"]
        )
        valid, message = value.validate()

        assert valid is False
        assert "must be one of" in message

    def test_validate_valid_value(self):
        """Test validation passes for valid value."""
        value = ConfigValue(
            key="port",
            value=8080,
            data_type=ConfigDataType.INTEGER,
            min_value=1024,
            max_value=65535
        )
        valid, message = value.validate()

        assert valid is True
        assert message == ""

    def test_cast_string(self):
        """Test casting to string."""
        value = ConfigValue(key="test", value=None, data_type=ConfigDataType.STRING)
        assert value.cast_value(123) == "123"

    def test_cast_integer(self):
        """Test casting to integer."""
        value = ConfigValue(key="test", value=None, data_type=ConfigDataType.INTEGER)
        assert value.cast_value("42") == 42

    def test_cast_float(self):
        """Test casting to float."""
        value = ConfigValue(key="test", value=None, data_type=ConfigDataType.FLOAT)
        assert value.cast_value("3.14") == 3.14

    def test_cast_boolean_from_string(self):
        """Test casting boolean from various strings."""
        value = ConfigValue(key="test", value=None, data_type=ConfigDataType.BOOLEAN)

        assert value.cast_value("true") is True
        assert value.cast_value("True") is True
        assert value.cast_value("yes") is True
        assert value.cast_value("1") is True
        assert value.cast_value("on") is True
        assert value.cast_value("false") is False
        assert value.cast_value("0") is False

    def test_cast_boolean_from_bool(self):
        """Test that boolean stays boolean."""
        value = ConfigValue(key="test", value=None, data_type=ConfigDataType.BOOLEAN)
        assert value.cast_value(True) is True
        assert value.cast_value(False) is False

    def test_cast_path(self):
        """Test casting to path."""
        value = ConfigValue(key="test", value=None, data_type=ConfigDataType.PATH)
        result = value.cast_value("/tmp/test")
        assert isinstance(result, Path)
        assert str(result) == "/tmp/test"

    def test_cast_none(self):
        """Test casting None returns None."""
        value = ConfigValue(key="test", value=None, data_type=ConfigDataType.STRING)
        assert value.cast_value(None) is None

    def test_cast_invalid_raises(self):
        """Test invalid cast raises ValueError."""
        value = ConfigValue(key="test", value=None, data_type=ConfigDataType.INTEGER)
        with pytest.raises(ValueError):
            value.cast_value("not_a_number")


class TestConfigSchema:
    """Tests for ConfigSchema class."""

    def test_create_schema(self):
        """Test creating a schema."""
        schema = ConfigSchema()
        assert len(schema.values) == 0

    def test_add_option(self):
        """Test adding an option to schema."""
        schema = ConfigSchema()
        config = schema.add(
            key="test.option",
            data_type=ConfigDataType.INTEGER,
            default=42,
            description="Test option",
            min_value=0,
            max_value=100
        )

        assert config.key == "test.option"
        assert config.default == 42
        assert "test.option" in schema.values

    def test_add_with_env_var(self):
        """Test adding option with auto-generated env var."""
        schema = ConfigSchema()
        schema.add(
            key="cache.size_mb",
            data_type=ConfigDataType.INTEGER,
            default=100
        )

        config = schema.get("cache.size_mb")
        assert config.env_var == "INFINITE_MAP_CACHE_SIZE_MB"

    def test_get_option(self):
        """Test getting an option from schema."""
        schema = ConfigSchema()
        schema.add("test", ConfigDataType.STRING)

        config = schema.get("test")
        assert config.key == "test"

    def test_get_nonexistent(self):
        """Test getting nonexistent option."""
        schema = ConfigSchema()
        assert schema.get("nonexistent") is None

    def test_validate_all(self):
        """Test validating all options."""
        schema = ConfigSchema()
        schema.add("required", ConfigDataType.STRING, required=True)
        schema.add("optional", ConfigDataType.INTEGER, default=10)

        errors = schema.validate_all({"optional": 20})

        assert len(errors) == 1
        assert errors[0][0] == "required"


class TestConfigManager:
    """Tests for ConfigManager class."""

    def test_create_manager(self):
        """Test creating a config manager."""
        manager = ConfigManager()
        assert manager.values == {}
        assert manager.sources == {}

    def test_create_manager_with_schema(self):
        """Test creating manager with schema."""
        schema = ConfigSchema()
        schema.add("test", ConfigDataType.STRING, default="hello")

        manager = ConfigManager(schema=schema)

        assert manager.get("test") == "hello"
        assert manager.sources["test"] == ConfigSource.DEFAULT

    def test_get_value(self):
        """Test getting a value."""
        schema = ConfigSchema()
        schema.add("name", ConfigDataType.STRING, default="default")

        manager = ConfigManager(schema=schema)
        value = manager.get("name")

        assert value == "default"

    def test_get_nonexistent(self):
        """Test getting nonexistent value returns default."""
        manager = ConfigManager()
        value = manager.get("nonexistent", default="fallback")

        assert value == "fallback"

    def test_get_typed(self):
        """Test getting typed value."""
        schema = ConfigSchema()
        schema.add("count", ConfigDataType.INTEGER, default=42)

        manager = ConfigManager(schema=schema)
        value = manager.get_typed("count", int)

        assert value == 42

    def test_get_typed_wrong_type(self):
        """Test typed get with wrong type raises."""
        schema = ConfigSchema()
        schema.add("name", ConfigDataType.STRING, default="hello")

        manager = ConfigManager(schema=schema)

        with pytest.raises(TypeError):
            manager.get_typed("name", int)

    def test_set_value(self):
        """Test setting a value."""
        schema = ConfigSchema()
        schema.add("count", ConfigDataType.INTEGER, default=0)

        manager = ConfigManager(schema=schema)
        success, error = manager.set("count", 100)

        assert success is True
        assert manager.get("count") == 100
        assert manager.sources["count"] == ConfigSource.RUNTIME

    def test_set_invalid_type(self):
        """Test setting value with invalid type."""
        schema = ConfigSchema()
        schema.add("count", ConfigDataType.INTEGER)

        manager = ConfigManager(schema=schema)
        success, error = manager.set("count", "not_an_int")

        assert success is False
        assert "Cannot cast" in error

    def test_set_unknown_key(self):
        """Test setting unknown key."""
        manager = ConfigManager()
        success, error = manager.set("unknown", "value")

        assert success is False
        assert "Unknown configuration key" in error

    def test_set_validates_constraints(self):
        """Test that set validates constraints."""
        schema = ConfigSchema()
        schema.add("port", ConfigDataType.INTEGER, default=8080, min_value=1024)

        manager = ConfigManager(schema=schema)
        success, error = manager.set("port", 80)

        assert success is False
        assert "below minimum" in error

    def test_set_without_validation(self):
        """Test setting value without validation."""
        schema = ConfigSchema()
        schema.add("port", ConfigDataType.INTEGER, default=8080, min_value=1024)

        manager = ConfigManager(schema=schema)
        success, error = manager.set("port", 80, validate=False)

        assert success is True
        assert manager.get("port") == 80

    def test_watch_value(self):
        """Test watching for value changes."""
        schema = ConfigSchema()
        schema.add("count", ConfigDataType.INTEGER, default=0)

        manager = ConfigManager(schema=schema)
        changes = []

        def callback(key, value):
            changes.append((key, value))

        manager.watch("count", callback)
        manager.set("count", 42)

        assert len(changes) == 1
        assert changes[0] == ("count", 42)

    def test_unwatch(self):
        """Test unwatching a value."""
        schema = ConfigSchema()
        schema.add("count", ConfigDataType.INTEGER)

        manager = ConfigManager(schema=schema)
        changes = []

        def callback(key, value):
            changes.append((key, value))

        manager.watch("count", callback)
        manager.unwatch("count", callback)
        manager.set("count", 42)

        assert len(changes) == 0

    def test_watch_multiple_callbacks(self):
        """Test multiple callbacks for same key."""
        schema = ConfigSchema()
        schema.add("value", ConfigDataType.INTEGER)

        manager = ConfigManager(schema=schema)
        changes1 = []
        changes2 = []

        manager.watch("value", lambda k, v: changes1.append((k, v)))
        manager.watch("value", lambda k, v: changes2.append((k, v)))
        manager.set("value", 100)

        assert len(changes1) == 1
        assert len(changes2) == 1

    def test_no_callback_on_same_value(self):
        """Test callback not called when value unchanged."""
        schema = ConfigSchema()
        schema.add("count", ConfigDataType.INTEGER, default=42)

        manager = ConfigManager(schema=schema)
        changes = []

        manager.watch("count", lambda k, v: changes.append((k, v)))
        manager.set("count", 42)  # Same as default

        assert len(changes) == 0


class TestConfigManagerFileLoading:
    """Tests for ConfigManager file loading."""

    def test_load_yaml_file(self):
        """Test loading from YAML file."""
        schema = ConfigSchema()
        schema.add("name", ConfigDataType.STRING)
        schema.add("count", ConfigDataType.INTEGER)

        with tempfile.TemporaryDirectory() as d:
            config_path = Path(d) / "config.yaml"
            config_path.write_text("name: test\ncount: 42\n")

            manager = ConfigManager(config_path=str(config_path), schema=schema)

            assert manager.get("name") == "test"
            assert manager.get("count") == 42
            assert manager.sources["name"] == ConfigSource.FILE

    def test_load_json_file(self):
        """Test loading from JSON file."""
        schema = ConfigSchema()
        schema.add("name", ConfigDataType.STRING)
        schema.add("count", ConfigDataType.INTEGER)

        with tempfile.TemporaryDirectory() as d:
            config_path = Path(d) / "config.json"
            config_path.write_text('{"name": "test", "count": 42}')

            manager = ConfigManager(config_path=str(config_path), schema=schema)

            assert manager.get("name") == "test"
            assert manager.get("count") == 42

    def test_load_nested_config(self):
        """Test loading nested config with dot notation."""
        schema = ConfigSchema()
        schema.add("cache.size", ConfigDataType.INTEGER)
        schema.add("cache.ttl", ConfigDataType.INTEGER)

        with tempfile.TemporaryDirectory() as d:
            config_path = Path(d) / "config.yaml"
            config_path.write_text("cache:\n  size: 100\n  ttl: 3600\n")

            manager = ConfigManager(config_path=str(config_path), schema=schema)

            assert manager.get("cache.size") == 100
            assert manager.get("cache.ttl") == 3600

    def test_load_nonexistent_file(self):
        """Test loading nonexistent file doesn't error."""
        schema = ConfigSchema()
        schema.add("test", ConfigDataType.STRING, default="default")

        manager = ConfigManager(config_path="/nonexistent/config.yaml", schema=schema)

        assert manager.get("test") == "default"

    def test_reload_config(self):
        """Test reloading config from file."""
        schema = ConfigSchema()
        schema.add("value", ConfigDataType.STRING)

        with tempfile.TemporaryDirectory() as d:
            config_path = Path(d) / "config.yaml"
            config_path.write_text("value: first\n")

            manager = ConfigManager(config_path=str(config_path), schema=schema)
            assert manager.get("value") == "first"

            config_path.write_text("value: second\n")
            manager.reload()

            assert manager.get("value") == "second"


class TestConfigManagerEnvironment:
    """Tests for ConfigManager environment variable loading."""

    def test_load_from_environment(self):
        """Test loading from environment variable."""
        schema = ConfigSchema()
        schema.add("test_value", ConfigDataType.STRING, env_var="TEST_CONFIG_VALUE")

        with patch.dict(os.environ, {"TEST_CONFIG_VALUE": "from_env"}):
            manager = ConfigManager(schema=schema)

            assert manager.get("test_value") == "from_env"
            assert manager.sources["test_value"] == ConfigSource.ENVIRONMENT

    def test_env_overrides_file(self):
        """Test environment variable overrides file."""
        schema = ConfigSchema()
        schema.add("value", ConfigDataType.STRING)

        with tempfile.TemporaryDirectory() as d:
            config_path = Path(d) / "config.yaml"
            config_path.write_text("value: from_file\n")

            with patch.dict(os.environ, {"INFINITE_MAP_VALUE": "from_env"}):
                manager = ConfigManager(config_path=str(config_path), schema=schema)

                assert manager.get("value") == "from_env"
                assert manager.sources["value"] == ConfigSource.ENVIRONMENT

    def test_runtime_overrides_all(self):
        """Test runtime value overrides all sources."""
        schema = ConfigSchema()
        schema.add("value", ConfigDataType.STRING, env_var="TEST_RUNTIME_VALUE")

        with patch.dict(os.environ, {"TEST_RUNTIME_VALUE": "from_env"}):
            manager = ConfigManager(schema=schema)
            manager.set("value", "from_runtime")

            assert manager.get("value") == "from_runtime"
            assert manager.sources["value"] == ConfigSource.RUNTIME


class TestConfigManagerSave:
    """Tests for ConfigManager save functionality."""

    def test_save_yaml(self):
        """Test saving to YAML file."""
        schema = ConfigSchema()
        schema.add("name", ConfigDataType.STRING)
        schema.add("count", ConfigDataType.INTEGER)

        with tempfile.TemporaryDirectory() as d:
            config_path = Path(d) / "config.yaml"

            manager = ConfigManager(schema=schema)
            manager.set("name", "test")
            manager.set("count", 42)
            manager.save(str(config_path))

            content = config_path.read_text()
            assert "name: test" in content
            assert "count: 42" in content

    def test_save_json(self):
        """Test saving to JSON file."""
        schema = ConfigSchema()
        schema.add("name", ConfigDataType.STRING)
        schema.add("count", ConfigDataType.INTEGER)

        with tempfile.TemporaryDirectory() as d:
            config_path = Path(d) / "config.json"

            manager = ConfigManager(schema=schema)
            manager.set("name", "test")
            manager.set("count", 42)
            manager.save(str(config_path))

            with open(config_path) as f:
                data = json.load(f)

            assert data["name"] == "test"
            assert data["count"] == 42

    def test_save_nested(self):
        """Test saving nested configuration."""
        schema = ConfigSchema()
        schema.add("cache.size", ConfigDataType.INTEGER)
        schema.add("cache.ttl", ConfigDataType.INTEGER)

        with tempfile.TemporaryDirectory() as d:
            config_path = Path(d) / "config.yaml"

            manager = ConfigManager(schema=schema)
            manager.set("cache.size", 100)
            manager.set("cache.ttl", 3600)
            manager.save(str(config_path))

            content = config_path.read_text()
            assert "cache:" in content


class TestConfigManagerUtilities:
    """Tests for ConfigManager utility methods."""

    def test_validate(self):
        """Test validate method."""
        schema = ConfigSchema()
        schema.add("required", ConfigDataType.STRING, required=True)

        manager = ConfigManager(schema=schema)
        errors = manager.validate()

        assert len(errors) == 1

    def test_get_all(self):
        """Test getting all values."""
        schema = ConfigSchema()
        schema.add("a", ConfigDataType.INTEGER, default=1)
        schema.add("b", ConfigDataType.STRING, default="test")

        manager = ConfigManager(schema=schema)
        all_values = manager.get_all()

        assert all_values["a"] == 1
        assert all_values["b"] == "test"

    def test_get_sources(self):
        """Test getting all sources."""
        schema = ConfigSchema()
        schema.add("a", ConfigDataType.INTEGER, default=1)

        manager = ConfigManager(schema=schema)
        manager.set("a", 2)

        sources = manager.get_sources()
        assert sources["a"] == ConfigSource.RUNTIME

    def test_get_schema_info(self):
        """Test getting schema info."""
        schema = ConfigSchema()
        schema.add("test", ConfigDataType.STRING, description="Test option")

        manager = ConfigManager(schema=schema)
        info = manager.get_schema_info()

        assert "test" in info
        assert info["test"]["description"] == "Test option"

    def test_reset_single(self):
        """Test resetting single value."""
        schema = ConfigSchema()
        schema.add("count", ConfigDataType.INTEGER, default=10)

        manager = ConfigManager(schema=schema)
        manager.set("count", 100)
        manager.reset("count")

        assert manager.get("count") == 10
        assert manager.sources["count"] == ConfigSource.DEFAULT

    def test_reset_all(self):
        """Test resetting all values."""
        schema = ConfigSchema()
        schema.add("a", ConfigDataType.INTEGER, default=1)
        schema.add("b", ConfigDataType.STRING, default="default")

        manager = ConfigManager(schema=schema)
        manager.set("a", 100)
        manager.set("b", "changed")
        manager.reset()

        assert manager.get("a") == 1
        assert manager.get("b") == "default"

    def test_export_env_vars(self):
        """Test exporting as environment variables."""
        schema = ConfigSchema()
        schema.add("cache.size", ConfigDataType.INTEGER, default=100)

        manager = ConfigManager(schema=schema)
        export = manager.export_env_vars()

        assert "INFINITE_MAP_CACHE_SIZE=100" in export


class TestDefaultSchema:
    """Tests for default schema creation."""

    def test_create_default_schema(self):
        """Test creating default schema."""
        schema = create_default_schema()

        # Check some key settings exist
        assert schema.get("cache.enabled") is not None
        assert schema.get("cache.size_mb") is not None
        assert schema.get("wal.enabled") is not None
        assert schema.get("logging.level") is not None

    def test_default_schema_types(self):
        """Test default schema has correct types."""
        schema = create_default_schema()

        cache_enabled = schema.get("cache.enabled")
        assert cache_enabled.data_type == ConfigDataType.BOOLEAN

        cache_size = schema.get("cache.size_mb")
        assert cache_size.data_type == ConfigDataType.INTEGER
        assert cache_size.min_value == 1

        log_level = schema.get("logging.level")
        assert log_level.choices is not None
        assert "DEBUG" in log_level.choices


class TestThreadSafety:
    """Tests for thread safety."""

    def test_concurrent_reads(self):
        """Test concurrent reads are safe."""
        schema = ConfigSchema()
        schema.add("value", ConfigDataType.INTEGER, default=0)

        manager = ConfigManager(schema=schema)
        errors = []

        def read_values():
            try:
                for _ in range(100):
                    manager.get("value")
            except Exception as e:
                errors.append(e)

        threads = [threading.Thread(target=read_values) for _ in range(5)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0

    def test_concurrent_writes(self):
        """Test concurrent writes are safe."""
        schema = ConfigSchema()
        schema.add("value", ConfigDataType.INTEGER, default=0)

        manager = ConfigManager(schema=schema)
        errors = []

        def write_values(start):
            try:
                for i in range(100):
                    manager.set("value", start + i)
            except Exception as e:
                errors.append(e)

        threads = [threading.Thread(target=write_values, args=(i * 100,)) for i in range(5)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0


class TestIntegration:
    """Integration tests for the configuration system."""

    def test_full_workflow(self):
        """Test complete configuration workflow."""
        schema = ConfigSchema()
        schema.add("app.name", ConfigDataType.STRING, required=True)
        schema.add("app.debug", ConfigDataType.BOOLEAN, default=False)
        schema.add("cache.size_mb", ConfigDataType.INTEGER, default=100, min_value=1, max_value=1024)
        schema.add("cache.ttl_seconds", ConfigDataType.INTEGER, default=3600)

        with tempfile.TemporaryDirectory() as d:
            config_path = Path(d) / "config.yaml"

            # Create manager
            manager = ConfigManager(config_path=str(config_path), schema=schema)

            # Set values
            manager.set("app.name", "TestApp")
            manager.set("cache.size_mb", 256)

            # Validate
            errors = manager.validate()
            assert len(errors) == 0

            # Save
            manager.save()

            # Verify file was written
            assert config_path.exists()

            # Create new manager to reload
            manager2 = ConfigManager(config_path=str(config_path), schema=schema)
            assert manager2.get("app.name") == "TestApp"
            assert manager2.get("cache.size_mb") == 256


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
