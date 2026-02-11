#!/usr/bin/env python3
"""
Memory Protection Validator Tests - Phase 1, Task 3

Tests for MemoryProtectionValidator class that provides Python-side
memory protection validation matching the GPU shader logic.

Run with:
    pytest systems/pixel_compiler/tests/test_memory_protection.py -v
"""

import sys
import os
from pathlib import Path
from dataclasses import dataclass
from typing import Optional, List
import pytest

# Add parent directories to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

# Import the classes to test
from systems.pixel_compiler.infinite_map_v2 import (
    MemoryProtectionValidator,
    ProtectedRegion,
    ProtectionResult,
    VIOLATION_NONE,
    VIOLATION_READ_ONLY,
    VIOLATION_OUT_OF_BOUNDS,
    VIOLATION_ISOLATION,
    FLAG_READ_ONLY,
)


# ============================================================================
# Test ProtectedRegion
# ============================================================================

class TestProtectedRegion:
    """Test ProtectedRegion class."""

    def test_region_initialization(self):
        """Test region can be initialized with parameters."""
        region = ProtectedRegion(
            x=100, y=100,
            width=50, height=50,
            flags=FLAG_READ_ONLY,
            owner="kernel"
        )

        assert region.x == 100
        assert region.y == 100
        assert region.width == 50
        assert region.height == 50
        assert region.flags == FLAG_READ_ONLY
        assert region.owner == "kernel"

    def test_region_contains_point_inside(self):
        """Test contains() returns True for point inside region."""
        region = ProtectedRegion(
            x=100, y=100,
            width=50, height=50,
            flags=0,
            owner="test"
        )

        # Point inside region
        assert region.contains(125, 125)
        assert region.contains(100, 100)  # Top-left corner
        assert region.contains(149, 149)  # Bottom-right corner

    def test_region_contains_point_outside(self):
        """Test contains() returns False for point outside region."""
        region = ProtectedRegion(
            x=100, y=100,
            width=50, height=50,
            flags=0,
            owner="test"
        )

        # Points outside region
        assert not region.contains(99, 100)  # Left of region
        assert not region.contains(100, 99)  # Above region
        assert not region.contains(150, 100)  # Right of region
        assert not region.contains(100, 150)  # Below region

    def test_read_only_property_true(self):
        """Test read_only property when FLAG_READ_ONLY is set."""
        region = ProtectedRegion(
            x=0, y=0, width=100, height=100,
            flags=FLAG_READ_ONLY,
            owner="test"
        )

        assert region.read_only is True

    def test_read_only_property_false(self):
        """Test read_only property when FLAG_READ_ONLY is not set."""
        region = ProtectedRegion(
            x=0, y=0, width=100, height=100,
            flags=0,
            owner="test"
        )

        assert region.read_only is False

    def test_read_only_property_with_other_flags(self):
        """Test read_only property with multiple flags."""
        # Multiple flags including READ_ONLY
        region = ProtectedRegion(
            x=0, y=0, width=100, height=100,
            flags=FLAG_READ_ONLY | 0x10,  # Additional flag
            owner="test"
        )
        assert region.read_only is True

        # Multiple flags without READ_ONLY
        region2 = ProtectedRegion(
            x=0, y=0, width=100, height=100,
            flags=0x10 | 0x20,
            owner="test"
        )
        assert region2.read_only is False


# ============================================================================
# Test ProtectionResult
# ============================================================================

class TestProtectionResult:
    """Test ProtectionResult dataclass."""

    def test_result_initialization_allowed(self):
        """Test result for allowed access."""
        result = ProtectionResult(
            valid=True,
            violation_type=VIOLATION_NONE,
            address=0x1000,
            expected_bound=None,
            actual_value=None,
            region=None
        )

        assert result.valid is True
        assert result.violation_type == VIOLATION_NONE

    def test_result_initialization_read_only_violation(self):
        """Test result for read-only violation."""
        result = ProtectionResult(
            valid=False,
            violation_type=VIOLATION_READ_ONLY,
            address=0x1000,
            expected_bound=None,
            actual_value=FLAG_READ_ONLY,
            region=None
        )

        assert result.valid is False
        assert result.violation_type == VIOLATION_READ_ONLY

    def test_result_initialization_out_of_bounds_violation(self):
        """Test result for out-of-bounds violation."""
        result = ProtectionResult(
            valid=False,
            violation_type=VIOLATION_OUT_OF_BOUNDS,
            address=0x100000,
            expected_bound=0xFFFF,
            actual_value=0x100000,
            region=None
        )

        assert result.valid is False
        assert result.violation_type == VIOLATION_OUT_OF_BOUNDS

    def test_result_with_region(self):
        """Test result with associated region."""
        region = ProtectedRegion(0, 0, 100, 100, 0, "test")
        result = ProtectionResult(
            valid=False,
            violation_type=VIOLATION_ISOLATION,
            address=0x1000,
            expected_bound="test",
            actual_value="other",
            region=region
        )

        assert result.region is region
        assert result.region.owner == "test"


