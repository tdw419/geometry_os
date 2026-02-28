"""
Unit tests for HTTP Server components.

Tests cover:
- HTTPServerConfig: configuration validation
- HTTP request handlers: file serving, range requests
- Security: path traversal prevention
- Integration: catalog integration, PXE availability
"""

import asyncio
import os
import shutil
import tempfile
import unittest
from unittest.mock import MagicMock, patch, AsyncMock

from aiohttp import web
from aiohttp.test_utils import TestClient, TestServer, loop_context

from systems.pixel_compiler.pxe.http_server import (
    HTTPServerConfig,
    HTTPServer,
    PXEContainerInfo,
)


# =============================================================================
# Test Fixtures and Helpers
# =============================================================================

# Use a non-standard port range for testing to avoid conflicts
TEST_PORT_COUNTER = 28080

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
        'root_dir': '/tmp/httptest',
        'enable_range_requests': True,
        'watch_paths': None,
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
# HTTPServerConfig Tests
# =============================================================================

class TestHTTPServerConfig(unittest.TestCase):
    """Tests for HTTP server configuration."""

    def test_default_config(self):
        """Test default configuration values."""
        config = HTTPServerConfig()

        self.assertEqual(config.interface, "0.0.0.0")
        self.assertEqual(config.listen_port, 8080)
        self.assertEqual(config.root_dir, "/tftpboot")
        self.assertTrue(config.enable_range_requests)
        self.assertEqual(config.max_file_size, 0)

    def test_custom_config(self):
        """Test custom configuration values."""
        config = HTTPServerConfig(
            interface="192.168.1.1",
            listen_port=3000,
            root_dir="/var/containers",
            enable_range_requests=False,
            max_file_size=1000000,
        )

        self.assertEqual(config.interface, "192.168.1.1")
        self.assertEqual(config.listen_port, 3000)
        self.assertEqual(config.root_dir, "/var/containers")
        self.assertFalse(config.enable_range_requests)
        self.assertEqual(config.max_file_size, 1000000)

    def test_watch_paths_default_none(self):
        """Test watch_paths defaults to None."""
        config = HTTPServerConfig()
        self.assertIsNone(config.watch_paths)

    def test_watch_paths_custom(self):
        """Test custom watch_paths."""
        config = HTTPServerConfig(watch_paths=["/path1", "/path2"])
        self.assertEqual(config.watch_paths, ["/path1", "/path2"])

    def test_use_vision_default_false(self):
        """Test use_vision defaults to False."""
        config = HTTPServerConfig()
        self.assertFalse(config.use_vision)

    def test_use_vision_custom(self):
        """Test custom use_vision."""
        config = HTTPServerConfig(use_vision=True)
        self.assertTrue(config.use_vision)


# =============================================================================
# PXEContainerInfo Tests
# =============================================================================

class TestPXEContainerInfo(unittest.TestCase):
    """Tests for PXE container info tracking."""

    def test_default_pxe_enabled(self):
        """Test PXE enabled by default."""
        entry = create_mock_catalog_entry()
        info = PXEContainerInfo(entry_id=entry.id, entry=entry)

        self.assertTrue(info.pxe_enabled)
        self.assertEqual(info.pxe_boot_order, 0)

    def test_custom_pxe_settings(self):
        """Test custom PXE settings."""
        entry = create_mock_catalog_entry()
        info = PXEContainerInfo(
            entry_id=entry.id,
            entry=entry,
            pxe_enabled=False,
            pxe_boot_order=5
        )

        self.assertFalse(info.pxe_enabled)
        self.assertEqual(info.pxe_boot_order, 5)


# =============================================================================
# HTTP Server Security Tests
# =============================================================================

