"""
Tests for GPU Memory Protection Shader
TDD Approach: Tests for Phase 1, Task 6 - Memory Protection Shader (WGSL)
"""

import pytest
from pathlib import Path
import sys
import re

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))


class TestMemoryProtectionShaderBasic:
    """Test basic memory protection shader file structure"""

    def test_shader_file_exists(self):
        """Test that memory_protection.wgsl shader file exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        assert shader_path.exists(), f"Shader file not found: {shader_path}"

    def test_shader_has_entry_point(self):
        """Test that shader has main compute entry point"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()
        assert "@compute" in content, "Shader must have @compute entry point"
        assert "validate_memory_access" in content, "Shader must have validate_memory_access function"

    def test_shader_has_bindings(self):
        """Test that shader has resource bindings"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()
        assert "@binding" in content, "Shader must have resource bindings"
        assert "@group" in content, "Shader must have resource groups"


class TestMemoryProtectionShaderStructs:
    """Test that all required structs are defined"""

    def test_bounds_struct_exists(self):
        """Test that Bounds struct is defined with correct fields"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for Bounds struct definition
        assert "struct Bounds" in content, "Bounds struct must be defined"

        # Check for required fields
        bounds_pattern = r"struct\s+Bounds\s*\{([^}]+)\}"
        match = re.search(bounds_pattern, content, re.DOTALL)
        assert match is not None, "Could not parse Bounds struct"

        fields = match.group(1)
        required_fields = ["valid", "x", "y", "width", "height"]
        for field in required_fields:
            assert field in fields, f"Bounds struct missing field: {field}"

    def test_protection_result_struct_exists(self):
        """Test that ProtectionResult struct is defined with correct fields"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "struct ProtectionResult" in content, "ProtectionResult struct must be defined"

        # Check for required fields
        result_pattern = r"struct\s+ProtectionResult\s*\{([^}]+)\}"
        match = re.search(result_pattern, content, re.DOTALL)
        assert match is not None, "Could not parse ProtectionResult struct"

        fields = match.group(1)
        required_fields = ["allowed", "violation_type", "address", "expected_bound", "actual_value"]
        for field in required_fields:
            assert field in fields, f"ProtectionResult struct missing field: {field}"

    def test_protected_region_struct_exists(self):
        """Test that ProtectedRegion struct is defined with correct fields"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "struct ProtectedRegion" in content, "ProtectedRegion struct must be defined"

        # Check for required fields
        region_pattern = r"struct\s+ProtectedRegion\s*\{([^}]+)\}"
        match = re.search(region_pattern, content, re.DOTALL)
        assert match is not None, "Could not parse ProtectedRegion struct"

        fields = match.group(1)
        required_fields = ["x", "y", "width", "height", "flags", "owner_id"]
        for field in required_fields:
            assert field in fields, f"ProtectedRegion struct missing field: {field}"


