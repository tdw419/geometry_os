"""
Tests for GPU Texture Cache Shader
TDD Approach: Tests for Phase 1, Task 14 - Texture Cache Shader (WGSL)
"""

import pytest
from pathlib import Path
import sys
import re

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))


class TestTextureCacheShaderBasic:
    """Test basic texture cache shader file structure"""

    def test_shader_file_exists(self):
        """Test that texture_cache.wgsl shader file exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        assert shader_path.exists(), f"Shader file not found: {shader_path}"

    def test_shader_has_entry_point(self):
        """Test that shader has main compute entry points"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()
        assert "@compute" in content, "Shader must have @compute entry points"
        assert "cache_lookup" in content, "Shader must have cache_lookup function"
        assert "cache_insert" in content, "Shader must have cache_insert function"

    def test_shader_has_bindings(self):
        """Test that shader has resource bindings"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()
        assert "@binding" in content, "Shader must have resource bindings"
        assert "@group" in content, "Shader must have resource groups"


class TestTextureCacheShaderStructs:
    """Test that all required structs are defined"""

    def test_cache_entry_struct_exists(self):
        """Test that CacheEntry struct is defined with correct fields"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for CacheEntry struct definition
        assert "struct CacheEntry" in content, "CacheEntry struct must be defined"

        # Check for required fields
        entry_pattern = r"struct\s+CacheEntry\s*\{([^}]+)\}"
        match = re.search(entry_pattern, content, re.DOTALL)
        assert match is not None, "Could not parse CacheEntry struct"

        fields = match.group(1)
        required_fields = ["key", "data", "last_access", "access_count", "size_bytes", "valid"]
        for field in required_fields:
            assert field in fields, f"CacheEntry struct missing field: {field}"

    def test_cache_lookup_result_struct_exists(self):
        """Test that CacheLookupResult struct is defined with correct fields"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "struct CacheLookupResult" in content, "CacheLookupResult struct must be defined"

        # Check for required fields
        result_pattern = r"struct\s+CacheLookupResult\s*\{([^}]+)\}"
        match = re.search(result_pattern, content, re.DOTALL)
        assert match is not None, "Could not parse CacheLookupResult struct"

        fields = match.group(1)
        required_fields = ["found", "data_ptr", "cache_hit", "access_count"]
        for field in required_fields:
            assert field in fields, f"CacheLookupResult struct missing field: {field}"

    def test_cache_config_struct_exists(self):
        """Test that CacheConfig struct is defined with correct fields"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "struct CacheConfig" in content, "CacheConfig struct must be defined"

        # Check for required fields
        config_pattern = r"struct\s+CacheConfig\s*\{([^}]+)\}"
        match = re.search(config_pattern, content, re.DOTALL)
        assert match is not None, "Could not parse CacheConfig struct"

        fields = match.group(1)
        required_fields = [
            "max_entries",
            "max_size_bytes",
            "current_entries",
            "current_size_bytes",
            "hits",
            "misses",
            "evictions",
            "timestamp",
            "hot_threshold"
        ]
        for field in required_fields:
            assert field in fields, f"CacheConfig struct missing field: {field}"

    def test_cache_entry_has_texture_data_array(self):
        """Test that CacheEntry has array<vec4<u32>> for texture data"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for texture data array
        assert "array<vec4<u32>>" in content, "CacheEntry should have array<vec4<u32>> for texture data"
        assert "data:" in content, "CacheEntry should have 'data' field"

    def test_cache_config_has_atomic_fields(self):
        """Test that CacheConfig uses atomic<u32> for statistics"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for atomic fields in CacheConfig
        assert "atomic<u32>" in content, "CacheConfig should use atomic<u32> for thread-safe counters"

        config_pattern = r"struct\s+CacheConfig\s*\{([^}]+)\}"
        match = re.search(config_pattern, content, re.DOTALL)
        if match:
            fields = match.group(1)
            atomic_fields = ["current_entries", "current_size_bytes", "hits", "misses", "evictions", "timestamp"]
            for field in atomic_fields:
                assert field in fields, f"CacheConfig missing atomic field: {field}"


class TestTextureCacheShaderConstants:
    """Test that all required constants are defined"""

    def test_special_value_constants(self):
        """Test that special value constants are defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        required_constants = {
            "INVALID_KEY": "0xFFFFFFFFu",
            "INVALID_PTR": "0xFFFFFFFFu",
            "CACHE_HIT": "1u",
            "CACHE_MISS": "0u",
        }

        for const_name, expected_value in required_constants.items():
            pattern = f"const\\s+{const_name}\\s*:\\s*u32\\s*=\\s*{re.escape(expected_value)}"
            assert re.search(pattern, content), \
                f"Constant {const_name} not defined or has wrong value"

    def test_entry_validity_constants(self):
        """Test that entry validity constants are defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        required_constants = ["ENTRY_VALID", "ENTRY_INVALID"]
        for const_name in required_constants:
            pattern = f"const\\s+{const_name}\\s*:"
            assert re.search(pattern, content), \
                f"Constant {const_name} not defined"

    def test_hash_constants(self):
        """Test that hash constants are defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for FNV hash constants
        assert "FNV_PRIME" in content, "Should define FNV_PRIME constant"
        assert "FNV_OFFSET_BASIS" in content, "Should define FNV_OFFSET_BASIS constant"

    def test_hot_threshold_constant(self):
        """Test that default hot threshold constant is defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "DEFAULT_HOT_THRESHOLD" in content, "Should define DEFAULT_HOT_THRESHOLD constant"


