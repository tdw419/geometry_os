"""
Tests for Backend Interface - TDD style.

Tests written BEFORE implementation following red-green-refactor cycle.
"""

import pytest
from abc import ABC, abstractmethod

from systems.ai_gui.backends.base import (
    BaseBackend,
    InputEvent,
    InputEventType,
    AppConfig,
)


class TestInputEvent:
    """Tests for InputEvent dataclass."""

    def test_create_key_event(self):
        """Should create a key input event."""
        event = InputEvent(
            type=InputEventType.KEY,
            keys="Ctrl+S"
        )

        assert event.type == InputEventType.KEY
        assert event.keys == "Ctrl+S"

    def test_create_mouse_event(self):
        """Should create a mouse input event."""
        event = InputEvent(
            type=InputEventType.MOUSE,
            x=100,
            y=200,
            button=1
        )

        assert event.type == InputEventType.MOUSE
        assert event.x == 100
        assert event.y == 200
        assert event.button == 1

    def test_create_text_event(self):
        """Should create a text input event."""
        event = InputEvent(
            type=InputEventType.TEXT,
            text="Hello World"
        )

        assert event.type == InputEventType.TEXT
        assert event.text == "Hello World"

    def test_modifiers_default_empty(self):
        """Modifiers should default to empty list."""
        event = InputEvent(type=InputEventType.KEY, keys="A")

        assert event.modifiers == []

    def test_modifiers_can_be_set(self):
        """Modifiers should be settable."""
        event = InputEvent(
            type=InputEventType.KEY,
            keys="S",
            modifiers=["ctrl", "shift"]
        )

        assert event.modifiers == ["ctrl", "shift"]


class TestAppConfig:
    """Tests for AppConfig dataclass."""

    def test_minimal_config(self):
        """Should create config with just app name."""
        config = AppConfig(app="gedit")

        assert config.app == "gedit"
        assert config.backend == "auto"
        assert config.location is None
        assert config.width == 800
        assert config.height == 600

    def test_full_config(self):
        """Should create config with all options."""
        config = AppConfig(
            app="gedit",
            backend="vnc",
            location=(1000, 2000),
            width=1024,
            height=768,
            env={"DISPLAY": ":0"},
            args=["--new-window"]
        )

        assert config.app == "gedit"
        assert config.backend == "vnc"
        assert config.location == (1000, 2000)
        assert config.width == 1024
        assert config.height == 768
        assert config.env == {"DISPLAY": ":0"}
        assert config.args == ["--new-window"]

    def test_defaults_are_mutable(self):
        """Each config should have its own env/args."""
        config1 = AppConfig(app="a")
        config1.env["KEY"] = "value"

        config2 = AppConfig(app="b")

        assert "KEY" not in config2.env


class TestBaseBackend:
    """Tests for BaseBackend abstract class."""

    def test_is_abstract(self):
        """BaseBackend should be abstract."""
        assert issubclass(BaseBackend, ABC)

    def test_cannot_instantiate_directly(self):
        """Cannot instantiate BaseBackend directly."""
        with pytest.raises(TypeError):
            BaseBackend()

    def test_subclass_must_implement_all_methods(self):
        """Subclass must implement all abstract methods."""

        class IncompleteBackend(BaseBackend):
            async def spawn(self, config):
                pass

        with pytest.raises(TypeError):
            IncompleteBackend()

    def test_complete_subclass_can_be_instantiated(self):
        """Complete subclass should work."""

        class CompleteBackend(BaseBackend):
            async def spawn(self, config: AppConfig):
                from systems.ai_gui.tile_app_manager import Tile, TileState
                return Tile(id="test", app=config.app, backend="test", location=(0,0))

            async def send_input(self, tile_id: str, event: InputEvent):
                return True

            async def capture_frame(self, tile_id: str):
                return b"fake_png_data"

            async def terminate(self, tile_id: str):
                return True

            async def health_check(self, tile_id: str):
                return True

        backend = CompleteBackend()
        assert backend is not None


class ConcreteBackendForTesting(BaseBackend):
    """A concrete backend implementation for testing."""

    async def spawn(self, config: AppConfig):
        from systems.ai_gui.tile_app_manager import Tile, TileState
        return Tile(
            id="test_tile",
            app=config.app,
            backend=config.backend,
            location=config.location or (0, 0)
        )

    async def send_input(self, tile_id: str, event: InputEvent):
        return True

    async def capture_frame(self, tile_id: str):
        return b"\x89PNG\r\n\x1a\n"  # PNG magic bytes

    async def terminate(self, tile_id: str):
        return True

    async def health_check(self, tile_id: str):
        return tile_id == "test_tile"


class TestConcreteBackend:
    """Tests using a concrete backend implementation."""

    @pytest.fixture
    def backend(self):
        return ConcreteBackendForTesting()

    @pytest.mark.asyncio
    async def test_spawn_returns_tile(self, backend):
        """spawn() should return a Tile."""
        config = AppConfig(app="test", backend="test", location=(100, 200))

        tile = await backend.spawn(config)

        assert tile is not None
        assert tile.app == "test"
        assert tile.location == (100, 200)

    @pytest.mark.asyncio
    async def test_send_input_returns_bool(self, backend):
        """send_input() should return bool."""
        event = InputEvent(type=InputEventType.KEY, keys="A")

        result = await backend.send_input("test_tile", event)

        assert result is True

    @pytest.mark.asyncio
    async def test_capture_frame_returns_bytes(self, backend):
        """capture_frame() should return bytes."""
        result = await backend.capture_frame("test_tile")

        assert isinstance(result, bytes)
        assert result.startswith(b"\x89PNG")  # PNG header

    @pytest.mark.asyncio
    async def test_terminate_returns_bool(self, backend):
        """terminate() should return bool."""
        result = await backend.terminate("test_tile")

        assert result is True

    @pytest.mark.asyncio
    async def test_health_check_returns_bool(self, backend):
        """health_check() should return bool."""
        result = await backend.health_check("test_tile")

        assert result is True

        result = await backend.health_check("nonexistent")
        assert result is False