class TestHTTPServerSecurity(unittest.TestCase):
    """Tests for HTTP server security features."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()
        self.config = create_test_config(root_dir=self.temp_dir)

        # Create test files
        self.test_file = os.path.join(self.temp_dir, "test.rts.png")
        with open(self.test_file, 'wb') as f:
            f.write(b'A' * 1024)  # 1KB file

        self.server = HTTPServer(self.config)

    def tearDown(self):
        """Clean up temp directory."""
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_is_safe_filename_valid(self):
        """Test valid filenames pass safety check."""
        self.assertTrue(self.server._is_safe_filename("test.rts.png"))
        self.assertTrue(self.server._is_safe_filename("my-container.rts.png"))
        self.assertTrue(self.server._is_safe_filename("container_v2.rts.png"))
        self.assertTrue(self.server._is_safe_filename("test.txt"))

    def test_is_safe_filename_path_traversal_parent(self):
        """Test path traversal with .. is blocked."""
        self.assertFalse(self.server._is_safe_filename("../../../etc/passwd"))
        self.assertFalse(self.server._is_safe_filename("..%2F..%2Fetc%2Fpasswd"))
        self.assertFalse(self.server._is_safe_filename("subdir/../../../etc/passwd"))

    def test_is_safe_filename_path_traversal_windows(self):
        """Test Windows-style path traversal is blocked."""
        self.assertFalse(self.server._is_safe_filename("..\\..\\windows\\system32"))
        self.assertFalse(self.server._is_safe_filename("subdir\\..\\..\\windows"))

    def test_is_safe_filename_absolute_path(self):
        """Test absolute paths are blocked."""
        self.assertFalse(self.server._is_safe_filename("/etc/passwd"))
        self.assertFalse(self.server._is_safe_filename("/var/log/auth.log"))

    def test_is_safe_filename_hidden_file(self):
        """Test hidden files are blocked."""
        self.assertFalse(self.server._is_safe_filename(".hidden.rts.png"))
        self.assertFalse(self.server._is_safe_filename(".ssh"))
        self.assertFalse(self.server._is_safe_filename(".gitignore"))

    def test_is_safe_filename_subdirectory(self):
        """Test subdirectory access is blocked."""
        self.assertFalse(self.server._is_safe_filename("subdir/file.rts.png"))
        self.assertFalse(self.server._is_safe_filename("path/to/file.rts.png"))

    def test_is_safe_filename_empty(self):
        """Test empty filename is allowed (will fail elsewhere)."""
        # Empty filename passes safety check but will fail file existence
        self.assertTrue(self.server._is_safe_filename(""))


# =============================================================================
# HTTP Server Lifecycle Tests
# =============================================================================

class TestHTTPServerLifecycle(unittest.TestCase):
    """Tests for HTTP server lifecycle."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()

    def tearDown(self):
        """Clean up temp directory."""
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_server_initialization(self):
        """Test server initialization."""
        config = create_test_config(root_dir=self.temp_dir)
        server = HTTPServer(config)

        self.assertEqual(server.config, config)
        self.assertIsNone(server._app)
        self.assertIsNone(server._runner)
        self.assertIsNone(server._site)

    def test_server_catalog_initialization_empty(self):
        """Test server catalog starts empty."""
        config = create_test_config(root_dir=self.temp_dir)
        server = HTTPServer(config)

        self.assertEqual(server._catalog, {})
        self.assertEqual(server._pxe_containers, {})
        self.assertIsNone(server._scanner)

    def test_server_with_watch_paths_no_scanner(self):
        """Test server with watch_paths when scanner unavailable."""
        config = create_test_config(
            root_dir=self.temp_dir,
            watch_paths=[self.temp_dir]
        )
        server = HTTPServer(config)

        # Scanner should be None without start() being called
        self.assertIsNone(server._scanner)

    def test_server_start_stop(self):
        """Test server start and stop lifecycle."""
        config = create_test_config(root_dir=self.temp_dir)
        server = HTTPServer(config)

        async def run_test():
            await server.start()
            self.assertIsNotNone(server._app)
            self.assertIsNotNone(server._runner)
            self.assertIsNotNone(server._site)

            await server.stop()
            # After stop, runner should be cleaned up

        asyncio.run(run_test())


# =============================================================================
# HTTP Server Method Tests
# =============================================================================

