"""
Unit tests for Boot Menu functionality.

Tests cover:
- Boot script generation: /pxe/boot.ipxe endpoint
- Menu script generation: /pxe/menu.ipxe endpoint
- Menu customization: POST /pxe/{entry_id}/menu endpoint
- Configuration: default_entry, menu_timeout settings
- Integration: menu updates, toggle behavior
"""

import asyncio
import os
import shutil
import tempfile
import unittest
from unittest.mock import MagicMock

from aiohttp import web
from aiohttp.test_utils import TestClient, TestServer

from systems.pixel_compiler.pxe.http_server import (
    HTTPServerConfig,
    HTTPServer,
    PXEContainerInfo,
)


# =============================================================================
# Test Fixtures and Helpers
# =============================================================================

# Use a non-standard port range for testing to avoid conflicts
TEST_PORT_COUNTER = 28100


def get_test_port():
    """Get a unique test port."""
    global TEST_PORT_COUNTER
    TEST_PORT_COUNTER += 1
    return TEST_PORT_COUNTER


def create_test_config(**kwargs) -> HTTPServerConfig:
    """Create a test HTTPServerConfig with sensible defaults."""
    defaults = {
        'interface': '127.0.0.1',
        'listen_port': get_test_port(),
        'root_dir': '/tmp/bootmenutest',
        'enable_range_requests': True,
        'watch_paths': None,
        'default_entry': 'local',
        'menu_timeout': 10,
    }
    defaults.update(kwargs)
    return HTTPServerConfig(**defaults)


def create_mock_catalog_entry(entry_id: str = "test-container", name: str = "Test Container",
                               size: int = 1024, path: str = "/tmp/test.rts.png"):
    """Create a mock CatalogEntry for testing."""
    entry = MagicMock()
    entry.id = entry_id
    entry.name = name
    entry.size = size
    entry.path = path
    entry.kernel_version = "6.1.0"
    entry.distro = "debian"
    entry.architecture = "x86_64"
    return entry


# =============================================================================
# Base Test Class for Integration Tests
# =============================================================================

