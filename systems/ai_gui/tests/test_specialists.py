"""
Tests for Toolkit Specialists - TDD style.

Tests written BEFORE implementation following red-green-refactor cycle.
Specialists provide semantic access to GUI toolkits (GTK, Qt, Electron).
"""

import pytest
from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Optional
from unittest.mock import MagicMock, AsyncMock, patch


class TestSpecialistDataStructures:
    """Tests for specialist data structures."""

    def test_widget_has_role_and_label(self):
        """Widget should have role and label attributes."""
        from systems.ai_gui.specialists.base import Widget

        widget = Widget(
            id="button1",
            role="push_button",
            label="Save",
            path="/window/box/button[0]"
        )

        assert widget.role == "push_button"
        assert widget.label == "Save"
        assert widget.path == "/window/box/button[0]"

    def test_widget_has_children(self):
        """Widget should support children for tree structure."""
        from systems.ai_gui.specialists.base import Widget

        child = Widget(id="label1", role="label", label="Hello", path="/win/label")
        parent = Widget(
            id="box1",
            role="box",
            label="",
            path="/win/box",
            children=[child]
        )

        assert len(parent.children) == 1
        assert parent.children[0].id == "label1"

    def test_widget_has_bounds(self):
        """Widget should have optional screen bounds."""
        from systems.ai_gui.specialists.base import Widget

        widget = Widget(
            id="button1",
            role="push_button",
            label="Save",
            path="/win/button",
            bounds=(100, 200, 50, 30)  # x, y, width, height
        )

        assert widget.bounds == (100, 200, 50, 30)

    def test_shortcut_has_keys_and_action(self):
        """Shortcut should have key combination and action."""
        from systems.ai_gui.specialists.base import Shortcut

        shortcut = Shortcut(
            id="save",
            keys="Ctrl+S",
            action="Save",
            category="file",
            description="Save the current document"
        )

        assert shortcut.keys == "Ctrl+S"
        assert shortcut.action == "Save"
        assert shortcut.category == "file"

    def test_shortcut_has_source(self):
        """Shortcut should track its source."""
        from systems.ai_gui.specialists.base import Shortcut

        built_in = Shortcut(
            id="copy",
            keys="Ctrl+C",
            action="Copy",
            category="edit",
            source="built-in"
        )

        discovered = Shortcut(
            id="custom",
            keys="Ctrl+Shift+T",
            action="Transform",
            category="custom",
            source="discovered"
        )

        assert built_in.source == "built-in"
        assert discovered.source == "discovered"

    def test_capabilities_structure(self):
        """Capabilities should aggregate specialist findings."""
        from systems.ai_gui.specialists.base import Capabilities

        caps = Capabilities(
            toolkit="gtk",
            app_name="gedit",
            version="3.38",
            widgets=["window", "box", "button", "entry"],
            shortcuts=["Ctrl+S", "Ctrl+O", "Ctrl+Q"],
            custom_actions=["format_code", "spell_check"]
        )

        assert caps.toolkit == "gtk"
        assert len(caps.shortcuts) == 3


class TestBaseSpecialist:
    """Tests for BaseSpecialist abstract class."""

    def test_is_abstract(self):
        """BaseSpecialist should be abstract."""
        from systems.ai_gui.specialists.base import BaseSpecialist

        assert issubclass(BaseSpecialist, ABC)

    def test_cannot_instantiate_directly(self):
        """Cannot instantiate BaseSpecialist directly."""
        from systems.ai_gui.specialists.base import BaseSpecialist

        with pytest.raises(TypeError):
            BaseSpecialist()

    def test_subclass_must_implement_toolkit_property(self):
        """Subclass must implement toolkit property."""
        from systems.ai_gui.specialists.base import BaseSpecialist

        class IncompleteSpecialist(BaseSpecialist):
            pass

        with pytest.raises(TypeError):
            IncompleteSpecialist()

    def test_subclass_must_implement_all_methods(self):
        """Subclass must implement all abstract methods."""
        from systems.ai_gui.specialists.base import BaseSpecialist

        class PartialSpecialist(BaseSpecialist):
            @property
            def toolkit(self):
                return "test"

            async def discover_capabilities(self, handle):
                pass

        with pytest.raises(TypeError):
            PartialSpecialist()