# ============================================================================
# Test MemoryProtectionValidator
# ============================================================================

class TestMemoryProtectionValidatorBasics:
    """Test basic MemoryProtectionValidator functionality."""

    def test_validator_initialization(self):
        """Test validator can be initialized with grid_size."""
        validator = MemoryProtectionValidator(grid_size=2048)

        assert validator.grid_size == 2048
        assert len(validator.protected_regions) == 0

    def test_add_protected_region(self):
        """Test adding a protected region."""
        validator = MemoryProtectionValidator(grid_size=2048)

        region = validator.add_protected_region(
            x=100, y=100,
            width=50, height=50,
            read_only=True,
            owner="kernel"
        )

        assert region.x == 100
        assert region.y == 100
        assert region.width == 50
        assert region.height == 50
        assert region.read_only is True
        assert region.owner == "kernel"
        assert len(validator.protected_regions) == 1

    def test_add_multiple_regions(self):
        """Test adding multiple protected regions."""
        validator = MemoryProtectionValidator(grid_size=2048)

        validator.add_protected_region(0, 0, 100, 100, True, "kernel")
        validator.add_protected_region(200, 200, 50, 50, False, "user1")
        validator.add_protected_region(300, 300, 75, 75, False, "user2")

        assert len(validator.protected_regions) == 3


class TestBoundsChecking:
    """Test bounds checking functionality."""

    def test_check_bounds_within_grid(self):
        """Test check_bounds for coordinates within grid."""
        validator = MemoryProtectionValidator(grid_size=2048)

        result = validator.check_bounds(1024, 1024)

        assert result.valid is True
        assert result.violation_type == VIOLATION_NONE

    def test_check_bounds_at_edge(self):
        """Test check_bounds for coordinates at grid edge."""
        validator = MemoryProtectionValidator(grid_size=2048)

        result = validator.check_bounds(2047, 2047)

        assert result.valid is True

    def test_check_bounds_out_of_bounds_x(self):
        """Test check_bounds for X coordinate out of bounds."""
        validator = MemoryProtectionValidator(grid_size=2048)

        result = validator.check_bounds(2048, 100)

        assert result.valid is False
        assert result.violation_type == VIOLATION_OUT_OF_BOUNDS
        # address is linear address: y * grid_size + x = 100 * 2048 + 2048 = 206848
        assert result.address == 206848
        assert result.expected_bound == 2047

    def test_check_bounds_out_of_bounds_y(self):
        """Test check_bounds for Y coordinate out of bounds."""
        validator = MemoryProtectionValidator(grid_size=2048)

        result = validator.check_bounds(100, 2048)

        assert result.valid is False
        assert result.violation_type == VIOLATION_OUT_OF_BOUNDS

    def test_check_bounds_negative_coordinates(self):
        """Test check_bounds for negative coordinates."""
        validator = MemoryProtectionValidator(grid_size=2048)

        result = validator.check_bounds(-1, 100)

        assert result.valid is False
        assert result.violation_type == VIOLATION_OUT_OF_BOUNDS