class TestMemoryProtectionShaderConstants:
    """Test that all required constants are defined"""

    def test_violation_type_constants(self):
        """Test that all violation type constants are defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        required_constants = {
            "VIOLATION_NONE": "0u",
            "VIOLATION_READ_ONLY": "1u",
            "VIOLATION_OUT_OF_BOUNDS": "2u",
            "VIOLATION_ISOLATION": "3u"
        }

        for const_name, expected_value in required_constants.items():
            pattern = f"const\\s+{const_name}\\s*:\\s*u32\\s*=\\s*{expected_value}"
            assert re.search(pattern, content), \
                f"Constant {const_name} not defined or has wrong value"

    def test_access_type_constants(self):
        """Test that access type constants are defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        required_constants = ["ACCESS_READ", "ACCESS_WRITE", "ACCESS_EXECUTE"]

        for const_name in required_constants:
            pattern = f"const\\s+{const_name}\\s*:"
            assert re.search(pattern, content), \
                f"Constant {const_name} not defined"

    def test_protection_flag_constants(self):
        """Test that protection flag constants are defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        required_flags = [
            "FLAG_READ_ONLY",
            "FLAG_EXECUTABLE",
            "FLAG_ISOLATED",
            "FLAG_KERNEL"
        ]

        for flag_name in required_flags:
            pattern = f"const\\s+{flag_name}\\s*:"
            assert re.search(pattern, content), \
                f"Flag constant {flag_name} not defined"


class TestMemoryProtectionShaderFunctions:
    """Test that all required functions are implemented"""

    def test_check_bounds_internal_exists(self):
        """Test that check_bounds_internal function is defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn check_bounds_internal" in content, \
            "check_bounds_internal function must be defined"

        # Check function signature includes expected parameters
        pattern = r"fn\s+check_bounds_internal\s*\([^)]*address[^)]*\)"
        assert re.search(pattern, content), \
            "check_bounds_internal should have 'address' parameter"

    def test_check_write_permission_internal_exists(self):
        """Test that check_write_permission_internal function is defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn check_write_permission_internal" in content, \
            "check_write_permission_internal function must be defined"

    def test_check_isolation_internal_exists(self):
        """Test that check_isolation_internal function is defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn check_isolation_internal" in content, \
            "check_isolation_internal function must be defined"

    def test_validate_memory_access_entry_point(self):
        """Test that validate_memory_access is the main compute kernel"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for compute shader entry point
        pattern = r'@compute\s+@workgroup_size\([^)]*\)\s*fn\s+validate_memory_access'
        assert re.search(pattern, content), \
            "validate_memory_access must be a compute shader with workgroup_size"

        # Check for global_invocation_id parameter
        assert "global_invocation_id" in content, \
            "validate_memory_access should use global_invocation_id builtin"


class TestMemoryProtectionShaderLogic:
    """Test the logic implementation of the shader"""

    def test_bounds_checking_logic(self):
        """Test that bounds checking logic is implemented"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for bounds checking logic
        bounds_checks = [
            "is_within_bounds",
            "x >=",
            "y >=",
            "x <",
            "y <"
        ]

        # At least some of these should be present for bounds checking
        found = sum(1 for check in bounds_checks if check in content)
        assert found >= 3, \
            f"Bounds checking logic incomplete (found {found}/{len(bounds_checks)} checks)"

    def test_read_only_protection_logic(self):
        """Test that read-only protection logic is implemented"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for read-only flag checking
        assert "FLAG_READ_ONLY" in content, "Should use FLAG_READ_ONLY constant"

        # Look for flag checking pattern
        assert ("&" in content and "flags" in content), \
            "Should have flag bit operations for checking permissions"

    def test_isolation_logic(self):
        """Test that region isolation logic is implemented"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for ownership checking
        assert "owner_id" in content, "Should check owner_id for isolation"
        assert "requester_id" in content, "Should use requester_id for isolation"


class TestMemoryProtectionShaderCodeStyle:
    """Test that shader follows project code style"""

    def test_has_header_comment(self):
        """Test that shader has proper header documentation"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for standard header format
        assert "GEOMETRY OS" in content, "Should have GEOMETRY OS in header"
        assert "Phase 1" in content, "Should reference Phase 1"
        assert "Memory Protection" in content, "Should describe memory protection"

    def test_has_section_comments(self):
        """Test that code is organized with section comments"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for section dividers
        section_patterns = [
            r"// ={10,}",  # Section dividers
            r"// BINDINGS",
            r"// CONSTANTS",
            r"// HELPER FUNCTIONS"
        ]

        for pattern in section_patterns:
            assert re.search(pattern, content), \
                f"Missing section comment pattern: {pattern}"

    def test_reasonable_workgroup_size(self):
        """Test that compute shaders use reasonable workgroup sizes"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Find all workgroup_size declarations
        matches = re.findall(r'@workgroup_size\((\d+)', content)

        assert len(matches) > 0, "Should have at least one compute shader"

        for size_str in matches:
            size = int(size_str)
            assert size > 0 and size <= 1024, \
                f"Workgroup size {size} is not valid (must be 1-1024)"
            # Check if power of 2
            assert (size & (size - 1)) == 0, \
                f"Workgroup size {size} should be power of 2"

    def test_statistics_tracking(self):
        """Test that shader includes statistics tracking"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Should have atomic operations for statistics
        assert "atomic<" in content, "Should use atomic operations for statistics"
        assert "ViolationStats" in content or "stats" in content.lower(), \
            "Should have statistics tracking struct"


class TestMemoryProtectionShaderPerformance:
    """Test performance-related aspects of the shader"""

    def test_has_performance_notes(self):
        """Test that shader includes performance documentation"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Should have performance notes section
        assert "PERFORMANCE" in content or "OPTIMIZATION" in content, \
            "Should include performance/optimization notes"

    def test_uses_storage_barriers(self):
        """Test that shader uses proper memory barriers"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Should have memory barriers for synchronization
        barriers = ["storageBarrier", "workgroupBarrier", "atomicAdd"]
        found = sum(1 for b in barriers if b in content)
        assert found > 0, "Should use memory barriers for synchronization"

    def test_batch_processing_support(self):
        """Test that shader supports batch processing"""
        shader_path = Path(__file__).parent.parent / "shaders" / "memory_protection.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Should process arrays of requests
        assert "array<" in content, "Should use arrays for batch processing"
        assert "arrayLength" in content, "Should use arrayLength for bounds checking"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