class TestTextureCacheShaderFunctions:
    """Test that all required functions are implemented"""

    def test_hash_key_function_exists(self):
        """Test that hash_key function is defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn hash_key" in content, "hash_key function must be defined"

        # Check function signature
        pattern = r"fn\s+hash_key\s*\([^)]*key[^)]*\)"
        assert re.search(pattern, content), "hash_key should have 'key' parameter"

    def test_cache_lookup_internal_exists(self):
        """Test that cache_lookup_internal function is defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn cache_lookup_internal" in content, "cache_lookup_internal function must be defined"

        # Check return type
        assert "CacheLookupResult" in content, "cache_lookup_internal should return CacheLookupResult"

    def test_cache_insert_internal_exists(self):
        """Test that cache_insert_internal function is defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn cache_insert_internal" in content, "cache_insert_internal function must be defined"

    def test_cache_evict_internal_exists(self):
        """Test that cache_evict_internal function is defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn cache_evict_internal" in content, "cache_evict_internal function must be defined"

    def test_hash_to_index_exists(self):
        """Test that hash_to_index function is defined"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn hash_to_index" in content, "hash_to_index function must be defined"


class TestTextureCacheShaderKernels:
    """Test that all required compute kernels are implemented"""

    def test_cache_lookup_kernel(self):
        """Test that cache_lookup compute kernel exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for compute shader entry point
        pattern = r'@compute\s+@workgroup_size\([^)]*\)\s*fn\s+cache_lookup'
        assert re.search(pattern, content), \
            "cache_lookup must be a compute shader with workgroup_size"

        # Check for global_invocation_id parameter
        assert "global_invocation_id" in content, \
            "cache_lookup should use global_invocation_id builtin"

    def test_cache_insert_kernel(self):
        """Test that cache_insert compute kernel exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        pattern = r'@compute\s+@workgroup_size\([^)]*\)\s*fn\s+cache_insert'
        assert re.search(pattern, content), \
            "cache_insert must be a compute shader with workgroup_size"

    def test_cache_update_stats_kernel(self):
        """Test that cache_update_stats compute kernel exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn cache_update_stats" in content, "cache_update_stats kernel must be defined"

    def test_cache_clear_kernel(self):
        """Test that cache_clear utility kernel exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn cache_clear" in content, "cache_clear kernel must be defined"

    def test_cache_batch_lookup_kernel(self):
        """Test that cache_batch_lookup kernel exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn cache_batch_lookup" in content, "cache_batch_lookup kernel must be defined"

    def test_cache_detect_hot_files_kernel(self):
        """Test that cache_detect_hot_files kernel exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn cache_detect_hot_files" in content, "cache_detect_hot_files kernel must be defined"

    def test_cache_reset_stats_kernel(self):
        """Test that cache_reset_stats kernel exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "fn cache_reset_stats" in content, "cache_reset_stats kernel must be defined"