class BootMenuTestBase(unittest.TestCase):
    """Base class for boot menu tests with proper async setup."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()
        self.loop = asyncio.new_event_loop()
        asyncio.set_event_loop(self.loop)

        # Create test file
        self.test_file = os.path.join(self.temp_dir, "test.rts.png")
        with open(self.test_file, 'wb') as f:
            f.write(b'B' * 1024)

    def tearDown(self):
        """Clean up."""
        self.loop.close()
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def run_async(self, coro):
        """Run an async coroutine in the test event loop."""
        return self.loop.run_until_complete(coro)


# =============================================================================
# Boot Script Tests
# =============================================================================

class TestBootScriptGeneration(BootMenuTestBase):
    """Tests for /pxe/boot.ipxe endpoint."""

    def setUp(self):
        """Set up test server."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_boot_script_returns_text_plain(self):
        """Test boot script returns text/plain content type."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/boot.ipxe')
                self.assertEqual(resp.status, 200)
                self.assertEqual(resp.headers.get('Content-Type'), 'text/plain; charset=utf-8')

            await server.stop()

        self.run_async(run_test())

    def test_boot_script_starts_with_ipxe_shebang(self):
        """Test boot script starts with #!ipxe."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/boot.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertTrue(content.startswith('#!ipxe'))

            await server.stop()

        self.run_async(run_test())

    def test_boot_script_contains_chain_command(self):
        """Test boot script contains chain command."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/boot.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('chain http://', content)

            await server.stop()

        self.run_async(run_test())

    def test_boot_script_chains_to_menu_ipxe(self):
        """Test boot script chains to menu.ipxe."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/boot.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('/pxe/menu.ipxe', content)

            await server.stop()

        self.run_async(run_test())

    def test_boot_script_uses_request_host(self):
        """Test boot script uses host from request."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/boot.ipxe', headers={'Host': '192.168.1.100:8080'})
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('192.168.1.100:8080', content)

            await server.stop()

        self.run_async(run_test())

    def test_boot_script_basic_structure(self):
        """Test boot script has expected structure."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/boot.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                # Should contain PixelRTS header
                self.assertIn('PixelRTS', content)
                # Should be short (just chains to menu)
                self.assertLess(len(content), 500)

            await server.stop()

        self.run_async(run_test())

    def test_boot_script_with_custom_port(self):
        """Test boot script with custom port configuration."""
        async def run_test():
            config = create_test_config(root_dir=self.temp_dir, listen_port=3000)
            server = HTTPServer(config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/boot.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                # Host header from test client should be used
                self.assertIn('chain http://', content)

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# Menu Script Tests
# =============================================================================

class TestMenuScriptGeneration(BootMenuTestBase):
    """Tests for /pxe/menu.ipxe endpoint."""

    def setUp(self):
        """Set up test server."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_menu_script_returns_text_plain(self):
        """Test menu script returns text/plain content type."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                self.assertEqual(resp.headers.get('Content-Type'), 'text/plain; charset=utf-8')

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_starts_with_ipxe_shebang(self):
        """Test menu script starts with #!ipxe."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertTrue(content.startswith('#!ipxe'))

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_has_menu_command(self):
        """Test menu script has menu command."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('menu PixelRTS', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_has_choose_command(self):
        """Test menu script has choose command."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('choose', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_has_local_boot_option(self):
        """Test menu script has local boot option."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('local', content.lower())
                self.assertIn('Boot from local disk', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_has_sanboot_for_local(self):
        """Test menu script uses sanboot for local boot."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('sanboot', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_empty_containers(self):
        """Test menu script with no PXE containers."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                # Should still have local boot option
                self.assertIn(':local', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_with_containers(self):
        """Test menu script includes PXE containers."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add mock container
            mock_entry = create_mock_catalog_entry(
                entry_id="ubuntu-22.04",
                name="Ubuntu 22.04",
                size=1048576,  # 1MB
                path=self.test_file
            )
            server._catalog["ubuntu-22.04"] = mock_entry
            server._pxe_containers["ubuntu-22.04"] = PXEContainerInfo(
                entry_id="ubuntu-22.04",
                entry=mock_entry,
                pxe_enabled=True,
                pxe_boot_order=0
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('ubuntu-22.04', content)
                self.assertIn('Ubuntu 22.04', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_container_item_format(self):
        """Test menu script container item format includes metadata."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add mock container with known distro
            mock_entry = create_mock_catalog_entry(
                entry_id="debian-12",
                name="Debian 12",
                size=2097152,  # 2MB
                path=self.test_file
            )
            mock_entry.distro = "debian"
            server._catalog["debian-12"] = mock_entry
            server._pxe_containers["debian-12"] = PXEContainerInfo(
                entry_id="debian-12",
                entry=mock_entry,
                pxe_enabled=True,
                pxe_boot_order=0
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                # Should include size in MB
                self.assertIn('2MB', content)
                # Should include distro
                self.assertIn('debian', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_uses_request_host(self):
        """Test menu script uses host from request."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add mock container
            mock_entry = create_mock_catalog_entry(
                entry_id="test-os",
                name="Test OS",
                path=self.test_file
            )
            server._catalog["test-os"] = mock_entry
            server._pxe_containers["test-os"] = PXEContainerInfo(
                entry_id="test-os",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe', headers={'Host': '10.0.0.1:8080'})
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('10.0.0.1:8080', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_multiple_containers_sorted_by_boot_order(self):
        """Test menu script sorts containers by boot_order."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add multiple containers with different boot orders
            for i, (entry_id, name, order) in enumerate([
                ("container-a", "Container A", 2),
                ("container-b", "Container B", 0),
                ("container-c", "Container C", 1),
            ]):
                mock_entry = create_mock_catalog_entry(
                    entry_id=entry_id,
                    name=name,
                    path=self.test_file
                )
                server._catalog[entry_id] = mock_entry
                server._pxe_containers[entry_id] = PXEContainerInfo(
                    entry_id=entry_id,
                    entry=mock_entry,
                    pxe_enabled=True,
                    pxe_boot_order=order
                )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                # B should come before C which comes before A
                pos_b = content.find('container-b')
                pos_c = content.find('container-c')
                pos_a = content.find('container-a')
                self.assertLess(pos_b, pos_c)
                self.assertLess(pos_c, pos_a)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_has_default_selection(self):
        """Test menu script sets default selection."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('menu-default', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_uses_config_default_entry(self):
        """Test menu script uses configured default_entry."""
        async def run_test():
            config = create_test_config(root_dir=self.temp_dir, default_entry='ubuntu-22.04')
            server = HTTPServer(config)

            # Add container
            mock_entry = create_mock_catalog_entry(
                entry_id="ubuntu-22.04",
                name="Ubuntu 22.04",
                path=self.test_file
            )
            server._catalog["ubuntu-22.04"] = mock_entry
            server._pxe_containers["ubuntu-22.04"] = PXEContainerInfo(
                entry_id="ubuntu-22.04",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('ubuntu-22.04', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_includes_timeout(self):
        """Test menu script includes timeout configuration."""
        async def run_test():
            config = create_test_config(root_dir=self.temp_dir, menu_timeout=30)
            server = HTTPServer(config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('--timeout 30', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_zero_timeout_no_timeout_flag(self):
        """Test menu script with zero timeout has no timeout flag."""
        async def run_test():
            config = create_test_config(root_dir=self.temp_dir, menu_timeout=0)
            server = HTTPServer(config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertNotIn('--timeout', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_has_goto_labels(self):
        """Test menu script has goto labels for each container."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add containers
            for entry_id in ["os1", "os2"]:
                mock_entry = create_mock_catalog_entry(
                    entry_id=entry_id,
                    name=f"OS {entry_id}",
                    path=self.test_file
                )
                server._catalog[entry_id] = mock_entry
                server._pxe_containers[entry_id] = PXEContainerInfo(
                    entry_id=entry_id,
                    entry=mock_entry,
                    pxe_enabled=True
                )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn(':os1', content)
                self.assertIn(':os2', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_has_chain_for_containers(self):
        """Test menu script chains to container URLs."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="my-container",
                name="My Container",
                path=self.test_file
            )
            server._catalog["my-container"] = mock_entry
            server._pxe_containers["my-container"] = PXEContainerInfo(
                entry_id="my-container",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('/containers/my-container', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_script_has_failed_fallback(self):
        """Test menu script has fallback for failed boot."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn(':failed', content)

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# Menu Customization Tests
# =============================================================================

class TestMenuCustomization(BootMenuTestBase):
    """Tests for POST /pxe/{entry_id}/menu endpoint."""

    def setUp(self):
        """Set up test server."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_update_custom_name(self):
        """Test updating custom name for menu entry."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="ubuntu-22.04",
                name="Ubuntu 22.04 LTS",
                path=self.test_file
            )
            server._catalog["ubuntu-22.04"] = mock_entry
            server._pxe_containers["ubuntu-22.04"] = PXEContainerInfo(
                entry_id="ubuntu-22.04",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post(
                    '/pxe/ubuntu-22.04/menu',
                    json={'name': 'Ubuntu Desktop'}
                )
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertTrue(data['success'])
                self.assertEqual(data['name'], 'Ubuntu Desktop')

            await server.stop()

        self.run_async(run_test())

    def test_update_custom_description(self):
        """Test updating custom description for menu entry."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="debian-12",
                name="Debian 12",
                path=self.test_file
            )
            server._catalog["debian-12"] = mock_entry
            server._pxe_containers["debian-12"] = PXEContainerInfo(
                entry_id="debian-12",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post(
                    '/pxe/debian-12/menu',
                    json={'description': 'Production server image'}
                )
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertTrue(data['success'])
                self.assertEqual(data['description'], 'Production server image')

            await server.stop()

        self.run_async(run_test())

    def test_update_boot_order(self):
        """Test updating boot order for menu entry."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="fedora-39",
                name="Fedora 39",
                path=self.test_file
            )
            server._catalog["fedora-39"] = mock_entry
            server._pxe_containers["fedora-39"] = PXEContainerInfo(
                entry_id="fedora-39",
                entry=mock_entry,
                pxe_enabled=True,
                pxe_boot_order=5
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post(
                    '/pxe/fedora-39/menu',
                    json={'boot_order': 0}
                )
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertTrue(data['success'])
                self.assertEqual(data['boot_order'], 0)

            await server.stop()

        self.run_async(run_test())

    def test_update_multiple_fields(self):
        """Test updating multiple fields at once."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="arch-linux",
                name="Arch Linux",
                path=self.test_file
            )
            server._catalog["arch-linux"] = mock_entry
            server._pxe_containers["arch-linux"] = PXEContainerInfo(
                entry_id="arch-linux",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post(
                    '/pxe/arch-linux/menu',
                    json={
                        'name': 'Arch Linux Latest',
                        'description': 'Rolling release',
                        'boot_order': 1
                    }
                )
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertTrue(data['success'])
                self.assertEqual(data['name'], 'Arch Linux Latest')
                self.assertEqual(data['description'], 'Rolling release')
                self.assertEqual(data['boot_order'], 1)

            await server.stop()

        self.run_async(run_test())

    def test_update_nonexistent_container(self):
        """Test updating menu for non-existent container returns 404."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post(
                    '/pxe/nonexistent/menu',
                    json={'name': 'Test'}
                )
                self.assertEqual(resp.status, 404)

            await server.stop()

        self.run_async(run_test())

    def test_update_invalid_json(self):
        """Test updating with invalid JSON returns 400."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="test-os",
                name="Test OS",
                path=self.test_file
            )
            server._catalog["test-os"] = mock_entry
            server._pxe_containers["test-os"] = PXEContainerInfo(
                entry_id="test-os",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post(
                    '/pxe/test-os/menu',
                    data='not valid json',
                    headers={'Content-Type': 'application/json'}
                )
                self.assertEqual(resp.status, 400)

            await server.stop()

        self.run_async(run_test())

    def test_custom_name_appears_in_menu_script(self):
        """Test custom name appears in generated menu script."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="ubuntu-22.04",
                name="Ubuntu 22.04 LTS",
                path=self.test_file
            )
            server._catalog["ubuntu-22.04"] = mock_entry
            server._pxe_containers["ubuntu-22.04"] = PXEContainerInfo(
                entry_id="ubuntu-22.04",
                entry=mock_entry,
                pxe_enabled=True,
                pxe_name="Custom Ubuntu Name"
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('Custom Ubuntu Name', content)
                # Original name should NOT appear
                self.assertNotIn('Ubuntu 22.04 LTS', content)

            await server.stop()

        self.run_async(run_test())

    def test_custom_description_appears_in_menu_script(self):
        """Test custom description appears in generated menu script."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="centos-9",
                name="CentOS 9",
                size=3145728,  # 3MB
                path=self.test_file
            )
            mock_entry.distro = "centos"
            server._catalog["centos-9"] = mock_entry
            server._pxe_containers["centos-9"] = PXEContainerInfo(
                entry_id="centos-9",
                entry=mock_entry,
                pxe_enabled=True,
                pxe_description="Enterprise Linux 9"
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('Enterprise Linux 9', content)

            await server.stop()

        self.run_async(run_test())

    def test_empty_custom_name_uses_default(self):
        """Test empty custom name falls back to entry name."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="alpine-3",
                name="Alpine Linux 3",
                path=self.test_file
            )
            server._catalog["alpine-3"] = mock_entry
            server._pxe_containers["alpine-3"] = PXEContainerInfo(
                entry_id="alpine-3",
                entry=mock_entry,
                pxe_enabled=True,
                pxe_name=None  # No custom name
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('Alpine Linux 3', content)

            await server.stop()

        self.run_async(run_test())

    def test_pxe_list_includes_custom_fields(self):
        """Test /pxe list includes custom name and description."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="rhel-9",
                name="Red Hat Enterprise Linux 9",
                path=self.test_file
            )
            server._catalog["rhel-9"] = mock_entry
            server._pxe_containers["rhel-9"] = PXEContainerInfo(
                entry_id="rhel-9",
                entry=mock_entry,
                pxe_enabled=True,
                pxe_name="RHEL 9",
                pxe_description="Enterprise production server"
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe')
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertEqual(data['count'], 1)
                container = data['pxe_containers'][0]
                self.assertEqual(container['pxe_name'], 'RHEL 9')
                self.assertEqual(container['pxe_description'], 'Enterprise production server')

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# Menu Configuration Tests
# =============================================================================

class TestMenuConfiguration(BootMenuTestBase):
    """Tests for menu configuration options."""

    def setUp(self):
        """Set up test server."""
        super().setUp()

    def test_default_entry_config(self):
        """Test default_entry configuration."""
        config = create_test_config(root_dir=self.temp_dir, default_entry='my-default')
        self.assertEqual(config.default_entry, 'my-default')

    def test_menu_timeout_config(self):
        """Test menu_timeout configuration."""
        config = create_test_config(root_dir=self.temp_dir, menu_timeout=45)
        self.assertEqual(config.menu_timeout, 45)

    def test_default_config_values(self):
        """Test default configuration values for menu."""
        config = HTTPServerConfig()
        self.assertEqual(config.default_entry, 'local')
        self.assertEqual(config.menu_timeout, 10)

    def test_zero_timeout_allowed(self):
        """Test zero timeout is allowed (no auto-boot)."""
        config = create_test_config(root_dir=self.temp_dir, menu_timeout=0)
        self.assertEqual(config.menu_timeout, 0)


# =============================================================================
# Menu Toggle Integration Tests
# =============================================================================

class TestMenuToggleIntegration(BootMenuTestBase):
    """Tests for menu behavior when toggling PXE availability."""

    def setUp(self):
        """Set up test server."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_disabled_container_not_in_menu(self):
        """Test disabled container does not appear in menu."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="disabled-os",
                name="Disabled OS",
                path=self.test_file
            )
            server._catalog["disabled-os"] = mock_entry
            server._pxe_containers["disabled-os"] = PXEContainerInfo(
                entry_id="disabled-os",
                entry=mock_entry,
                pxe_enabled=False  # Disabled
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertNotIn('disabled-os', content)
                self.assertNotIn('Disabled OS', content)

            await server.stop()

        self.run_async(run_test())

    def test_toggle_refreshes_menu(self):
        """Test toggling container refreshes menu."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="toggle-os",
                name="Toggle OS",
                path=self.test_file
            )
            server._catalog["toggle-os"] = mock_entry
            server._pxe_containers["toggle-os"] = PXEContainerInfo(
                entry_id="toggle-os",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                # Initially in menu
                resp = await client.get('/pxe/menu.ipxe')
                content = await resp.text()
                self.assertIn('toggle-os', content)

                # Disable
                await client.post('/pxe/toggle-os/toggle', json={'enabled': False})

                # Now not in menu
                resp = await client.get('/pxe/menu.ipxe')
                content = await resp.text()
                self.assertNotIn('toggle-os', content)

            await server.stop()

        self.run_async(run_test())

    def test_reenable_adds_back_to_menu(self):
        """Test re-enabling container adds it back to menu."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="reenable-os",
                name="Reenable OS",
                path=self.test_file
            )
            server._catalog["reenable-os"] = mock_entry
            server._pxe_containers["reenable-os"] = PXEContainerInfo(
                entry_id="reenable-os",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                # Disable
                await client.post('/pxe/reenable-os/toggle', json={'enabled': False})

                # Re-enable
                await client.post('/pxe/reenable-os/toggle', json={'enabled': True})

                # Back in menu
                resp = await client.get('/pxe/menu.ipxe')
                content = await resp.text()
                self.assertIn('reenable-os', content)

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# Boot Order Tests
# =============================================================================

class TestBootOrder(BootMenuTestBase):
    """Tests for boot order functionality."""

    def setUp(self):
        """Set up test server."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_boot_order_affects_menu_sequence(self):
        """Test boot order affects menu item sequence."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add containers with specific boot orders
            containers = [
                ("third", "Third OS", 2),
                ("first", "First OS", 0),
                ("second", "Second OS", 1),
            ]

            for entry_id, name, order in containers:
                mock_entry = create_mock_catalog_entry(
                    entry_id=entry_id,
                    name=name,
                    path=self.test_file
                )
                server._catalog[entry_id] = mock_entry
                server._pxe_containers[entry_id] = PXEContainerInfo(
                    entry_id=entry_id,
                    entry=mock_entry,
                    pxe_enabled=True,
                    pxe_boot_order=order
                )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                content = await resp.text()

                # Find positions of each container
                pos_first = content.find('first')
                pos_second = content.find('second')
                pos_third = content.find('third')

                # Verify order: first < second < third
                self.assertLess(pos_first, pos_second)
                self.assertLess(pos_second, pos_third)

            await server.stop()

        self.run_async(run_test())

    def test_update_boot_order_changes_sequence(self):
        """Test updating boot order changes menu sequence."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add two containers
            for entry_id in ["alpha", "beta"]:
                mock_entry = create_mock_catalog_entry(
                    entry_id=entry_id,
                    name=f"{entry_id.capitalize()} OS",
                    path=self.test_file
                )
                server._catalog[entry_id] = mock_entry
                server._pxe_containers[entry_id] = PXEContainerInfo(
                    entry_id=entry_id,
                    entry=mock_entry,
                    pxe_enabled=True,
                    pxe_boot_order=0 if entry_id == "alpha" else 1
                )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                # Initially alpha before beta
                resp = await client.get('/pxe/menu.ipxe')
                content = await resp.text()
                self.assertLess(content.find('alpha'), content.find('beta'))

                # Swap order
                await client.post('/pxe/alpha/menu', json={'boot_order': 1})
                await client.post('/pxe/beta/menu', json={'boot_order': 0})

                # Now beta before alpha
                resp = await client.get('/pxe/menu.ipxe')
                content = await resp.text()
                self.assertLess(content.find('beta'), content.find('alpha'))

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# Edge Case Tests
# =============================================================================

class TestBootMenuEdgeCases(BootMenuTestBase):
    """Edge case tests for boot menu."""

    def setUp(self):
        """Set up test server."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_menu_with_many_containers(self):
        """Test menu with many containers."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add 20 containers
            for i in range(20):
                entry_id = f"os-{i:02d}"
                mock_entry = create_mock_catalog_entry(
                    entry_id=entry_id,
                    name=f"OS {i}",
                    path=self.test_file
                )
                server._catalog[entry_id] = mock_entry
                server._pxe_containers[entry_id] = PXEContainerInfo(
                    entry_id=entry_id,
                    entry=mock_entry,
                    pxe_enabled=True,
                    pxe_boot_order=i
                )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                # All containers should be present
                for i in range(20):
                    self.assertIn(f'os-{i:02d}', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_with_special_characters_in_name(self):
        """Test menu with special characters in container name."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="special-os",
                name="My-Special_OS (v2.0)",
                path=self.test_file
            )
            server._catalog["special-os"] = mock_entry
            server._pxe_containers["special-os"] = PXEContainerInfo(
                entry_id="special-os",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('special-os', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_with_large_size_container(self):
        """Test menu displays large container size correctly."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="large-os",
                name="Large OS",
                size=5368709120,  # 5GB
                path=self.test_file
            )
            server._catalog["large-os"] = mock_entry
            server._pxe_containers["large-os"] = PXEContainerInfo(
                entry_id="large-os",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('large-os', content)
                # Size should be shown in MB
                self.assertIn('MB', content)

            await server.stop()

        self.run_async(run_test())

    def test_menu_without_distro_info(self):
        """Test menu handles missing distro info gracefully."""
        async def run_test():
            server = HTTPServer(self.config)

            mock_entry = create_mock_catalog_entry(
                entry_id="unknown-distro",
                name="Unknown Distro",
                path=self.test_file
            )
            mock_entry.distro = None  # No distro info
            server._catalog["unknown-distro"] = mock_entry
            server._pxe_containers["unknown-distro"] = PXEContainerInfo(
                entry_id="unknown-distro",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe/menu.ipxe')
                self.assertEqual(resp.status, 200)
                content = await resp.text()
                self.assertIn('unknown-distro', content)
                self.assertIn('Unknown', content)

            await server.stop()

        self.run_async(run_test())

    def test_boot_script_consistency_with_menu(self):
        """Test boot script chains to correct menu URL."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                # Get boot script
                resp = await client.get('/pxe/boot.ipxe')
                boot_content = await resp.text()

                # Extract the URL from boot script
                import re
                match = re.search(r'chain (http://[^\s]+)', boot_content)
                self.assertIsNotNone(match)

                # Should chain to menu.ipxe
                chain_url = match.group(1)
                self.assertIn('/pxe/menu.ipxe', chain_url)

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# Run tests
# =============================================================================

if __name__ == '__main__':
    unittest.main()
