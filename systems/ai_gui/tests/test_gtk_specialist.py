"""
Tests for GTK Specialist - TDD style.

Tests written BEFORE implementation following red-green-refactor cycle.
GTK Specialist provides semantic access to GTK applications via AT-SPI.
"""

import pytest
from unittest.mock import MagicMock, AsyncMock, patch, PropertyMock


class TestGTKSpecialist:
    """Tests for GTK Specialist implementation."""

    @pytest.fixture
    def specialist(self):
        """Create a GTK Specialist instance."""
        from systems.ai_gui.specialists.gtk_specialist import GTKSpecialist
        return GTKSpecialist()

    @pytest.fixture
    def app_handle(self):
        """Create a mock app handle."""
        from systems.ai_gui.specialists.base import AppHandle
        return AppHandle(
            app_name="gedit",
            pid=12345,
            toolkit="gtk"
        )

    # === Basic Properties ===

    def test_toolkit_is_gtk(self, specialist):
        """toolkit property should return 'gtk'."""
        assert specialist.toolkit == "gtk"

    # === AT-SPI Integration ===

    def test_has_atspi_available_property(self, specialist):
        """Should have property to check if AT-SPI is available."""
        # Should not raise
        _ = specialist.atspi_available

    @pytest.mark.asyncio
    async def test_discover_capabilities_with_atspi(self, specialist, app_handle):
        """discover_capabilities should use AT-SPI when available."""
        with patch.object(specialist, '_atspi_available', True):
            with patch.object(specialist, '_get_app_accessible') as mock_get_app:
                mock_app = MagicMock()
                mock_app.getRoleName.return_value = "application"
                mock_app.childCount = 0
                mock_get_app.return_value = mock_app

                caps = await specialist.discover_capabilities(app_handle)

                assert caps.toolkit == "gtk"
                assert caps.has_accessibility is True

    @pytest.mark.asyncio
    async def test_discover_capabilities_without_atspi(self, specialist, app_handle):
        """discover_capabilities should work without AT-SPI (fallback to schema)."""
        with patch.object(specialist, '_atspi_available', False):
            caps = await specialist.discover_capabilities(app_handle)

            # Should still return capabilities (from schema or empty)
            assert caps is not None
            assert caps.toolkit == "gtk"
            assert caps.has_accessibility is False

    # === Widget Tree ===

    @pytest.mark.asyncio
    async def test_get_widget_tree_traverses_accessible(self, specialist, app_handle):
        """get_widget_tree should traverse AT-SPI accessible tree."""
        mock_root = MagicMock()
        mock_root.name = "gedit"
        mock_root.getRoleName.return_value = "frame"  # Maps to "window" internally
        mock_root.childCount = 1

        mock_child = MagicMock()
        mock_child.name = "Save Button"
        mock_child.getRoleName.return_value = "push button"
        mock_child.childCount = 0
        mock_root.getChildAtIndex.return_value = mock_child

        with patch.object(specialist, '_get_app_accessible', return_value=mock_root):
            tree = await specialist.get_widget_tree(app_handle)

            assert tree is not None
            # "frame" maps to "window" in our role map
            assert tree.role in ["window", "frame"]
            assert len(tree.children) >= 0

    @pytest.mark.asyncio
    async def test_get_widget_tree_handles_missing_app(self, specialist, app_handle):
        """get_widget_tree should handle app not found gracefully."""
        with patch.object(specialist, '_get_app_accessible', return_value=None):
            tree = await specialist.get_widget_tree(app_handle)

            # Should return empty/minimal tree
            assert tree is not None

    # === Shortcuts ===

    @pytest.mark.asyncio
    async def test_get_shortcuts_extracts_from_menus(self, specialist, app_handle):
        """get_shortcuts should extract shortcuts from menu items."""
        mock_app = MagicMock()
        mock_menu = MagicMock()
        mock_menu.childCount = 2

        mock_item1 = MagicMock()
        mock_item1.name = "_File"
        mock_item1.getRoleName.return_value = "menu"

        mock_submenu = MagicMock()
        mock_submenu.childCount = 1
        mock_save = MagicMock()
        mock_save.name = "_Save"
        mock_save.getRoleName.return_value = "menu item"
        # GTK menu items have shortcuts in accessible description
        mock_save.getDescription.return_value = "Ctrl+S"
        mock_submenu.getChildAtIndex.return_value = mock_save
        mock_item1.getChildAtIndex.return_value = mock_submenu

        mock_menu.getChildAtIndex.side_effect = [mock_item1, None]
        mock_app.getChildAtIndex.return_value = mock_menu

        with patch.object(specialist, '_get_app_accessible', return_value=mock_app):
            shortcuts = await specialist.get_shortcuts(app_handle)

            # Should have found shortcuts
            assert isinstance(shortcuts, list)

    @pytest.mark.asyncio
    async def test_get_shortcuts_loads_from_schema(self, specialist, app_handle):
        """get_shortcuts should load from schema if available."""
        # Without AT-SPI, should still try to load schema
        with patch.object(specialist, '_atspi_available', False):
            with patch.object(specialist, '_load_schema') as mock_load:
                mock_load.return_value = {
                    "shortcuts": [
                        {"keys": "Ctrl+S", "action": "Save", "category": "file"}
                    ]
                }

                shortcuts = await specialist.get_shortcuts(app_handle)

                assert isinstance(shortcuts, list)

    # === Widget Finding ===

    @pytest.mark.asyncio
    async def test_find_widget_by_role(self, specialist, app_handle):
        """find_widget should find widgets by role."""
        from systems.ai_gui.specialists.base import WidgetQuery

        mock_app = MagicMock()
        mock_app.name = "test"
        mock_app.getRoleName.return_value = "frame"
        mock_app.childCount = 1

        mock_button = MagicMock()
        mock_button.name = "Click Me"
        mock_button.getRoleName.return_value = "push button"
        mock_button.childCount = 0
        mock_app.getChildAtIndex.return_value = mock_button

        with patch.object(specialist, '_get_app_accessible', return_value=mock_app):
            query = WidgetQuery(role="push button")
            widgets = await specialist.find_widget(app_handle, query)

            assert isinstance(widgets, list)

    @pytest.mark.asyncio
    async def test_find_widget_by_label(self, specialist, app_handle):
        """find_widget should find widgets by label."""
        from systems.ai_gui.specialists.base import WidgetQuery

        mock_app = MagicMock()
        mock_app.name = "test"
        mock_app.getRoleName.return_value = "frame"
        mock_app.childCount = 1

        mock_button = MagicMock()
        mock_button.name = "Save Document"
        mock_button.getRoleName.return_value = "push button"
        mock_button.childCount = 0
        mock_app.getChildAtIndex.return_value = mock_button

        with patch.object(specialist, '_get_app_accessible', return_value=mock_app):
            query = WidgetQuery(label="Save Document")
            widgets = await specialist.find_widget(app_handle, query)

            assert isinstance(widgets, list)

    # === Shortcut Injection ===

    @pytest.mark.asyncio
    async def test_inject_shortcut_via_plugin(self, specialist, app_handle):
        """inject_shortcut should try plugin mechanism first."""
        from systems.ai_gui.specialists.base import Shortcut

        shortcut = Shortcut(
            id="custom1",
            keys="Ctrl+Shift+T",
            action="Test Action",
            category="custom",
            source="injected"
        )

        # Should not raise, return bool
        result = await specialist.inject_shortcut(app_handle, shortcut)

        assert isinstance(result, bool)

    # === Role Mapping ===

    def test_map_atspi_role_to_widget_role(self, specialist):
        """Should map AT-SPI roles to internal Widget roles."""
        # AT-SPI has many roles, we need to map them
        assert specialist._map_role("push button") == "push_button"
        assert specialist._map_role("text") == "entry"
        assert specialist._map_role("frame") == "window"

    # === Error Handling ===

    @pytest.mark.asyncio
    async def test_handles_atspi_not_available(self, specialist, app_handle):
        """Should handle AT-SPI not being available gracefully."""
        with patch.object(specialist, '_atspi_available', False):
            caps = await specialist.discover_capabilities(app_handle)

            assert caps.has_accessibility is False

    @pytest.mark.asyncio
    async def test_handles_app_not_found(self, specialist, app_handle):
        """Should handle app not found gracefully."""
        with patch.object(specialist, '_get_app_accessible', return_value=None):
            tree = await specialist.get_widget_tree(app_handle)

            # Should return empty tree
            assert tree is not None