class TestTextureCacheShaderLogic:
    """Test logic implementation of shader"""

    def test_hash_function_implementation(self):
        """Test that hash function is properly implemented"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for hash mixing operations
        hash_operations = ["%", "*", "^", ">>"]
        found = sum(1 for op in hash_operations if op in content)
        assert found >= 2, \
            f"Hash function should use arithmetic operations (found {found}/{len(hash_operations)})"

    def test_lru_eviction_logic(self):
        """Test that LRU eviction logic is implemented"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for LRU-related logic
        lru_indicators = ["last_access", "lru", "evict", "oldest"]
        found = sum(1 for indicator in lru_indicators if indicator.lower() in content.lower())
        assert found >= 2, \
            f"LRU eviction logic incomplete (found {found}/{len(lru_indicators)} indicators)"

    def test_hot_file_detection_logic(self):
        """Test that hot file detection logic is implemented"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for access counting and hot threshold
        assert "access_count" in content, "Should track access_count for hot files"
        assert "hot_threshold" in content, "Should use hot_threshold for detection"

    def test_atomic_statistics_tracking(self):
        """Test that atomic operations are used for statistics"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for atomic operations
        atomic_ops = ["atomicAdd", "atomicSub", "atomicLoad", "atomicStore"]
        found = sum(1 for op in atomic_ops if op in content)
        assert found >= 2, \
            f"Should use atomic operations for statistics (found {found}/{len(atomic_ops)})"

    def test_collision_handling(self):
        """Test that cache handles hash collisions"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Look for linear probing or other collision handling
        collision_indicators = ["probing", "probing", "collision", "next slot"]
        content_lower = content.lower()
        found = sum(1 for indicator in collision_indicators if indicator.lower() in content_lower)

        # Also check for linear probing pattern (index + 1) % max
        linear_probe_pattern = r"\(\s*\w+\s*\+\s*1u?\s*\)\s*%\s*\w+"
        if re.search(linear_probe_pattern, content):
            found += 1

        assert found > 0, "Should handle hash collisions (linear probing or similar)"

    def test_size_tracking(self):
        """Test that cache tracks size in bytes"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for size tracking
        assert "size_bytes" in content, "Should track size_bytes for memory limits"
        assert "max_size_bytes" in content, "Should have max_size_bytes configuration"

    def test_cache_hit_miss_tracking(self):
        """Test that cache tracks hits and misses"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for hit/miss tracking
        assert "hits" in content, "Should track cache hits"
        assert "misses" in content, "Should track cache misses"


class TestTextureCacheShaderCodeStyle:
    """Test that shader follows project code style"""

    def test_has_header_comment(self):
        """Test that shader has proper header documentation"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for standard header format
        assert "GEOMETRY OS" in content, "Should have GEOMETRY OS in header"
        assert "Phase 1" in content, "Should reference Phase 1"
        assert "TEXTURE CACHE" in content.upper() or "Texture Cache" in content, "Should describe texture cache"

    def test_has_section_comments(self):
        """Test that code is organized with section comments"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for section dividers
        section_patterns = [
            r"// ={10,}",  # Section dividers
            r"// BINDINGS",
            r"// CONSTANTS",
            r"// HASH FUNCTION",
            r"// CACHE LOOKUP",
            r"// CACHE INSERT",
            r"// CACHE EVICTION",
        ]

        for pattern in section_patterns:
            assert re.search(pattern, content), \
                f"Missing section comment pattern: {pattern}"

    def test_reasonable_workgroup_size(self):
        """Test that compute shaders use reasonable workgroup sizes"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
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

    def test_has_performance_notes(self):
        """Test that shader includes performance documentation"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Should have performance notes section
        assert "PERFORMANCE" in content or "OPTIMIZATION" in content, \
            "Should include performance/optimization notes"

    def test_uses_memory_barriers(self):
        """Test that shader uses proper memory barriers"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Should have memory barriers for synchronization
        barriers = ["storageBarrier", "workgroupBarrier"]
        found = sum(1 for b in barriers if b in content)
        assert found > 0, "Should use memory barriers for synchronization"


class TestTextureCacheShaderBindings:
    """Test shader resource bindings"""

    def test_has_cache_table_binding(self):
        """Test that cache table is properly bound"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "cache_table" in content, "Should define cache_table binding"
        assert "storage, read_write" in content, "Cache table should be read_write storage"

    def test_has_lookup_bindings(self):
        """Test that lookup request/result bindings exist"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "lookup_requests" in content, "Should define lookup_requests binding"
        assert "lookup_results" in content, "Should define lookup_results binding"

    def test_has_insert_bindings(self):
        """Test that insert bindings exist"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "insert_requests" in content, "Should define insert_requests binding"

    def test_has_config_binding(self):
        """Test that config binding exists"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "config" in content.lower(), "Should define config binding"


class TestTextureCacheShaderAdvanced:
    """Test advanced features and edge cases"""

    def test_handles_empty_cache(self):
        """Test that shader handles empty cache case"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for handling of invalid/empty entries
        assert "ENTRY_INVALID" in content or "valid" in content, \
            "Should handle empty/invalid cache entries"

    def test_handles_full_cache(self):
        """Test that shader handles cache full case"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Check for eviction or full cache handling
        assert "evict" in content.lower() or "full" in content.lower(), \
            "Should handle cache full case (eviction)"

    def test_supports_batch_operations(self):
        """Test that shader supports batch operations"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        # Should process arrays of requests
        assert "array<" in content, "Should use arrays for batch processing"
        assert "arrayLength" in content, "Should use arrayLength for bounds checking"
        assert "cache_batch" in content.lower(), "Should have batch operation kernel"

    def test_has_texture_data_storage(self):
        """Test that shader has texture data storage binding"""
        shader_path = Path(__file__).parent.parent / "shaders" / "texture_cache.wgsl"
        if not shader_path.exists():
            pytest.skip("Shader file not created yet")
        content = shader_path.read_text()

        assert "texture_data_storage" in content, "Should define texture data storage"
        assert "vec4<u32>" in content, "Should use vec4<u32> for RGBA texture data"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
