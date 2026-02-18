"""
Tests for PixelRTS Catalog System

Tests for:
- CatalogScanner: Discovers and catalogs .rts.png files
- ThumbnailCache: Generates and manages thumbnails
- SpatialLayoutManager: Manages grid layout positions
- CatalogServer: REST API endpoints
"""

import pytest
import os
import json
import tempfile
import hashlib
from pathlib import Path
from unittest.mock import Mock, patch, AsyncMock
from dataclasses import asdict

# Import catalog components
from systems.pixel_compiler.catalog.catalog_scanner import (
    CatalogScanner,
    CatalogEntry,
)
from systems.pixel_compiler.catalog.thumbnail_cache import ThumbnailCache
from systems.pixel_compiler.catalog.spatial_layout import (
    SpatialLayoutManager,
    SpatialPosition,
)


class TestCatalogScanner:
    """Tests for CatalogScanner"""

    @pytest.fixture
    def temp_dir(self, tmp_path):
        """Create temp directory with test .rts.png files"""
        # Create a simple PNG file (minimal valid PNG)
        # This is a 1x1 red pixel PNG
        png_data = bytes([
            0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,  # PNG signature
            0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,  # IHDR chunk
            0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
            0x08, 0x02, 0x00, 0x00, 0x00, 0x90, 0x77, 0x53,
            0xDE, 0x00, 0x00, 0x00, 0x0C, 0x49, 0x44, 0x41,  # IDAT chunk
            0x54, 0x08, 0xD7, 0x63, 0xF8, 0x0F, 0x00, 0x00,
            0x01, 0x01, 0x01, 0x00, 0x18, 0xDD, 0x8D, 0xB4,
            0x00, 0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44,  # IEND chunk
            0xAE, 0x42, 0x60, 0x82
        ])

        # Create test files
        rts1 = tmp_path / "test_os.rts.png"
        rts1.write_bytes(png_data)

        # Create meta.json for one file
        meta1 = tmp_path / "test_os.rts.meta.json"
        meta1.write_text(json.dumps({
            "format": "PixelRTS",
            "original_rts": {
                "os": "Alpine",
                "version": "3.19",
                "arch": "x86_64"
            }
        }))

        # Create nested directory with another file
        nested = tmp_path / "nested"
        nested.mkdir()
        rts2 = nested / "ubuntu.rts.png"
        rts2.write_bytes(png_data)

        return tmp_path

    def test_scanner_init_default(self):
        """Test scanner initialization with defaults"""
        scanner = CatalogScanner()
        assert len(scanner.watch_paths) >= 1

    def test_scanner_init_custom_paths(self, temp_dir):
        """Test scanner initialization with custom paths"""
        scanner = CatalogScanner([str(temp_dir)])
        assert len(scanner.watch_paths) == 1
        assert scanner.watch_paths[0] == temp_dir

    def test_scan_discovers_files(self, temp_dir):
        """Test that scan discovers .rts.png files"""
        scanner = CatalogScanner([str(temp_dir)])
        entries = scanner.scan()

        assert len(entries) == 2

        # Check that both files were found
        names = [e.name for e in entries]
        assert "test_os" in names
        assert "ubuntu" in names

    def test_scan_entry_has_required_fields(self, temp_dir):
        """Test that catalog entries have all required fields"""
        scanner = CatalogScanner([str(temp_dir)])
        entries = scanner.scan()

        for entry in entries:
            assert entry.id is not None
            assert entry.name is not None
            assert entry.path is not None
            assert entry.size > 0
            assert isinstance(entry.thumbnail_position, tuple)

    def test_generate_id_stability(self, temp_dir):
        """Test that ID generation is stable"""
        scanner = CatalogScanner([str(temp_dir)])

        rts_path = temp_dir / "test_os.rts.png"
        id1 = scanner._generate_id(rts_path)
        id2 = scanner._generate_id(rts_path)

        assert id1 == id2
        assert len(id1) == 12

    def test_scan_nonexistent_directory(self):
        """Test scanning non-existent directory doesn't crash"""
        scanner = CatalogScanner(["/nonexistent/path/12345"])
        entries = scanner.scan()
        assert entries == []

    def test_scan_empty_directory(self, tmp_path):
        """Test scanning empty directory"""
        scanner = CatalogScanner([str(tmp_path)])
        entries = scanner.scan()
        assert entries == []


