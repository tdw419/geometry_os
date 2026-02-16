"""
GTK Specialist for AI-GUI Control Surface.

Provides semantic access to GTK applications via AT-SPI (Assistive Technology
Service Provider Interface) accessibility framework.

Features:
- AT-SPI integration for widget tree traversal
- Shortcut extraction from menu items
- Widget finding by role/label
- Graceful fallback when AT-SPI unavailable
"""

import asyncio
import logging
from typing import Optional, Any
from functools import lru_cache

from systems.ai_gui.specialists.base import (
    BaseSpecialist,
    Widget,
    Shortcut,
    WidgetQuery,
    Capabilities,
    AppHandle,
)

logger = logging.getLogger(__name__)

# AT-SPI role to internal role mapping
ROLE_MAP = {
    "push button": "push_button",
    "toggle button": "toggle_button",
    "check box": "checkbox",
    "radio button": "radio_button",
    "text": "entry",
    "entry": "entry",
    "password text": "password_entry",
    "label": "label",
    "frame": "window",
    "dialog": "dialog",
    "menu": "menu",
    "menu item": "menu_item",
    "combo box": "combobox",
    "list": "list",
    "list item": "list_item",
    "tree": "tree",
    "tree item": "tree_item",
    "table": "table",
    "table cell": "table_cell",
    "table row": "table_row",
    "scroll pane": "scroll_pane",
    "panel": "panel",
    "filler": "box",
    "split pane": "pane",
    "status bar": "statusbar",
    "tool bar": "toolbar",
    "page tab": "tab",
    "page tab list": "tab_list",
    "progress bar": "progress_bar",
    "slider": "slider",
    "spin button": "spin_button",
    "calendar": "calendar",
    "icon": "icon",
    "image": "image",
    "separator": "separator",
    "unknown": "unknown",
}

# Try to import pyatspi
try:
    import pyatspi
    ATSPI_AVAILABLE = True
    logger.debug("AT-SPI (pyatspi) is available")
except ImportError:
    ATSPI_AVAILABLE = False
    logger.info("AT-SPI (pyatspi) not available - GTK Specialist will use fallback mode")


