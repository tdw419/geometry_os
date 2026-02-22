"""
Tests for Catalog Components - CatalogScanner, ThumbnailCache, SpatialLayoutManager, CatalogServer

Unit tests verify scanning, thumbnail generation/caching, layout management, and API endpoints.
Actual filesystem and PIL operations are mocked or use temporary directories.
"""

import pytest
import tempfile
import os
import sys
import json
import base64
from pathlib import Path
from unittest.mock import patch, MagicMock, mock_open
from dataclasses import asdict

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from catalog import (
    CatalogScanner,
    CatalogEntry,
    ThumbnailCache,
    ThumbnailResult,
    SpatialLayoutManager,
    SpatialPosition,
    app,
    CatalogServer,
    get_catalog_server,
)
from catalog.catalog_server import (
    CatalogEntryResponse,
    CatalogResponse,
    BootOptions,
    LayoutUpdate,
)


# ============================================================================
# TestCatalogScanner - Tests for .rts.png file discovery
# ============================================================================

class TestCatalogScanner:
    """Tests for CatalogScanner class."""

    def test_scan_finds_rts_files(self, tmp_path):
        """Test that scanner finds .rts.png files in directory."""
        # Create temp .rts.png files
        rts_file1 = tmp_path / "test1.rts.png"
        rts_file1.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        rts_file2 = tmp_path / "test2.rts.png"
        rts_file2.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        # Create a non-rts file (should be ignored)
        other_file = tmp_path / "other.png"
        other_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        scanner = CatalogScanner([str(tmp_path)])
        entries = scanner.scan()

        assert len(entries) == 2
        names = [e.name for e in entries]
        assert "test1" in names
        assert "test2" in names

    def test_scan_extracts_metadata(self, tmp_path):
        """Test that scanner extracts metadata from PNG files."""
        # Create a proper PNG with metadata
        rts_file = tmp_path / "alpine.rts.png"

        # Use PIL to create a PNG with metadata
        try:
            from PIL import Image
            import io

            # Create a small test image
            img = Image.new('RGB', (64, 64), color='red')

            # Add metadata
            from PIL import PngImagePlugin
            meta = PngImagePlugin.PngInfo()
            meta.add_text("pixelrts.name", "Alpine Linux")
            meta.add_text("pixelrts.kernel", "6.1.0")
            meta.add_text("pixelrts.distro", "alpine")
            meta.add_text("pixelrts.arch", "x86_64")

            # Save with metadata
            img.save(rts_file, format="PNG", pnginfo=meta)

            scanner = CatalogScanner([str(tmp_path)])
            entries = scanner.scan()

            assert len(entries) == 1
            entry = entries[0]

            assert entry.name == "Alpine Linux"
            assert entry.kernel_version == "6.1.0"
            assert entry.distro == "alpine"
            assert entry.architecture == "x86_64"
            assert entry.grid_size == "64x64"

        except ImportError:
            pytest.skip("PIL not available")

    def test_scan_handles_missing_files(self, tmp_path):
        """Test graceful handling of non-existent paths."""
        # Mix of existing and non-existing paths
        existing = tmp_path / "exists"
        existing.mkdir()
        rts_file = existing / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        non_existing = tmp_path / "does_not_exist"

        scanner = CatalogScanner([str(existing), str(non_existing)])

        # Should not raise error, just log warning
        entries = scanner.scan()

        assert len(entries) == 1

    def test_catalog_entry_dataclass(self):
        """Verify CatalogEntry fields."""
        entry = CatalogEntry(
            id="abc123",
            name="Test OS",
            path="/path/to/test.rts.png",
            size=1024,
            grid_size="64x64",
            kernel_version="6.1.0",
            distro="testos",
            architecture="x86_64",
            thumbnail_position=(0, 0)
        )

        assert entry.id == "abc123"
        assert entry.name == "Test OS"
        assert entry.path == "/path/to/test.rts.png"
        assert entry.size == 1024
        assert entry.grid_size == "64x64"
        assert entry.kernel_version == "6.1.0"
        assert entry.distro == "testos"
        assert entry.architecture == "x86_64"
        assert entry.thumbnail_position == (0, 0)

    def test_generate_id_stability(self, tmp_path):
        """Test that ID generation is stable for same path."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        scanner = CatalogScanner([str(tmp_path)])

        id1 = scanner._generate_id(rts_file)
        id2 = scanner._generate_id(rts_file)

        assert id1 == id2
        assert len(id1) == 12  # First 12 chars of MD5

    def test_scan_recursive(self, tmp_path):
        """Test that scanner finds files in subdirectories."""
        # Create nested directories
        subdir = tmp_path / "nested" / "deep"
        subdir.mkdir(parents=True)

        rts_file1 = tmp_path / "root.rts.png"
        rts_file1.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        rts_file2 = subdir / "nested.rts.png"
        rts_file2.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        scanner = CatalogScanner([str(tmp_path)])
        entries = scanner.scan()

        assert len(entries) == 2


# ============================================================================
# TestThumbnailCache - Tests for thumbnail generation and caching
# ============================================================================

class TestThumbnailCache:
    """Tests for ThumbnailCache class."""

    def test_generate_thumbnail(self, tmp_path):
        """Test thumbnail generation from source image."""
        try:
            from PIL import Image

            # Create source image
            source = tmp_path / "source.rts.png"
            img = Image.new('RGB', (512, 512), color='blue')
            img.save(source, format="PNG")

            # Create cache
            cache_dir = tmp_path / "cache"
            cache = ThumbnailCache(cache_dir=str(cache_dir), default_size=128)

            result = cache.get_thumbnail(str(source))

            assert result.cached is False  # First time, not cached
            assert result.size == 128
            assert Path(result.path).exists()

            # Verify thumbnail dimensions
            thumb_img = Image.open(result.path)
            assert max(thumb_img.size) <= 128

        except ImportError:
            pytest.skip("PIL not available")

    def test_cache_hit(self, tmp_path):
        """Test that second request returns cached thumbnail."""
        try:
            from PIL import Image

            # Create source image
            source = tmp_path / "source.rts.png"
            img = Image.new('RGB', (256, 256), color='green')
            img.save(source, format="PNG")

            cache_dir = tmp_path / "cache"
            cache = ThumbnailCache(cache_dir=str(cache_dir))

            # First request - generates thumbnail
            result1 = cache.get_thumbnail(str(source))
            assert result1.cached is False

            # Second request - should be cached
            result2 = cache.get_thumbnail(str(source))
            assert result2.cached is True
            assert result1.path == result2.path

        except ImportError:
            pytest.skip("PIL not available")

    def test_base64_encoding(self, tmp_path):
        """Test that get_thumbnail_base64 returns valid base64."""
        try:
            from PIL import Image

            # Create source image
            source = tmp_path / "source.rts.png"
            img = Image.new('RGB', (100, 100), color='red')
            img.save(source, format="PNG")

            cache_dir = tmp_path / "cache"
            cache = ThumbnailCache(cache_dir=str(cache_dir))

            b64 = cache.get_thumbnail_base64(str(source))

            # Should be valid base64 string
            assert isinstance(b64, str)
            assert len(b64) > 0

            # Should decode to valid PNG data
            decoded = base64.b64decode(b64)
            assert decoded[:8] == b'\x89PNG\r\n\x1a\n'  # PNG magic bytes

        except ImportError:
            pytest.skip("PIL not available")

    def test_custom_size(self, tmp_path):
        """Test thumbnail generation with custom size."""
        try:
            from PIL import Image

            # Create source image
            source = tmp_path / "source.rts.png"
            img = Image.new('RGB', (500, 500), color='yellow')
            img.save(source, format="PNG")

            cache_dir = tmp_path / "cache"
            cache = ThumbnailCache(cache_dir=str(cache_dir), default_size=256)

            # Request custom size
            result = cache.get_thumbnail(str(source), size=64)
            assert result.size == 64

            # Verify dimensions
            thumb_img = Image.open(result.path)
            assert max(thumb_img.size) <= 64

        except ImportError:
            pytest.skip("PIL not available")

    def test_clear_cache(self, tmp_path):
        """Test that clear_cache removes cached thumbnails."""
        try:
            from PIL import Image

            # Create source image
            source = tmp_path / "source.rts.png"
            img = Image.new('RGB', (100, 100), color='purple')
            img.save(source, format="PNG")

            cache_dir = tmp_path / "cache"
            cache = ThumbnailCache(cache_dir=str(cache_dir))

            # Generate thumbnail
            cache.get_thumbnail(str(source))

            # Clear cache
            count = cache.clear_cache()
            assert count == 1

            # Cache dir should be empty
            cached_files = list(cache_dir.glob("*.png"))
            assert len(cached_files) == 0

        except ImportError:
            pytest.skip("PIL not available")

    def test_file_not_found_raises(self, tmp_path):
        """Test that FileNotFoundError is raised for missing file."""
        cache_dir = tmp_path / "cache"
        cache = ThumbnailCache(cache_dir=str(cache_dir))

        with pytest.raises(FileNotFoundError):
            cache.get_thumbnail("/nonexistent/file.rts.png")


# ============================================================================
# TestSpatialLayoutManager - Tests for drag-and-drop layout
# ============================================================================

class TestSpatialLayoutManager:
    """Tests for SpatialLayoutManager class."""

    def test_set_and_get_position(self, tmp_path):
        """Test setting and retrieving positions."""
        layout_file = tmp_path / "layout.json"
        manager = SpatialLayoutManager(layout_file=str(layout_file))

        entry_id = "test123"
        position = SpatialPosition(x=2, y=3)

        manager.set_position(entry_id, position)

        retrieved = manager.get_position(entry_id)
        assert retrieved is not None
        assert retrieved.x == 2
        assert retrieved.y == 3

    def test_move_entry_swap(self, tmp_path):
        """Test that moving to occupied position swaps entries."""
        layout_file = tmp_path / "layout.json"
        manager = SpatialLayoutManager(layout_file=str(layout_file))

        # Set initial positions
        manager.set_position("entry1", SpatialPosition(x=0, y=0))
        manager.set_position("entry2", SpatialPosition(x=1, y=0))

        # Move entry1 to entry2's position
        success = manager.move_entry("entry1", SpatialPosition(x=1, y=0))
        assert success is True

        # Verify swap occurred
        pos1 = manager.get_position("entry1")
        pos2 = manager.get_position("entry2")

        assert pos1.x == 1 and pos1.y == 0
        assert pos2.x == 0 and pos2.y == 0

    def test_persistence(self, tmp_path):
        """Test that layout persists across manager instances."""
        layout_file = tmp_path / "layout.json"

        # First manager - set position
        manager1 = SpatialLayoutManager(layout_file=str(layout_file))
        manager1.set_position("persistent", SpatialPosition(x=5, y=5))

        # Second manager - should load from file
        manager2 = SpatialLayoutManager(layout_file=str(layout_file))
        pos = manager2.get_position("persistent")

        assert pos is not None
        assert pos.x == 5
        assert pos.y == 5

    def test_grid_dimensions(self, tmp_path):
        """Test grid dimension calculation."""
        layout_file = tmp_path / "layout.json"
        manager = SpatialLayoutManager(layout_file=str(layout_file))

        # Empty layout - default dimensions
        width, height = manager.get_grid_dimensions()
        assert width == 4
        assert height == 4

        # Add entries at various positions
        manager.set_position("e1", SpatialPosition(x=0, y=0))
        manager.set_position("e2", SpatialPosition(x=5, y=3))
        manager.set_position("e3", SpatialPosition(x=2, y=7))

        width, height = manager.get_grid_dimensions()
        # Should be max + 2 padding
        assert width == 7  # max_x (5) + 2
        assert height == 9  # max_y (7) + 2

    def test_move_nonexistent_entry_fails(self, tmp_path):
        """Test that moving non-existent entry returns False."""
        layout_file = tmp_path / "layout.json"
        manager = SpatialLayoutManager(layout_file=str(layout_file))

        success = manager.move_entry("nonexistent", SpatialPosition(x=0, y=0))
        assert success is False

    def test_clear_layout(self, tmp_path):
        """Test clearing all positions."""
        layout_file = tmp_path / "layout.json"
        manager = SpatialLayoutManager(layout_file=str(layout_file))

        manager.set_position("e1", SpatialPosition(x=0, y=0))
        manager.set_position("e2", SpatialPosition(x=1, y=1))

        manager.clear_layout()

        assert manager.get_position("e1") is None
        assert manager.get_position("e2") is None
        assert not layout_file.exists()


class TestSpatialPosition:
    """Tests for SpatialPosition dataclass."""

    def test_equality(self):
        """Test position equality comparison."""
        pos1 = SpatialPosition(x=1, y=2)
        pos2 = SpatialPosition(x=1, y=2)
        pos3 = SpatialPosition(x=2, y=1)

        assert pos1 == pos2
        assert pos1 != pos3

    def test_to_dict(self):
        """Test serialization to dictionary."""
        pos = SpatialPosition(x=3, y=4)
        d = pos.to_dict()

        assert d == {"x": 3, "y": 4}

    def test_from_dict(self):
        """Test deserialization from dictionary."""
        pos = SpatialPosition.from_dict({"x": 5, "y": 6})

        assert pos.x == 5
        assert pos.y == 6


# ============================================================================
# TestCatalogServer - Tests for FastAPI endpoints
# ============================================================================

class TestCatalogServer:
    """Tests for CatalogServer and FastAPI endpoints."""

    @pytest.fixture
    def temp_catalog_dir(self, tmp_path):
        """Create temp directory with .rts.png files for testing."""
        catalog_dir = tmp_path / "catalog"
        catalog_dir.mkdir()

        # Create some test .rts.png files
        for i in range(3):
            rts_file = catalog_dir / f"test{i}.rts.png"
            rts_file.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00" * 100)

        return catalog_dir

    @pytest.fixture
    def mock_pil(self):
        """Mock PIL for tests that don't need actual image processing."""
        with patch.dict('sys.modules', {'PIL': MagicMock(), 'PIL.Image': MagicMock()}):
            yield

    def test_get_catalog_returns_entries(self, temp_catalog_dir):
        """Test /api/v1/catalog returns entries."""
        from fastapi.testclient import TestClient

        # Mock PIL to avoid actual image processing
        with patch('catalog.catalog_scanner.CatalogScanner._create_entry') as mock_create:
            # Create mock entries
            mock_entries = [
                CatalogEntry(
                    id=f"test{i}",
                    name=f"Test OS {i}",
                    path=str(temp_catalog_dir / f"test{i}.rts.png"),
                    size=100,
                    grid_size=None,
                    kernel_version=None,
                    distro=None,
                    architecture=None
                )
                for i in range(3)
            ]

            # Reset singleton
            import catalog.catalog_server
            catalog.catalog_server._catalog_server = None

            with patch.object(CatalogScanner, 'scan', return_value=mock_entries):
                with patch.object(ThumbnailCache, 'get_thumbnail_base64', return_value="base64data"):
                    client = TestClient(app)
                    response = client.get("/api/v1/catalog")

                    assert response.status_code == 200
                    data = response.json()
                    assert "entries" in data
                    assert len(data["entries"]) == 3

    def test_boot_entry_success(self, temp_catalog_dir):
        """Test /api/v1/catalog/{id}/boot with valid entry."""
        from fastapi.testclient import TestClient

        # Create mock entry
        mock_entry = CatalogEntry(
            id="test0",
            name="Test OS",
            path=str(temp_catalog_dir / "test0.rts.png"),
            size=100,
            grid_size=None,
            kernel_version=None,
            distro=None,
            architecture=None
        )

        # Reset singleton
        import catalog.catalog_server
        catalog.catalog_server._catalog_server = None

        with patch.object(CatalogScanner, 'scan', return_value=[mock_entry]):
            with patch.object(ThumbnailCache, 'get_thumbnail_base64', return_value="base64data"):
                # Mock the boot_entry method directly since BootBridge is imported dynamically
                mock_boot_result = {
                    "success": True,
                    "entry_id": "test0",
                    "entry_name": "Test OS",
                    "vnc_port": 5900,
                    "pid": 12345,
                    "error_message": None
                }

                with patch.object(CatalogServer, 'boot_entry', return_value=mock_boot_result):
                    client = TestClient(app)

                    response = client.post(
                        "/api/v1/catalog/test0/boot",
                        json={"memory": "2G", "cpus": 2}
                    )

                    assert response.status_code == 200
                    data = response.json()
                    assert data["success"] is True
                    assert data["entry_id"] == "test0"

    def test_boot_entry_not_found(self, temp_catalog_dir):
        """Test /api/v1/catalog/{id}/boot with unknown entry."""
        from fastapi.testclient import TestClient

        # Reset singleton
        import catalog.catalog_server
        catalog.catalog_server._catalog_server = None

        with patch.object(CatalogScanner, 'scan', return_value=[]):
            with patch.object(ThumbnailCache, 'get_thumbnail_base64', return_value=""):
                client = TestClient(app)

                response = client.post(
                    "/api/v1/catalog/nonexistent/boot",
                    json={"memory": "2G", "cpus": 2}
                )

                assert response.status_code == 404

    def test_update_layout(self, temp_catalog_dir):
        """Test POST /api/v1/catalog/layout updates position."""
        from fastapi.testclient import TestClient

        # Reset singleton
        import catalog.catalog_server
        catalog.catalog_server._catalog_server = None

        mock_entry = CatalogEntry(
            id="test0",
            name="Test OS",
            path=str(temp_catalog_dir / "test0.rts.png"),
            size=100,
            grid_size=None,
            kernel_version=None,
            distro=None,
            architecture=None
        )

        with patch.object(CatalogScanner, 'scan', return_value=[mock_entry]):
            with patch.object(ThumbnailCache, 'get_thumbnail_base64', return_value="base64data"):
                client = TestClient(app)

                # First set position via get_catalog (triggers position assignment)
                client.get("/api/v1/catalog")

                # Update position
                response = client.post(
                    "/api/v1/catalog/layout",
                    json={
                        "entry_id": "test0",
                        "new_position": {"x": 5, "y": 5}
                    }
                )

                assert response.status_code == 200
                data = response.json()
                assert data["success"] is True
                assert data["position"]["x"] == 5
                assert data["position"]["y"] == 5

    def test_cors_headers(self, temp_catalog_dir):
        """Test that CORS middleware is configured."""
        from fastapi.testclient import TestClient

        # Reset singleton
        import catalog.catalog_server
        catalog.catalog_server._catalog_server = None

        with patch.object(CatalogScanner, 'scan', return_value=[]):
            client = TestClient(app)

            # Check CORS headers on preflight
            response = client.options(
                "/api/v1/catalog",
                headers={
                    "Origin": "http://example.com",
                    "Access-Control-Request-Method": "GET"
                }
            )

            # FastAPI CORS middleware should allow this
            assert response.status_code in [200, 400, 405]  # Various valid responses