class TestThumbnailCache:
    """Tests for ThumbnailCache"""

    @pytest.fixture
    def temp_dir(self, tmp_path):
        """Create temp directory with test image"""
        # Create a larger test PNG (valid 10x10 image)
        from PIL import Image
        import io

        img = Image.new('RGB', (100, 100), color='red')
        img_path = tmp_path / "test.rts.png"
        img.save(img_path, "PNG")

        return tmp_path

    @pytest.fixture
    def cache_dir(self, tmp_path):
        """Create temp cache directory"""
        cache = tmp_path / "cache"
        cache.mkdir()
        return cache

    def test_cache_init(self, cache_dir):
        """Test thumbnail cache initialization"""
        cache = ThumbnailCache(cache_dir=str(cache_dir))
        assert cache.cache_dir == cache_dir

    def test_generate_thumbnail(self, temp_dir, cache_dir):
        """Test thumbnail generation"""
        cache = ThumbnailCache(cache_dir=str(cache_dir), default_size=50)

        img_path = temp_dir / "test.rts.png"
        result = cache.get_thumbnail(str(img_path))

        assert result is not None
        assert result.path is not None
        assert Path(result.path).exists()

    def test_get_thumbnail_caches(self, temp_dir, cache_dir):
        """Test that thumbnail is cached"""
        cache = ThumbnailCache(cache_dir=str(cache_dir), default_size=50)

        img_path = temp_dir / "test.rts.png"

        # First call generates
        thumb1 = cache.get_thumbnail_base64(str(img_path))
        assert thumb1 is not None

        # Second call should return cached
        thumb2 = cache.get_thumbnail_base64(str(img_path))
        assert thumb2 == thumb1

    def test_get_thumbnail_returns_base64(self, temp_dir, cache_dir):
        """Test that thumbnail is returned as base64"""
        import base64

        cache = ThumbnailCache(cache_dir=str(cache_dir))
        img_path = temp_dir / "test.rts.png"

        thumb_b64 = cache.get_thumbnail_base64(str(img_path))

        # Should be valid base64
        try:
            decoded = base64.b64decode(thumb_b64)
            assert len(decoded) > 0
        except Exception:
            pytest.fail("Thumbnail is not valid base64")


class TestSpatialLayoutManager:
    """Tests for SpatialLayoutManager"""

    @pytest.fixture
    def manager(self, tmp_path):
        """Create manager with temp storage"""
        layout_file = tmp_path / "layout.json"
        return SpatialLayoutManager(layout_file=str(layout_file))

    def test_manager_init(self, manager):
        """Test manager initialization"""
        assert manager is not None

    def test_set_and_get_position(self, manager):
        """Test setting and getting positions"""
        entry_id = "test123"
        position = SpatialPosition(x=5, y=3)

        manager.set_position(entry_id, position)
        result = manager.get_position(entry_id)

        assert result is not None
        assert result.x == 5
        assert result.y == 3

    def test_get_nonexistent_position(self, manager):
        """Test getting position for non-existent entry"""
        result = manager.get_position("nonexistent")
        assert result is None

    def test_move_entry(self, manager):
        """Test moving entry to new position"""
        entry_id = "test123"

        # Set initial position
        manager.set_position(entry_id, SpatialPosition(x=0, y=0))

        # Move to new position
        new_pos = SpatialPosition(x=5, y=5)
        result = manager.move_entry(entry_id, new_pos)

        assert result is True
        assert manager.get_position(entry_id).x == 5

    def test_move_nonexistent_entry(self, manager):
        """Test moving non-existent entry"""
        result = manager.move_entry("nonexistent", SpatialPosition(x=0, y=0))
        assert result is False

    def test_swap_on_conflict(self, manager):
        """Test that entries swap when moved to occupied position"""
        # Set two entries
        manager.set_position("entry1", SpatialPosition(x=0, y=0))
        manager.set_position("entry2", SpatialPosition(x=5, y=5))

        # Move entry1 to entry2's position
        manager.move_entry("entry1", SpatialPosition(x=5, y=5))

        # Check swap happened
        pos1 = manager.get_position("entry1")
        pos2 = manager.get_position("entry2")

        assert pos1.x == 5 and pos1.y == 5
        assert pos2.x == 0 and pos2.y == 0

    def test_get_grid_dimensions(self, manager):
        """Test grid dimension calculation"""
        # Add entries at various positions
        manager.set_position("e1", SpatialPosition(x=0, y=0))
        manager.set_position("e2", SpatialPosition(x=5, y=3))
        manager.set_position("e3", SpatialPosition(x=2, y=7))

        width, height = manager.get_grid_dimensions()

        assert width >= 6  # At least 6 columns (0-5)
        assert height >= 8  # At least 8 rows (0-7)

    def test_get_all_positions(self, manager):
        """Test getting all positions"""
        manager.set_position("e1", SpatialPosition(x=0, y=0))
        manager.set_position("e2", SpatialPosition(x=5, y=3))

        positions = manager.get_all_positions()

        assert len(positions) == 2
        assert "e1" in positions
        assert "e2" in positions

    def test_persistence(self, tmp_path):
        """Test that layout persists across instances"""
        layout_file = tmp_path / "layout.json"

        # Create manager and add positions
        manager1 = SpatialLayoutManager(layout_file=str(layout_file))
        manager1.set_position("persist_test", SpatialPosition(x=10, y=10))

        # Create new manager with same storage
        manager2 = SpatialLayoutManager(layout_file=str(layout_file))
        result = manager2.get_position("persist_test")

        assert result is not None
        assert result.x == 10
        assert result.y == 10

    def test_clear_layout(self, manager):
        """Test clearing all positions"""
        manager.set_position("to_clear", SpatialPosition(x=3, y=3))
        manager.clear_layout()

        result = manager.get_position("to_clear")
        assert result is None