class TestHTTPServerMethods(unittest.TestCase):
    """Tests for HTTP server methods."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()

    def tearDown(self):
        """Clean up temp directory."""
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_serve_full_returns_file_response(self):
        """Test _serve_full returns FileResponse."""
        config = create_test_config(root_dir=self.temp_dir)
        server = HTTPServer(config)

        # Create test file
        test_file = os.path.join(self.temp_dir, "test.rts.png")
        with open(test_file, 'wb') as f:
            f.write(b'TESTDATA')

        # Create mock request
        mock_request = MagicMock()
        mock_request.remote = "192.168.1.100"

        async def run_test():
            response = await server._serve_full(
                mock_request, test_file, 8, "192.168.1.100"
            )
            self.assertIsInstance(response, web.FileResponse)
            self.assertEqual(response.headers.get('Content-Length'), '8')
            self.assertEqual(response.headers.get('Accept-Ranges'), 'bytes')

        asyncio.run(run_test())

    def test_server_without_range_requests(self):
        """Test server with range requests disabled."""
        config = create_test_config(
            root_dir=self.temp_dir,
            enable_range_requests=False
        )
        server = HTTPServer(config)

        self.assertFalse(server.config.enable_range_requests)


# =============================================================================
# HTTP Catalog Integration Tests
# =============================================================================

class TestHTTPCatalogIntegration(unittest.TestCase):
    """Tests for HTTP server catalog integration."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()

    def tearDown(self):
        """Clean up temp directory."""
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_catalog_refresh_without_scanner(self):
        """Test catalog refresh returns 0 without scanner."""
        config = create_test_config(root_dir=self.temp_dir)
        server = HTTPServer(config)

        # No scanner configured
        count = server._refresh_catalog()
        self.assertEqual(count, 0)

    def test_set_pxe_availability_existing(self):
        """Test setting PXE availability for existing container."""
        config = create_test_config(root_dir=self.temp_dir)
        server = HTTPServer(config)

        # Add a mock PXE container
        entry = create_mock_catalog_entry()
        server._pxe_containers[entry.id] = PXEContainerInfo(
            entry_id=entry.id,
            entry=entry,
            pxe_enabled=True
        )

        # Disable PXE
        result = server.set_pxe_availability(entry.id, False)
        self.assertTrue(result)
        self.assertFalse(server._pxe_containers[entry.id].pxe_enabled)

        # Re-enable PXE
        result = server.set_pxe_availability(entry.id, True)
        self.assertTrue(result)
        self.assertTrue(server._pxe_containers[entry.id].pxe_enabled)

    def test_set_pxe_availability_nonexistent(self):
        """Test setting PXE availability for non-existent container."""
        config = create_test_config(root_dir=self.temp_dir)
        server = HTTPServer(config)

        result = server.set_pxe_availability("nonexistent", True)
        self.assertFalse(result)

    def test_get_pxe_containers_filters_disabled(self):
        """Test get_pxe_containers only returns enabled containers."""
        config = create_test_config(root_dir=self.temp_dir)
        server = HTTPServer(config)

        # Add containers with different PXE states
        entry1 = create_mock_catalog_entry("container1", "Container 1")
        entry2 = create_mock_catalog_entry("container2", "Container 2")

        server._pxe_containers["container1"] = PXEContainerInfo(
            entry_id="container1",
            entry=entry1,
            pxe_enabled=True
        )
        server._pxe_containers["container2"] = PXEContainerInfo(
            entry_id="container2",
            entry=entry2,
            pxe_enabled=False
        )

        # Only enabled containers should be returned
        pxe_list = server.get_pxe_containers()
        self.assertEqual(len(pxe_list), 1)
        self.assertEqual(pxe_list[0].entry_id, "container1")


# =============================================================================
# HTTP Integration Tests Base Class
# =============================================================================

class HTTPIntegrationTestBase(unittest.TestCase):
    """Base class for HTTP integration tests with proper async setup."""

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
# HTTP Integration Tests using aiohttp test client
# =============================================================================