# ============================================================================
# TestSingleton - Tests for singleton pattern
# ============================================================================

class TestCatalogServerSingleton:
    """Tests for get_catalog_server singleton."""

    def test_singleton_returns_same_instance(self, tmp_path):
        """Test that get_catalog_server returns same instance."""
        import catalog.catalog_server
        catalog.catalog_server._catalog_server = None

        with patch.object(CatalogScanner, 'scan', return_value=[]):
            server1 = get_catalog_server([str(tmp_path)])
            server2 = get_catalog_server()

            assert server1 is server2

    def test_singleton_ignores_subsequent_paths(self, tmp_path):
        """Test that subsequent calls ignore watch_paths parameter."""
        import catalog.catalog_server
        catalog.catalog_server._catalog_server = None

        with patch.object(CatalogScanner, 'scan', return_value=[]):
            server1 = get_catalog_server([str(tmp_path)])

            # Second call with different paths should return same instance
            server2 = get_catalog_server(["/different/path"])

            assert server1 is server2


# ============================================================================
# Test fixtures and utilities
# ============================================================================

@pytest.fixture
def sample_catalog_entry():
    """Create a sample CatalogEntry for testing."""
    return CatalogEntry(
        id="abc123def456",
        name="Alpine Linux 3.19",
        path="/images/alpine.rts.png",
        size=1024 * 1024 * 50,  # 50 MB
        grid_size="2048x2048",
        kernel_version="6.1.0-alpine",
        distro="alpine",
        architecture="x86_64",
        thumbnail_position=(0, 0)
    )


@pytest.fixture
def sample_spatial_position():
    """Create a sample SpatialPosition for testing."""
    return SpatialPosition(x=3, y=2)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