class TestSpatialPosition:
    """Tests for SpatialPosition dataclass"""

    def test_position_creation(self):
        """Test creating a position"""
        pos = SpatialPosition(x=10, y=20)

        assert pos.x == 10
        assert pos.y == 20

    def test_position_to_dict(self):
        """Test position serialization"""
        pos = SpatialPosition(x=10, y=20)
        d = pos.to_dict()

        assert d == {"x": 10, "y": 20}

    def test_position_from_dict(self):
        """Test position deserialization"""
        d = {"x": 10, "y": 20}
        pos = SpatialPosition.from_dict(d)

        assert pos.x == 10
        assert pos.y == 20


class TestCatalogEntry:
    """Tests for CatalogEntry dataclass"""

    def test_entry_creation(self):
        """Test creating a catalog entry"""
        entry = CatalogEntry(
            id="abc123",
            name="Test OS",
            path="/path/to/test.rts.png",
            size=1024000,
            grid_size="1024x1024",
            kernel_version="6.1.0",
            distro="Debian",
            architecture="x86_64",
            thumbnail_position=(0, 0)
        )

        assert entry.id == "abc123"
        assert entry.name == "Test OS"
        assert entry.kernel_version == "6.1.0"


class TestCatalogIntegration:
    """Integration tests for catalog system"""

    @pytest.fixture
    def full_setup(self, tmp_path):
        """Create full test setup with scanner, cache, and layout manager"""
        from PIL import Image

        # Create test images
        for i in range(3):
            img = Image.new('RGB', (100, 100), color=('red', 'green', 'blue')[i])
            img_path = tmp_path / f"test{i}.rts.png"
            img.save(img_path, "PNG")

        cache_dir = tmp_path / "cache"
        cache_dir.mkdir()

        return {
            "watch_path": tmp_path,
            "cache_dir": cache_dir,
            "storage_file": tmp_path / "layout.json"
        }

    def test_full_scan_and_thumbnail(self, full_setup):
        """Test full workflow: scan -> thumbnail -> layout"""
        # Scan
        scanner = CatalogScanner([str(full_setup["watch_path"])])
        entries = scanner.scan()
        assert len(entries) == 3

        # Generate thumbnails
        cache = ThumbnailCache(cache_dir=str(full_setup["cache_dir"]))
        for entry in entries:
            thumb = cache.get_thumbnail_base64(entry.path)
            assert thumb is not None

        # Assign positions
        manager = SpatialLayoutManager(layout_file=str(full_setup["storage_file"]))
        for i, entry in enumerate(entries):
            manager.set_position(entry.id, SpatialPosition(x=i, y=0))

        positions = manager.get_all_positions()
        assert len(positions) == 3


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