class TestHTTPIntegration(HTTPIntegrationTestBase):
    """Integration tests using aiohttp test client."""

    def setUp(self):
        """Set up test server."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_index_endpoint(self):
        """Test GET / returns server info."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/')
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertIn('server', data)
                self.assertIn('endpoints', data)
                self.assertEqual(data['server'], 'PixelRTS PXE HTTP Server')

            await server.stop()

        self.run_async(run_test())

    def test_index_endpoint_contains_config(self):
        """Test GET / contains config info."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/')
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertIn('config', data)
                self.assertTrue(data['config']['range_requests'])

            await server.stop()

        self.run_async(run_test())

    def test_containers_endpoint_with_file(self):
        """Test GET /containers lists available containers."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/containers')
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertEqual(len(data['containers']), 1)
                self.assertEqual(data['containers'][0]['name'], 'test.rts.png')

            await server.stop()

        self.run_async(run_test())

    def test_containers_endpoint_empty(self):
        """Test GET /containers with no containers."""
        async def run_test():
            # Remove test file
            os.remove(self.test_file)

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/containers')
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertEqual(data['containers'], [])
                self.assertEqual(data['count'], 0)

            await server.stop()

        self.run_async(run_test())

    def test_file_download(self):
        """Test downloading a file."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/files/test.rts.png')
                self.assertEqual(resp.status, 200)
                content = await resp.read()
                self.assertEqual(len(content), 1024)
                self.assertEqual(content, b'B' * 1024)

            await server.stop()

        self.run_async(run_test())

    def test_file_download_content_type(self):
        """Test file download has content type header."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/files/test.rts.png')
                self.assertEqual(resp.status, 200)
                # FileResponse sets content type based on extension
                # .png files get image/png, which is fine for our use case
                self.assertIsNotNone(resp.headers.get('Content-Type'))

            await server.stop()

        self.run_async(run_test())

    def test_file_download_accept_ranges(self):
        """Test file download includes Accept-Ranges header."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/files/test.rts.png')
                self.assertEqual(resp.status, 200)
                self.assertEqual(resp.headers.get('Accept-Ranges'), 'bytes')

            await server.stop()

        self.run_async(run_test())

    def test_file_not_found(self):
        """Test 404 for missing file."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/files/nonexistent.rts.png')
                self.assertEqual(resp.status, 404)

            await server.stop()

        self.run_async(run_test())

    def test_file_non_rts_png_rejected(self):
        """Test non-.rts.png files are rejected."""
        async def run_test():
            # Create a .txt file
            txt_file = os.path.join(self.temp_dir, "test.txt")
            with open(txt_file, 'wb') as f:
                f.write(b'text content')

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/files/test.txt')
                self.assertEqual(resp.status, 404)

            await server.stop()

        self.run_async(run_test())

    def test_path_traversal_blocked(self):
        """Test path traversal is blocked."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/files/../../../etc/passwd')
                # Should get 400 (bad request) for unsafe filename
                self.assertIn(resp.status, [400, 404])

            await server.stop()

        self.run_async(run_test())

    def test_hidden_file_blocked(self):
        """Test hidden file access is blocked."""
        async def run_test():
            # Create a hidden file
            hidden_file = os.path.join(self.temp_dir, ".hidden.rts.png")
            with open(hidden_file, 'wb') as f:
                f.write(b'hidden')

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/files/.hidden.rts.png')
                self.assertEqual(resp.status, 400)

            await server.stop()

        self.run_async(run_test())

    def test_range_request_first_half(self):
        """Test HTTP range request for first half."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=0-511'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 206)
                self.assertIn('Content-Range', resp.headers)
                content = await resp.read()
                self.assertEqual(len(content), 512)

            await server.stop()

        self.run_async(run_test())

    def test_range_request_second_half(self):
        """Test HTTP range request for second half."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=512-1023'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 206)
                content = await resp.read()
                self.assertEqual(len(content), 512)

            await server.stop()

        self.run_async(run_test())

    def test_range_request_middle(self):
        """Test HTTP range request for middle of file."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=256-767'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 206)
                content = await resp.read()
                self.assertEqual(len(content), 512)

            await server.stop()

        self.run_async(run_test())

    def test_range_request_single_byte(self):
        """Test HTTP range request for single byte."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=0-0'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 206)
                content = await resp.read()
                self.assertEqual(len(content), 1)
                self.assertEqual(content, b'B')

            await server.stop()

        self.run_async(run_test())

    def test_range_request_content_range_header(self):
        """Test Content-Range header format."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=0-511'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 206)
                self.assertEqual(resp.headers['Content-Range'], 'bytes 0-511/1024')

            await server.stop()

        self.run_async(run_test())

    def test_range_request_open_ended(self):
        """Test range request without end (to end of file)."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=512-'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 206)
                content = await resp.read()
                self.assertEqual(len(content), 512)

            await server.stop()

        self.run_async(run_test())

    def test_invalid_range_format(self):
        """Test invalid range request format."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'invalid'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 416)  # Range Not Satisfiable

            await server.stop()

        self.run_async(run_test())

    def test_range_beyond_file_size(self):
        """Test range request beyond file size returns 416."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=0-9999'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 416)

            await server.stop()

        self.run_async(run_test())

    def test_range_start_beyond_file_size(self):
        """Test range request starting beyond file size."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=2000-3000'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 416)

            await server.stop()

        self.run_async(run_test())

    def test_range_invalid_unit(self):
        """Test range request with invalid unit."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bits=0-511'}
                resp = await client.get('/files/test.rts.png', headers=headers)
                self.assertEqual(resp.status, 416)

            await server.stop()

        self.run_async(run_test())

    def test_pxe_list_endpoint(self):
        """Test GET /pxe lists PXE-enabled containers."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/pxe')
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertIn('pxe_containers', data)
                self.assertIn('count', data)

            await server.stop()

        self.run_async(run_test())

    def test_catalog_refresh_without_scanner(self):
        """Test catalog refresh when scanner not enabled."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post('/catalog/refresh')
                # Should return 400 since scanner not enabled
                self.assertEqual(resp.status, 400)

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# HTTP Edge Case Tests
# =============================================================================

class TestHTTPEdgeCases(HTTPIntegrationTestBase):
    """Edge case tests for HTTP server."""

    def setUp(self):
        """Set up test server."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_large_file_multiple_ranges(self):
        """Test downloading large file with multiple range requests."""
        async def run_test():
            # Create large file (100KB)
            large_file = os.path.join(self.temp_dir, "large.rts.png")
            with open(large_file, 'wb') as f:
                f.write(b'X' * 102400)

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                # First range
                headers = {'Range': 'bytes=0-65535'}
                resp = await client.get('/files/large.rts.png', headers=headers)
                self.assertEqual(resp.status, 206)
                content = await resp.read()
                self.assertEqual(len(content), 65536)

                # Second range
                headers = {'Range': 'bytes=65536-102399'}
                resp = await client.get('/files/large.rts.png', headers=headers)
                self.assertEqual(resp.status, 206)
                content = await resp.read()
                self.assertEqual(len(content), 36864)

            await server.stop()

        self.run_async(run_test())

    def test_empty_file(self):
        """Test downloading empty file."""
        async def run_test():
            empty_file = os.path.join(self.temp_dir, "empty.rts.png")
            open(empty_file, 'wb').close()

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/files/empty.rts.png')
                self.assertEqual(resp.status, 200)
                content = await resp.read()
                self.assertEqual(len(content), 0)

            await server.stop()

        self.run_async(run_test())

    def test_empty_file_range_request(self):
        """Test range request on empty file."""
        async def run_test():
            empty_file = os.path.join(self.temp_dir, "empty.rts.png")
            open(empty_file, 'wb').close()

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=0-0'}
                resp = await client.get('/files/empty.rts.png', headers=headers)
                # Empty file can't satisfy range requests
                self.assertEqual(resp.status, 416)

            await server.stop()

        self.run_async(run_test())

    def test_multiple_range_requests_sequential(self):
        """Test sequential range requests simulate resumable download."""
        async def run_test():
            # Create file
            test_file = os.path.join(self.temp_dir, "chunked.rts.png")
            file_data = b'CHUNK' * 2048  # 10KB
            with open(test_file, 'wb') as f:
                f.write(file_data)

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                # Request first chunk
                headers = {'Range': 'bytes=0-5119'}
                resp1 = await client.get('/files/chunked.rts.png', headers=headers)
                self.assertEqual(resp1.status, 206)
                chunk1 = await resp1.read()
                self.assertEqual(len(chunk1), 5120)

                # Request second chunk
                headers = {'Range': 'bytes=5120-10239'}
                resp2 = await client.get('/files/chunked.rts.png', headers=headers)
                self.assertEqual(resp2.status, 206)
                chunk2 = await resp2.read()
                self.assertEqual(len(chunk2), 5120)

                # Verify combined data matches original
                self.assertEqual(chunk1 + chunk2, file_data)

            await server.stop()

        self.run_async(run_test())

    def test_range_request_data_integrity(self):
        """Test that range request returns correct data."""
        async def run_test():
            # Create file with known content
            test_file = os.path.join(self.temp_dir, "integrity.rts.png")
            original_data = bytes(range(256)) * 4  # 1024 bytes with pattern
            with open(test_file, 'wb') as f:
                f.write(original_data)

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                # Request middle section
                headers = {'Range': 'bytes=256-511'}
                resp = await client.get('/files/integrity.rts.png', headers=headers)
                self.assertEqual(resp.status, 206)
                content = await resp.read()

                # Verify data matches expected slice
                expected = original_data[256:512]
                self.assertEqual(content, expected)

            await server.stop()

        self.run_async(run_test())

    def test_concurrent_downloads(self):
        """Test multiple concurrent downloads."""
        async def run_test():
            # Create file
            test_file = os.path.join(self.temp_dir, "concurrent.rts.png")
            with open(test_file, 'wb') as f:
                f.write(b'C' * 5000)

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                # Make multiple concurrent requests
                tasks = [
                    client.get('/files/concurrent.rts.png')
                    for _ in range(5)
                ]
                responses = await asyncio.gather(*tasks)

                # All should succeed
                for resp in responses:
                    self.assertEqual(resp.status, 200)
                    content = await resp.read()
                    self.assertEqual(len(content), 5000)

            await server.stop()

        self.run_async(run_test())

    def test_special_characters_in_filename(self):
        """Test filename with special characters."""
        async def run_test():
            # Create file with dashes and underscores
            test_file = os.path.join(self.temp_dir, "my-container_v2.rts.png")
            with open(test_file, 'wb') as f:
                f.write(b'SPECIAL')

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/files/my-container_v2.rts.png')
                self.assertEqual(resp.status, 200)
                content = await resp.read()
                self.assertEqual(content, b'SPECIAL')

            await server.stop()

        self.run_async(run_test())

    def test_long_filename(self):
        """Test long filename handling."""
        async def run_test():
            long_name = "a" * 200 + ".rts.png"
            test_file = os.path.join(self.temp_dir, long_name)
            with open(test_file, 'wb') as f:
                f.write(b'LONG')

            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get(f'/files/{long_name}')
                self.assertEqual(resp.status, 200)
                content = await resp.read()
                self.assertEqual(content, b'LONG')

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# HTTP Container by ID Tests
# =============================================================================