class GTKSpecialist(BaseSpecialist):
    """
    Specialist for GTK applications via AT-SPI.

    Provides semantic access to GTK applications through the accessibility
    framework. Can discover widgets, extract shortcuts, and find specific
    UI elements.

    Fallback Mode:
    When AT-SPI is unavailable, falls back to schema-based discovery.
    """

    def __init__(self):
        """Initialize GTK Specialist."""
        self._atspi_available = ATSPI_AVAILABLE
        self._desktop = None

    @property
    def toolkit(self) -> str:
        """Return toolkit name."""
        return "gtk"

    @property
    def atspi_available(self) -> bool:
        """Check if AT-SPI is available."""
        return self._atspi_available

    def _get_desktop(self):
        """Get AT-SPI desktop object."""
        if not self._atspi_available:
            return None
        if self._desktop is None:
            try:
                self._desktop = pyatspi.Registry.getDesktop(0)
            except Exception as e:
                logger.warning(f"Failed to get AT-SPI desktop: {e}")
                return None
        return self._desktop

    def _get_app_accessible(self, app_handle: AppHandle) -> Optional[Any]:
        """
        Get AT-SPI accessible object for an application.

        Args:
            app_handle: Application handle with name and/or PID

        Returns:
            AT-SPI accessible object or None
        """
        desktop = self._get_desktop()
        if not desktop:
            return None

        try:
            for app in desktop:
                try:
                    app_name = app.name or ""
                    app_pid = None

                    # Try to get PID
                    try:
                        app_pid = app.getProcessId()
                    except:
                        pass

                    # Match by name
                    if app_handle.app_name and app_handle.app_name.lower() in app_name.lower():
                        return app

                    # Match by PID
                    if app_handle.pid and app_pid == app_handle.pid:
                        return app

                except Exception as e:
                    logger.debug(f"Error checking app: {e}")
                    continue

        except Exception as e:
            logger.warning(f"Error iterating desktop: {e}")

        return None

    def _map_role(self, atspi_role: str) -> str:
        """Map AT-SPI role to internal role name."""
        role_lower = atspi_role.lower()
        return ROLE_MAP.get(role_lower, role_lower.replace(" ", "_"))

    def _accessible_to_widget(
        self,
        accessible,
        path: str = "",
        depth: int = 0,
        max_depth: int = 15
    ) -> Optional[Widget]:
        """
        Convert AT-SPI accessible to Widget.

        Args:
            accessible: AT-SPI accessible object
            path: Current path in tree
            depth: Current depth
            max_depth: Maximum depth to traverse

        Returns:
            Widget object or None
        """
        if depth > max_depth:
            return None

        try:
            # Get basic info
            name = accessible.name or ""
            try:
                role = accessible.getRoleName()
            except:
                role = "unknown"

            internal_role = self._map_role(role)
            widget_path = f"{path}/{internal_role}[{name[:20]}]" if path else f"/{internal_role}"

            # Get state
            state = set()
            try:
                states = accessible.getState()
                if states:
                    if states.contains(pyatspi.STATE_ENABLED):
                        state.add("enabled")
                    if states.contains(pyatspi.STATE_FOCUSABLE):
                        state.add("focusable")
                    if states.contains(pyatspi.STATE_FOCUSED):
                        state.add("focused")
                    if states.contains(pyatspi.STATE_VISIBLE):
                        state.add("visible")
            except:
                pass

            # Get bounds
            bounds = None
            try:
                comp = accessible.queryComponent()
                if comp:
                    bbox = comp.getExtents(pyatspi.WINDOW_COORDS)
                    bounds = (bbox.x, bbox.y, bbox.width, bbox.height)
            except:
                pass

            # Check if interactive
            is_interactive = internal_role in [
                "push_button", "toggle_button", "checkbox", "radio_button",
                "entry", "combobox", "list_item", "menu_item", "tab"
            ]

            # Process children
            children = []
            try:
                child_count = accessible.childCount
                for i in range(min(child_count, 50)):  # Limit children
                    try:
                        child = accessible.getChildAtIndex(i)
                        child_widget = self._accessible_to_widget(
                            child, widget_path, depth + 1, max_depth
                        )
                        if child_widget:
                            children.append(child_widget)
                    except:
                        continue
            except:
                pass

            return Widget(
                id=f"{internal_role}_{accessible.hashCode() if hasattr(accessible, 'hashCode') else id(accessible)}",
                role=internal_role,
                label=name,
                path=widget_path,
                children=children,
                bounds=bounds,
                state=state,
                is_interactive=is_interactive
            )

        except Exception as e:
            logger.debug(f"Error converting accessible to widget: {e}")
            return None

    async def discover_capabilities(self, app_handle: AppHandle) -> Capabilities:
        """
        Discover capabilities of a GTK application.

        Implements discovery cascade:
        1. Try loading from schema
        2. Query via AT-SPI
        3. Return findings

        Args:
            app_handle: Handle to the application

        Returns:
            Capabilities object with findings
        """
        # Try schema first
        schema_caps = await self._discover_from_schema(app_handle)
        if schema_caps and not self._atspi_available:
            return schema_caps

        # Initialize capabilities
        caps = Capabilities(
            toolkit="gtk",
            app_name=app_handle.app_name,
            has_accessibility=self._atspi_available,
            discovery_sources=[]
        )

        # Try AT-SPI
        if self._atspi_available:
            try:
                app = self._get_app_accessible(app_handle)
                if app:
                    caps.discovery_sources.append("accessibility")

                    # Get version if possible
                    try:
                        # Some apps expose version in accessible description
                        desc = app.description or ""
                        caps.version = ""
                    except:
                        pass

                    # Collect widget types
                    widget_types = set()
                    shortcuts_found = []

                    def collect_from_accessible(acc, depth=0):
                        if depth > 10:
                            return
                        try:
                            role = acc.getRoleName()
                            widget_types.add(self._map_role(role))

                            # Extract shortcuts from menu items
                            if "menu item" in role.lower():
                                try:
                                    desc = acc.getDescription() or ""
                                    name = acc.name or ""
                                    # Look for shortcut patterns
                                    import re
                                    shortcut_match = re.search(r'(Ctrl\+[A-Z]|Alt\+[A-Z]|Ctrl\+Shift\+[A-Z])', desc + name)
                                    if shortcut_match:
                                        shortcuts_found.append(shortcut_match.group(1))
                                except:
                                    pass

                            # Recurse children
                            for i in range(min(acc.childCount, 20)):
                                try:
                                    child = acc.getChildAtIndex(i)
                                    collect_from_accessible(child, depth + 1)
                                except:
                                    continue
                        except:
                            pass

                    collect_from_accessible(app)

                    caps.widgets = list(widget_types)
                    caps.shortcuts = list(set(shortcuts_found))

            except Exception as e:
                logger.warning(f"AT-SPI discovery failed: {e}")

        # Merge with schema if available
        if schema_caps:
            caps.widgets = list(set(caps.widgets + schema_caps.widgets))
            caps.shortcuts = list(set(caps.shortcuts + schema_caps.shortcuts))
            caps.custom_actions = schema_caps.custom_actions
            caps.version = schema_caps.version or caps.version
            if "schema" not in caps.discovery_sources:
                caps.discovery_sources.append("schema")

        return caps

    async def get_widget_tree(self, app_handle: AppHandle) -> Widget:
        """
        Get widget tree of GTK application.

        Args:
            app_handle: Handle to the application

        Returns:
            Root Widget with children forming the tree
        """
        # Return empty tree if no AT-SPI
        if not self._atspi_available:
            return Widget(
                id="empty_root",
                role="window",
                label="AT-SPI not available",
                path="/"
            )

        app = self._get_app_accessible(app_handle)
        if not app:
            return Widget(
                id="not_found",
                role="window",
                label=f"Application '{app_handle.app_name}' not found",
                path="/"
            )

        tree = self._accessible_to_widget(app)
        return tree or Widget(
            id="error",
            role="window",
            label="Failed to build tree",
            path="/"
        )

    async def get_shortcuts(self, app_handle: AppHandle) -> list[Shortcut]:
        """
        Get keyboard shortcuts for GTK application.

        Extracts shortcuts from:
        1. Menu items via AT-SPI
        2. Schema file
        3. Accelerator tables (if accessible)

        Args:
            app_handle: Handle to the application

        Returns:
            List of shortcuts
        """
        shortcuts = []

        # Try schema first
        schema = self._load_schema(app_handle.app_name)
        if schema and "shortcuts" in schema:
            for s in schema["shortcuts"]:
                shortcuts.append(Shortcut(
                    id=s.get("id", s.get("keys", "").replace("+", "_")),
                    keys=s.get("keys", ""),
                    action=s.get("action", ""),
                    category=s.get("category", "general"),
                    description=s.get("description", ""),
                    source="schema"
                ))

        # Try AT-SPI extraction
        if self._atspi_available:
            app = self._get_app_accessible(app_handle)
            if app:
                def extract_from_menus(acc, depth=0):
                    if depth > 8:
                        return
                    try:
                        role = acc.getRoleName().lower()

                        if "menu item" in role:
                            try:
                                name = acc.name or ""
                                desc = acc.getDescription() or ""

                                # Extract shortcut from various sources
                                import re
                                for pattern in [
                                    r'(Ctrl\+[A-Z])',
                                    r'(Alt\+[A-Z])',
                                    r'(Ctrl\+Shift\+[A-Z])',
                                    r'(Ctrl\+Alt\+[A-Z])',
                                ]:
                                    match = re.search(pattern, name + " " + desc)
                                    if match:
                                        keys = match.group(1)
                                        action = name.replace(keys, "").replace("_", "").strip()

                                        shortcuts.append(Shortcut(
                                            id=f"atspi_{keys.replace('+', '_')}",
                                            keys=keys,
                                            action=action,
                                            category="discovered",
                                            source="discovered"
                                        ))
                                        break
                            except:
                                pass

                        # Recurse
                        for i in range(min(acc.childCount, 30)):
                            try:
                                child = acc.getChildAtIndex(i)
                                extract_from_menus(child, depth + 1)
                            except:
                                continue
                    except:
                        pass

                extract_from_menus(app)

        # Deduplicate by keys
        seen_keys = set()
        unique_shortcuts = []
        for s in shortcuts:
            if s.keys not in seen_keys:
                seen_keys.add(s.keys)
                unique_shortcuts.append(s)

        return unique_shortcuts

    async def find_widget(
        self,
        app_handle: AppHandle,
        query: WidgetQuery
    ) -> list[Widget]:
        """
        Find widgets matching query.

        Args:
            app_handle: Handle to the application
            query: Query parameters

        Returns:
            List of matching widgets
        """
        tree = await self.get_widget_tree(app_handle)

        results = []

        def search(widget: Widget, depth: int = 0):
            if depth > query.max_depth:
                return

            if query.matches(widget):
                results.append(widget)

            for child in widget.children:
                search(child, depth + 1)

        search(tree)
        return results

    async def inject_shortcut(
        self,
        app_handle: AppHandle,
        shortcut: Shortcut
    ) -> bool:
        """
        Inject a new keyboard shortcut.

        GTK shortcut injection typically requires:
        1. Plugin/extension support in the app
        2. Modifying accelerator maps
        3. Using GTK's gtk_accelerator functions

        This is a best-effort implementation that may not work
        for all GTK applications.

        Args:
            app_handle: Handle to the application
            shortcut: Shortcut to inject

        Returns:
            True if injection appeared successful
        """
        # GTK shortcut injection is complex and app-specific
        # For now, log and return False to indicate not supported

        logger.info(f"Shortcut injection requested: {shortcut.keys} -> {shortcut.action}")
        logger.warning("GTK shortcut injection not yet implemented")

        # Could potentially:
        # 1. Check if app has plugin system
        # 2. Look for ~/.config/<app>/accel file
        # 3. Modify and reload accelerators

        return False