class ConcreteSpecialistForTesting:
    """A complete specialist implementation for testing."""

    @pytest.fixture
    def specialist(self):
        """Create a concrete specialist for testing."""
        from systems.ai_gui.specialists.base import (
            BaseSpecialist, Widget, Shortcut, Capabilities, WidgetQuery
        )

        class TestSpecialist(BaseSpecialist):
            @property
            def toolkit(self):
                return "test"

            async def discover_capabilities(self, app_handle):
                return Capabilities(
                    toolkit="test",
                    app_name=app_handle.get("name", "unknown"),
                    version="1.0",
                    widgets=["button", "entry"],
                    shortcuts=["Ctrl+S"],
                    custom_actions=[]
                )

            async def get_widget_tree(self, app_handle):
                return Widget(
                    id="root",
                    role="window",
                    label="Main Window",
                    path="/window",
                    children=[
                        Widget(id="btn1", role="button", label="Click", path="/window/button")
                    ]
                )

            async def get_shortcuts(self, app_handle):
                return [
                    Shortcut(id="save", keys="Ctrl+S", action="Save", category="file", source="built-in"),
                    Shortcut(id="open", keys="Ctrl+O", action="Open", category="file", source="built-in"),
                ]

            async def find_widget(self, app_handle, query: WidgetQuery):
                return [
                    Widget(id="btn1", role="button", label="Submit", path="/window/button")
                ]

            async def inject_shortcut(self, app_handle, shortcut: Shortcut):
                return True

        return TestSpecialist()


class TestConcreteSpecialist:
    """Tests using a concrete specialist implementation."""

    @pytest.fixture
    def specialist(self):
        """Create a concrete specialist for testing."""
        from systems.ai_gui.specialists.base import (
            BaseSpecialist, Widget, Shortcut, Capabilities, WidgetQuery
        )

        class TestSpecialist(BaseSpecialist):
            @property
            def toolkit(self):
                return "test"

            async def discover_capabilities(self, app_handle):
                return Capabilities(
                    toolkit="test",
                    app_name=app_handle.get("name", "unknown"),
                    version="1.0",
                    widgets=["button", "entry"],
                    shortcuts=["Ctrl+S"],
                    custom_actions=[]
                )

            async def get_widget_tree(self, app_handle):
                return Widget(
                    id="root",
                    role="window",
                    label="Main Window",
                    path="/window",
                    children=[
                        Widget(id="btn1", role="button", label="Click", path="/window/button")
                    ]
                )

            async def get_shortcuts(self, app_handle):
                return [
                    Shortcut(id="save", keys="Ctrl+S", action="Save", category="file", source="built-in"),
                    Shortcut(id="open", keys="Ctrl+O", action="Open", category="file", source="built-in"),
                ]

            async def find_widget(self, app_handle, query: WidgetQuery):
                return [
                    Widget(id="btn1", role="button", label="Submit", path="/window/button")
                ]

            async def inject_shortcut(self, app_handle, shortcut: Shortcut):
                return True

        return TestSpecialist()

    @pytest.fixture
    def app_handle(self):
        """Create a mock app handle."""
        return {"name": "test_app", "pid": 12345}

    def test_toolkit_property_returns_string(self, specialist):
        """toolkit property should return toolkit name."""
        assert specialist.toolkit == "test"

    @pytest.mark.asyncio
    async def test_discover_capabilities_returns_capabilities(self, specialist, app_handle):
        """discover_capabilities() should return Capabilities."""
        caps = await specialist.discover_capabilities(app_handle)

        assert caps is not None
        assert caps.toolkit == "test"
        assert caps.app_name == "test_app"

    @pytest.mark.asyncio
    async def test_get_widget_tree_returns_widget(self, specialist, app_handle):
        """get_widget_tree() should return Widget tree."""
        tree = await specialist.get_widget_tree(app_handle)

        assert tree is not None
        assert tree.id == "root"
        assert len(tree.children) == 1

    @pytest.mark.asyncio
    async def test_get_shortcuts_returns_list(self, specialist, app_handle):
        """get_shortcuts() should return list of Shortcuts."""
        shortcuts = await specialist.get_shortcuts(app_handle)

        assert isinstance(shortcuts, list)
        assert len(shortcuts) == 2
        assert shortcuts[0].keys == "Ctrl+S"

    @pytest.mark.asyncio
    async def test_find_widget_returns_matching_widgets(self, specialist, app_handle):
        """find_widget() should return matching widgets."""
        from systems.ai_gui.specialists.base import WidgetQuery

        query = WidgetQuery(role="button", label="Submit")
        widgets = await specialist.find_widget(app_handle, query)

        assert len(widgets) == 1
        assert widgets[0].role == "button"

    @pytest.mark.asyncio
    async def test_inject_shortcut_returns_bool(self, specialist, app_handle):
        """inject_shortcut() should return success boolean."""
        from systems.ai_gui.specialists.base import Shortcut

        shortcut = Shortcut(
            id="custom1",
            keys="Ctrl+Shift+X",
            action="Custom Action",
            category="custom",
            source="injected"
        )

        result = await specialist.inject_shortcut(app_handle, shortcut)
        assert result is True