class TestHTTPContainerById(HTTPIntegrationTestBase):
    """Tests for container-by-ID endpoint."""

    def setUp(self):
        """Set up test server with catalog."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_container_by_id_found(self):
        """Test downloading container by catalog ID."""
        async def run_test():
            # Create test file
            test_file = os.path.join(self.temp_dir, "catalog.rts.png")
            with open(test_file, 'wb') as f:
                f.write(b'C' * 2048)

            server = HTTPServer(self.config)

            # Add mock catalog entry
            mock_entry = create_mock_catalog_entry(
                entry_id="test-container",
                name="Test Container",
                size=2048,
                path=test_file
            )
            server._catalog["test-container"] = mock_entry
            server._pxe_containers["test-container"] = PXEContainerInfo(
                entry_id="test-container",
                entry=mock_entry
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/containers/test-container')
                self.assertEqual(resp.status, 200)
                content = await resp.read()
                self.assertEqual(len(content), 2048)

            await server.stop()

        self.run_async(run_test())

    def test_container_by_id_not_found(self):
        """Test 404 for non-existent container ID."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/containers/nonexistent-id')
                self.assertEqual(resp.status, 404)

            await server.stop()

        self.run_async(run_test())

    def test_container_by_id_range_request(self):
        """Test range request on container-by-ID endpoint."""
        async def run_test():
            # Create test file
            test_file = os.path.join(self.temp_dir, "catalog.rts.png")
            with open(test_file, 'wb') as f:
                f.write(b'C' * 2048)

            server = HTTPServer(self.config)

            # Add mock catalog entry
            mock_entry = create_mock_catalog_entry(
                entry_id="test-container",
                name="Test Container",
                size=2048,
                path=test_file
            )
            server._catalog["test-container"] = mock_entry
            server._pxe_containers["test-container"] = PXEContainerInfo(
                entry_id="test-container",
                entry=mock_entry
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                headers = {'Range': 'bytes=0-1023'}
                resp = await client.get('/containers/test-container', headers=headers)
                self.assertEqual(resp.status, 206)
                content = await resp.read()
                self.assertEqual(len(content), 1024)

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# HTTP PXE Toggle Tests
# =============================================================================

class TestHTTPPXEToggle(HTTPIntegrationTestBase):
    """Tests for PXE toggle endpoint."""

    def setUp(self):
        """Set up test server with PXE containers."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_pxe_toggle_disable(self):
        """Test disabling PXE for a container."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add mock catalog entry
            mock_entry = create_mock_catalog_entry(
                entry_id="pxe-container",
                name="PXE Container",
                size=1024,
                path=self.test_file
            )
            server._catalog["pxe-container"] = mock_entry
            server._pxe_containers["pxe-container"] = PXEContainerInfo(
                entry_id="pxe-container",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post(
                    '/pxe/pxe-container/toggle',
                    json={'enabled': False}
                )
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertTrue(data['success'])
                self.assertFalse(data['pxe_enabled'])

                # Verify it's removed from PXE list
                resp2 = await client.get('/pxe')
                data2 = await resp2.json()
                self.assertEqual(data2['count'], 0)

            await server.stop()

        self.run_async(run_test())

    def test_pxe_toggle_enable(self):
        """Test enabling PXE for a container."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add mock catalog entry
            mock_entry = create_mock_catalog_entry(
                entry_id="pxe-container",
                name="PXE Container",
                size=1024,
                path=self.test_file
            )
            server._catalog["pxe-container"] = mock_entry
            server._pxe_containers["pxe-container"] = PXEContainerInfo(
                entry_id="pxe-container",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                # First disable
                await client.post('/pxe/pxe-container/toggle', json={'enabled': False})

                # Then re-enable
                resp = await client.post(
                    '/pxe/pxe-container/toggle',
                    json={'enabled': True}
                )
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertTrue(data['success'])
                self.assertTrue(data['pxe_enabled'])

            await server.stop()

        self.run_async(run_test())

    def test_pxe_toggle_nonexistent(self):
        """Test toggling PXE for non-existent container."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post('/pxe/nonexistent/toggle', json={'enabled': True})
                self.assertEqual(resp.status, 404)

            await server.stop()

        self.run_async(run_test())

    def test_pxe_toggle_default_enabled(self):
        """Test toggle without body defaults to enabled."""
        async def run_test():
            server = HTTPServer(self.config)

            # Add mock catalog entry
            mock_entry = create_mock_catalog_entry(
                entry_id="pxe-container",
                name="PXE Container",
                size=1024,
                path=self.test_file
            )
            server._catalog["pxe-container"] = mock_entry
            server._pxe_containers["pxe-container"] = PXEContainerInfo(
                entry_id="pxe-container",
                entry=mock_entry,
                pxe_enabled=True
            )

            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post('/pxe/pxe-container/toggle')
                self.assertEqual(resp.status, 200)
                data = await resp.json()
                self.assertTrue(data['pxe_enabled'])

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# HTTP Error Handling Tests
# =============================================================================

class TestHTTPErrorHandling(HTTPIntegrationTestBase):
    """Tests for HTTP error handling."""

    def setUp(self):
        """Set up test server."""
        super().setUp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def test_unknown_endpoint(self):
        """Test unknown endpoint returns 404."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.get('/unknown')
                self.assertEqual(resp.status, 404)

            await server.stop()

        self.run_async(run_test())

    def test_method_not_allowed(self):
        """Test POST to GET-only endpoint."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.post('/files/test.rts.png')
                self.assertEqual(resp.status, 405)

            await server.stop()

        self.run_async(run_test())

    def test_containers_by_id_delete_not_allowed(self):
        """Test DELETE method not allowed on containers."""
        async def run_test():
            server = HTTPServer(self.config)
            await server.start()

            async with TestClient(TestServer(server._app)) as client:
                resp = await client.delete('/containers/test-id')
                self.assertEqual(resp.status, 405)

            await server.stop()

        self.run_async(run_test())


# =============================================================================
# Run tests
# =============================================================================

if __name__ == '__main__':
    unittest.main()
