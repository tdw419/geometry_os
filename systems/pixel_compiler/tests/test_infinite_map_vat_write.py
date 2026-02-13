"""
Test VAT modifications for write support.

Task 9: Add Directory Entry Tracking to VAT
Tests for directory tracking in VisualAllocationTable.
"""

import pytest


class TestVATWriteSupport:
    """Test VAT modifications for write support."""

    def test_directory_entries_tracking(self):
        """Test that VAT tracks directory entries separately."""
        from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable

        vat = VisualAllocationTable(grid_size=256)

        # Add a directory entry
        vat.directory_entries.add("mydir")

        assert "mydir" in vat.directory_entries
        assert vat.is_directory("mydir")

    def test_directory_entries_exists_after_init(self):
        """Test that directory_entries is initialized as an empty set."""
        from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable

        vat = VisualAllocationTable(grid_size=256)

        # Should be an empty set after initialization
        assert hasattr(vat, 'directory_entries'), "VAT should have directory_entries attribute"
        assert isinstance(vat.directory_entries, set), "directory_entries should be a set"
        assert len(vat.directory_entries) == 0, "directory_entries should start empty"

    def test_is_directory_returns_false_for_non_directories(self):
        """Test that is_directory returns False for files/non-existent entries."""
        from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable

        vat = VisualAllocationTable(grid_size=256)

        # Should return False for entries that are not directories
        assert vat.is_directory("nonexistent") == False
        assert vat.is_directory("some_file.txt") == False

    def test_to_json_includes_directory_entries(self):
        """Test that to_json includes directory entries in output."""
        from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable

        vat = VisualAllocationTable(grid_size=256)

        # Add some directories
        vat.directory_entries.add("mydir")
        vat.directory_entries.add("anotherdir")

        # Get JSON output
        json_data = vat.to_json()

        # Verify directory entries are included
        assert 'directory_entries' in json_data, "to_json should include 'directory_entries'"
        assert 'mydir' in json_data['directory_entries'], "mydir should be in directory_entries"
        assert 'anotherdir' in json_data['directory_entries'], "anotherdir should be in directory_entries"