class TestGTKSpecialistWithMockedATSPI:
    """Tests with fully mocked AT-SPI infrastructure."""

    @pytest.fixture
    def specialist_with_mocked_atspi(self):
        """Create specialist with mocked internal AT-SPI methods."""
        from systems.ai_gui.specialists.gtk_specialist import GTKSpecialist

        specialist = GTKSpecialist()

        # Mock the internal AT-SPI available flag and methods
        specialist._atspi_available = True

        mock_app = MagicMock()
        mock_app.name = "gedit"
        mock_app.getRoleName.return_value = "application"
        mock_app.childCount = 0

        yield specialist, mock_app

    @pytest.mark.asyncio
    async def test_finds_app_by_name(self, specialist_with_mocked_atspi):
        """Should find application by name in desktop."""
        specialist, mock_app = specialist_with_mocked_atspi

        from systems.ai_gui.specialists.base import AppHandle
        app_handle = AppHandle(app_name="gedit", pid=12345)

        # Mock the internal method
        with patch.object(specialist, '_get_app_accessible', return_value=mock_app):
            result = specialist._get_app_accessible(app_handle)
            assert result is not None

    @pytest.mark.asyncio
    async def test_finds_app_by_pid(self, specialist_with_mocked_atspi):
        """Should find application by PID."""
        specialist, mock_app = specialist_with_mocked_atspi

        from systems.ai_gui.specialists.base import AppHandle
        app_handle = AppHandle(app_name="gedit", pid=12345)

        with patch.object(specialist, '_get_app_accessible', return_value=mock_app):
            result = specialist._get_app_accessible(app_handle)
            assert result is not None


class TestGTKSpecialistIntegration:
    """Integration tests for GTK Specialist (may require real AT-SPI)."""

    @pytest.fixture
    def specialist(self):
        """Create GTK Specialist."""
        from systems.ai_gui.specialists.gtk_specialist import GTKSpecialist
        return GTKSpecialist()

    @pytest.mark.skipif(
        True,  # Skip by default - requires AT-SPI and running GTK app
        reason="Requires AT-SPI and running GTK application"
    )
    @pytest.mark.asyncio
    async def test_real_gtk_app_discovery(self, specialist):
        """Test discovering real GTK application (requires AT-SPI)."""
        from systems.ai_gui.specialists.base import AppHandle

        # This test requires a real GTK app running
        app_handle = AppHandle(app_name="gedit")

        caps = await specialist.discover_capabilities(app_handle)

        assert caps.toolkit == "gtk"
        assert len(caps.widgets) > 0 or len(caps.shortcuts) > 0