class TestWritePermission:
    """Test write permission checking."""

    def test_check_write_permission_no_regions(self):
        """Test write permission when no regions defined."""
        validator = MemoryProtectionValidator(grid_size=2048)

        result = validator.check_write_permission(100, 100)

        # No regions means no restrictions
        assert result.valid is True
        assert result.violation_type == VIOLATION_NONE

    def test_check_write_permission_writable_region(self):
        """Test write permission to writable region."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=100, y=100, width=50, height=50,
            read_only=False, owner="user"
        )

        result = validator.check_write_permission(125, 125)

        assert result.valid is True

    def test_check_write_permission_read_only_region(self):
        """Test write permission to read-only region."""
        validator = MemoryProtectionValidator(grid_size=2048)
        region = validator.add_protected_region(
            x=100, y=100, width=50, height=50,
            read_only=True, owner="kernel"
        )

        result = validator.check_write_permission(125, 125)

        assert result.valid is False
        assert result.violation_type == VIOLATION_READ_ONLY
        assert result.region is region

    def test_check_write_permission_outside_region(self):
        """Test write permission outside any protected region."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=100, y=100, width=50, height=50,
            read_only=True, owner="kernel"
        )

        # Point outside the protected region
        result = validator.check_write_permission(200, 200)

        assert result.valid is True
        assert result.violation_type == VIOLATION_NONE

    def test_check_write_permission_multiple_regions(self):
        """Test write permission with multiple regions."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=0, y=0, width=100, height=100,
            read_only=True, owner="kernel"
        )
        validator.add_protected_region(
            x=200, y=200, width=100, height=100,
            read_only=False, owner="user"
        )

        # Write to read-only region - should fail
        result1 = validator.check_write_permission(50, 50)
        assert result1.valid is False
        assert result1.violation_type == VIOLATION_READ_ONLY

        # Write to writable region - should succeed
        result2 = validator.check_write_permission(250, 250)
        assert result2.valid is True

        # Write outside any region - should succeed
        result3 = validator.check_write_permission(500, 500)
        assert result3.valid is True


class TestIsolationChecking:
    """Test region isolation checking."""

    def test_check_cross_region_access_no_regions(self):
        """Test isolation check with no regions defined."""
        validator = MemoryProtectionValidator(grid_size=2048)

        result = validator.check_cross_region_access(100, 100, from_owner="user1")

        assert result.valid is True

    def test_check_cross_region_access_owner_matches(self):
        """Test isolation check when owner matches."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=100, y=100, width=50, height=50,
            read_only=False, owner="user1"
        )

        result = validator.check_cross_region_access(125, 125, from_owner="user1")

        assert result.valid is True

    def test_check_cross_region_access_owner_mismatch(self):
        """Test isolation check when owner doesn't match."""
        validator = MemoryProtectionValidator(grid_size=2048)
        region = validator.add_protected_region(
            x=100, y=100, width=50, height=50,
            read_only=False, owner="user1"
        )

        result = validator.check_cross_region_access(125, 125, from_owner="user2")

        assert result.valid is False
        assert result.violation_type == VIOLATION_ISOLATION
        assert result.expected_bound == "user1"
        assert result.actual_value == "user2"
        assert result.region is region

    def test_check_cross_region_access_outside_region(self):
        """Test isolation check outside any protected region."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=100, y=100, width=50, height=50,
            read_only=False, owner="user1"
        )

        result = validator.check_cross_region_access(200, 200, from_owner="user2")

        assert result.valid is True
        assert result.violation_type == VIOLATION_NONE

    def test_check_cross_region_access_multiple_regions(self):
        """Test isolation check with multiple regions."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=0, y=0, width=100, height=100,
            read_only=False, owner="kernel"
        )
        validator.add_protected_region(
            x=200, y=200, width=100, height=100,
            read_only=False, owner="user1"
        )
        validator.add_protected_region(
            x=400, y=400, width=100, height=100,
            read_only=False, owner="user2"
        )

        # User1 accessing user2's region - should fail
        result1 = validator.check_cross_region_access(450, 450, from_owner="user1")
        assert result1.valid is False
        assert result1.violation_type == VIOLATION_ISOLATION

        # User1 accessing own region - should succeed
        result2 = validator.check_cross_region_access(250, 250, from_owner="user1")
        assert result2.valid is True

        # User1 accessing kernel region - should fail
        result3 = validator.check_cross_region_access(50, 50, from_owner="user1")
        assert result3.valid is False
        assert result3.violation_type == VIOLATION_ISOLATION