class TestWidgetQuery:
    """Tests for WidgetQuery dataclass."""

    def test_query_with_role(self):
        """Query can filter by role."""
        from systems.ai_gui.specialists.base import WidgetQuery

        query = WidgetQuery(role="button")

        assert query.role == "button"
        assert query.label is None

    def test_query_with_label(self):
        """Query can filter by label."""
        from systems.ai_gui.specialists.base import WidgetQuery

        query = WidgetQuery(label="Save")

        assert query.label == "Save"
        assert query.role is None

    def test_query_with_both(self):
        """Query can filter by both role and label."""
        from systems.ai_gui.specialists.base import WidgetQuery

        query = WidgetQuery(role="button", label="OK")

        assert query.role == "button"
        assert query.label == "OK"

    def test_query_with_path_pattern(self):
        """Query can filter by path pattern."""
        from systems.ai_gui.specialists.base import WidgetQuery

        query = WidgetQuery(path_pattern="/window/box/*")

        assert query.path_pattern == "/window/box/*"


class TestSpecialistDiscoveryCascade:
    """Tests for the discovery cascade framework."""

    @pytest.fixture
    def specialist(self):
        """Create specialist with discovery methods."""
        from systems.ai_gui.specialists.base import (
            BaseSpecialist, Widget, Shortcut, Capabilities, WidgetQuery
        )

        class DiscoverySpecialist(BaseSpecialist):
            def __init__(self):
                self.discovery_order = []

            @property
            def toolkit(self):
                return "test"

            async def discover_capabilities(self, app_handle):
                self.discovery_order.append("schemas")
                self.discovery_order.append("accessibility")
                self.discovery_order.append("visual")
                self.discovery_order.append("exploration")

                return Capabilities(
                    toolkit="test",
                    app_name="test",
                    version="1.0",
                    widgets=[],
                    shortcuts=[],
                    custom_actions=[]
                )

            async def get_widget_tree(self, app_handle):
                return Widget(id="root", role="window", label="Test", path="/")

            async def get_shortcuts(self, app_handle):
                return []

            async def find_widget(self, app_handle, query: WidgetQuery):
                return []

            async def inject_shortcut(self, app_handle, shortcut: Shortcut):
                return True

        return DiscoverySpecialist()

    @pytest.mark.asyncio
    async def test_discovery_follows_cascade_order(self, specialist):
        """Discovery should follow: schemas → accessibility → visual → exploration."""
        app_handle = {"name": "test"}

        await specialist.discover_capabilities(app_handle)

        assert specialist.discovery_order == [
            "schemas",
            "accessibility",
            "visual",
            "exploration"
        ]