class TestCombinedValidation:
    """Test combined validation scenarios."""

    def test_validate_full_access_allowed(self):
        """Test full validation for allowed access."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=100, y=100, width=100, height=100,
            read_only=False, owner="user1"
        )

        # Within bounds, writable region, matching owner
        result = validator.validate_access(
            x=150, y=150,
            access_type="write",
            from_owner="user1"
        )

        assert result.valid is True

    def test_validate_full_access_out_of_bounds(self):
        """Test full validation for out-of-bounds access."""
        validator = MemoryProtectionValidator(grid_size=2048)

        result = validator.validate_access(
            x=5000, y=5000,
            access_type="read",
            from_owner="anyone"
        )

        assert result.valid is False
        assert result.violation_type == VIOLATION_OUT_OF_BOUNDS

    def test_validate_full_access_read_only_violation(self):
        """Test full validation for read-only violation."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=100, y=100, width=100, height=100,
            read_only=True, owner="kernel"
        )

        result = validator.validate_access(
            x=150, y=150,
            access_type="write",
            from_owner="kernel"
        )

        assert result.valid is False
        assert result.violation_type == VIOLATION_READ_ONLY

    def test_validate_full_access_isolation_violation(self):
        """Test full validation for isolation violation."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=100, y=100, width=100, height=100,
            read_only=False, owner="user1"
        )

        result = validator.validate_access(
            x=150, y=150,
            access_type="write",
            from_owner="user2"
        )

        assert result.valid is False
        assert result.violation_type == VIOLATION_ISOLATION

    def test_validate_read_access_allowed(self):
        """Test that read access to read-only region is allowed."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=100, y=100, width=100, height=100,
            read_only=True, owner="kernel"
        )

        # Read access should be allowed even for read-only region
        result = validator.validate_access(
            x=150, y=150,
            access_type="read",
            from_owner="kernel"
        )

        assert result.valid is True

    def test_validate_outside_all_regions(self):
        """Test access outside all protected regions."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=100, y=100, width=100, height=100,
            read_only=True, owner="kernel"
        )

        # Outside region, write access
        result = validator.validate_access(
            x=500, y=500,
            access_type="write",
            from_owner="user1"
        )

        assert result.valid is True


class TestEdgeCases:
    """Test edge cases and boundary conditions."""

    def test_zero_size_region(self):
        """Test behavior with zero-size region."""
        validator = MemoryProtectionValidator(grid_size=2048)
        region = validator.add_protected_region(
            x=100, y=100, width=0, height=0,
            read_only=True, owner="test"
        )

        # Zero-size region shouldn't contain any points
        assert not region.contains(100, 100)

    def test_region_at_grid_boundary(self):
        """Test region at grid boundary."""
        validator = MemoryProtectionValidator(grid_size=2048)
        validator.add_protected_region(
            x=2000, y=2000, width=48, height=48,
            read_only=False, owner="test"
        )

        # Point inside region (at boundary)
        result = validator.check_write_permission(2020, 2020)
        assert result.valid is True

    def test_overlapping_regions(self):
        """Test behavior with overlapping regions."""
        validator = MemoryProtectionValidator(grid_size=2048)

        # Add overlapping regions
        validator.add_protected_region(
            x=100, y=100, width=100, height=100,
            read_only=True, owner="owner1"
        )
        validator.add_protected_region(
            x=150, y=150, width=100, height=100,
            read_only=False, owner="owner2"
        )

        # Check overlapping point (should find first matching region)
        result = validator.check_write_permission(175, 175)

        # Behavior: first region found is checked
        # Since first region is read-only, should be violation
        assert result.valid is False
        assert result.violation_type == VIOLATION_READ_ONLY

    def test_negative_region_coordinates(self):
        """Test region with negative coordinates (invalid)."""
        validator = MemoryProtectionValidator(grid_size=2048)

        # Region with negative coordinates is technically valid
        # but contains() will work correctly: 0 is >= -10 and < 40
        region = validator.add_protected_region(
            x=-10, y=-10, width=50, height=50,
            read_only=True, owner="test"
        )

        # Point (0, 0) is within the region bounds (-10 to 40)
        # This is correct behavior - the contains method works mathematically
        assert region.contains(0, 0)

        # But point (-20, 0) should be outside (left of region)
        assert not region.contains(-20, 0)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
