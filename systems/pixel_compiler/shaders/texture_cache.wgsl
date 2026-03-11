// ============================================
// GEOMETRY OS - GPU TEXTURE CACHE SYSTEM
// Phase 1: Performance Optimization for Infinite Map OS
// ============================================
//
// Purpose: GPU-side texture caching for frequently accessed data
//          Reduces CPU-GPU synchronization and improves throughput
//
// Features:
//   - Hash-based cache lookup with O(1) access
//   - LRU (Least Recently Used) eviction policy
//   - Hot file detection via access counting
//   - Atomic statistics tracking
//   - Size-aware cache management
//
// Architecture:
//   1. Cache entries stored in hash table for fast lookup
//   2. LRU tracking via last_access timestamps
//   3. Atomic counters for hit/miss statistics
//   4. Size tracking for memory limits
//
// Cache Policies:
//   - LRU: Evict least recently used entries when full
//   - Hot Files: Track frequently accessed data
//   - Size Limits: Respect both entry count and byte capacity
//
// ============================================
// CACHE ENTRY STRUCT
// ============================================

struct CacheEntry {
    key: u32,                       // Hash key for cache lookup
    data: array<vec4<u32>>,          // RGBA texture data (flexible size)
    last_access: u32,                // LRU timestamp
    access_count: u32,               // Hot file detection counter
    size_bytes: u32,                // Size in bytes
    valid: u32,                      // 1 if entry is valid, 0 if empty
}

// ============================================
// CACHE LOOKUP RESULT STRUCT
// ============================================

struct CacheLookupResult {
    found: u32,                      // 1 if found, 0 if not found (bool as u32)
    data_ptr: u32,                   // Pointer/index to texture data
    cache_hit: u32,                  // 1 if cache hit, 0 if miss (bool as u32)
    access_count: u32,               // Number of times this entry was accessed
    padding: array<u32, 3>,
}

// ============================================
// CACHE CONFIGURATION
// ============================================

struct CacheConfig {
    max_entries: u32,                // Maximum number of cache entries
    max_size_bytes: u32,             // Maximum total cache size in bytes
    current_entries: atomic<u32>,    // Current number of entries (atomic)
    current_size_bytes: atomic<u32>,  // Current total size in bytes (atomic)
    hits: atomic<u32>,               // Cache hit counter (atomic)
    misses: atomic<u32>,              // Cache miss counter (atomic)
    evictions: atomic<u32>,          // Eviction counter (atomic)
    timestamp: atomic<u32>,          // Global timestamp for LRU (atomic)
    hot_threshold: u32,              // Access count threshold for "hot" files
    padding: array<u32, 4>,
}

// ============================================
// BINDINGS
// ============================================

// Hash table for cache entries (fixed size array)
// Each entry is stored at index = hash(key) % max_entries
struct CacheHashTable {
    entries: array<CacheEntry>,
}

@group(0) @binding(0) var<storage, read_write> cache_table: CacheHashTable;

// Cache lookup requests
struct CacheLookupRequest {
    key: u32,                       // Cache key to lookup
    requester_id: u32,               // ID of requesting component
    padding: array<u32, 2>,
}

@group(0) @binding(1) var<storage, read> lookup_requests: array<CacheLookupRequest>;

// Cache lookup results
@group(0) @binding(2) var<storage, read_write> lookup_results: array<CacheLookupResult>;

// Cache insert requests
struct CacheInsertRequest {
    key: u32,                       // Cache key for insertion
    data_index: u32,                 // Index to data in storage buffer
    size_bytes: u32,                 // Size of data in bytes
    requester_id: u32,               // ID of requesting component
    padding: u32,
}

@group(0) @binding(3) var<storage, read> insert_requests: array<CacheInsertRequest>;

// Texture data storage (for insert operations)
@group(0) @binding(4) var<storage, read> texture_data_storage: array<vec4<u32>>;

// Cache configuration (read-write for statistics updates)
@group(0) @binding(5) var<storage, read_write> config: CacheConfig;

// ============================================
// CONSTANTS
// ============================================

// Special values
const INVALID_KEY: u32 = 0xFFFFFFFFu;
const INVALID_PTR: u32 = 0xFFFFFFFFu;
const CACHE_HIT: u32 = 1u;
const CACHE_MISS: u32 = 0u;
const ENTRY_VALID: u32 = 1u;
const ENTRY_INVALID: u32 = 0u;

// Hash constants (FNV-1a inspired)
const FNV_PRIME: u32 = 16777619u;
const FNV_OFFSET_BASIS: u32 = 2166136261u;

// Default hot threshold
const DEFAULT_HOT_THRESHOLD: u32 = 10u;

// ============================================
// HASH FUNCTION
// ============================================

// Hash function for cache keys
// Uses FNV-1a inspired algorithm for good distribution
fn hash_key(key: u32) -> u32 {
    var hash = FNV_OFFSET_BASIS;
    var k = key;

    // Mix the key
    hash = hash ^ (k & 0xFFu);
    hash = hash * FNV_PRIME;
    k = k >> 8u;

    hash = hash ^ (k & 0xFFu);
    hash = hash * FNV_PRIME;
    k = k >> 8u;

    hash = hash ^ (k & 0xFFu);
    hash = hash * FNV_PRIME;
    k = k >> 8u;

    hash = hash ^ k;
    hash = hash * FNV_PRIME;

    return hash;
}

// Calculate cache index from hash key
fn hash_to_index(hash: u32, max_entries: u32) -> u32 {
    return hash % max_entries;
}

// ============================================
// INTERNAL CACHE LOOKUP
// ============================================

// Internal cache lookup function
// Returns CacheLookupResult with found status and data pointer
fn cache_lookup_internal(key: u32) -> CacheLookupResult {
    var result: CacheLookupResult;

    // Initialize result as not found
    result.found = 0u;
    result.data_ptr = INVALID_PTR;
    result.cache_hit = CACHE_MISS;
    result.access_count = 0u;
    result.padding = array<u32, 3>(0u, 0u, 0u);

    // Calculate hash and index
    let hash = hash_key(key);
    let index = hash_to_index(hash, config.max_entries);

    // Bounds check
    if (index >= config.max_entries) {
        return result;
    }

    // Get entry from hash table
    let entry = cache_table.entries[index];

    // Check if entry is valid and key matches
    if (entry.valid == ENTRY_VALID && entry.key == key) {
        // Cache hit!
        result.found = 1u;
        result.data_ptr = index;
        result.cache_hit = CACHE_HIT;
        result.access_count = entry.access_count;
    }

    return result;
}

// ============================================
// CACHE INSERT
// ============================================

// Insert entry into cache
// Handles collision via linear probing
fn cache_insert_internal(
    key: u32,
    data_index: u32,
    size_bytes: u32
) -> u32 {
    // Calculate initial hash
    let hash = hash_key(key);
    var index = hash_to_index(hash, config.max_entries);
    let max_probes = config.max_entries;
    var probe_count: u32 = 0u;

    // Linear probing for collision resolution
    loop {
        if (probe_count >= max_probes) {
            return INVALID_PTR;  // Cache is full
        }

        let entry_ptr = &cache_table.entries[index];
        let entry = *entry_ptr;

        // Check for empty slot or matching key
        if (entry.valid == ENTRY_INVALID) {
            // Found empty slot, insert here
            entry_ptr.key = key;
            entry_ptr.last_access = atomicLoad(&config.timestamp);
            entry_ptr.access_count = 1u;
            entry_ptr.size_bytes = size_bytes;
            entry_ptr.valid = ENTRY_VALID;

            // Copy data from storage (first vec4 for now)
            if (data_index != INVALID_PTR && arrayLength(&texture_data_storage) > data_index) {
                entry_ptr.data[0] = texture_data_storage[data_index];
            }

            // Update cache statistics
            let _ = atomicAdd(&config.current_entries, 1u);
            let _ = atomicAdd(&config.current_size_bytes, size_bytes);

            return index;
        }

        // Check if key already exists (update case)
        if (entry.key == key) {
            // Update existing entry
            entry_ptr.last_access = atomicLoad(&config.timestamp);
            let _ = atomicAdd(&entry_ptr.access_count, 1u);

            return index;
        }

        // Collision: move to next slot (linear probing)
        index = (index + 1u) % config.max_entries;
        probe_count = probe_count + 1u;

        continuing;
    }
}

// ============================================
// CACHE EVICTION (LRU)
// ============================================

// Find and evict the least recently used entry
fn cache_evict_internal() -> u32 {
    var lru_index: u32 = 0u;
    var lru_timestamp: u32 = 0xFFFFFFFFu;

    // Search for entry with oldest last_access
    for (var i: u32 = 0u; i < config.max_entries; i = i + 1u) {
        let entry = cache_table.entries[i];

        if (entry.valid == ENTRY_VALID && entry.last_access < lru_timestamp) {
            lru_timestamp = entry.last_access;
            lru_index = i;
        }
    }

    // Evict the LRU entry
    if (lru_timestamp != 0xFFFFFFFFu) {
        let entry_ptr = &cache_table.entries[lru_index];

        // Update statistics
        let _ = atomicSub(&config.current_entries, 1u);
        let _ = atomicSub(&config.current_size_bytes, entry_ptr.size_bytes);
        let _ = atomicAdd(&config.evictions, 1u);

        // Mark as invalid
        entry_ptr.valid = ENTRY_INVALID;

        return lru_index;
    }

    return INVALID_PTR;
}

// ============================================
// MAIN COMPUTE KERNELS
// ============================================

// Cache lookup kernel
// Processes lookup requests in parallel
@compute @workgroup_size(256)
fn cache_lookup(
    @builtin(global_invocation_id) global_id: vec3<u32>
) {
    let index = global_id.x;

    // Bounds check
    if (index >= arrayLength(&lookup_requests)) {
        return;
    }

    let request = lookup_requests[index];

    // Perform cache lookup
    var result = cache_lookup_internal(request.key);

    // Update statistics
    if (result.cache_hit == CACHE_HIT) {
        let _ = atomicAdd(&config.hits, 1u);

        // Update access count and timestamp on hit
        let entry_ptr = &cache_table.entries[result.data_ptr];
        let _ = atomicAdd(&entry_ptr.access_count, 1u);
        entry_ptr.last_access = atomicLoad(&config.timestamp);
    } else {
        let _ = atomicAdd(&config.misses, 1u);
    }

    // Store result
    lookup_results[index] = result;
}

// Cache insert kernel
// Processes insert requests in parallel
@compute @workgroup_size(256)
fn cache_insert(
    @builtin(global_invocation_id) global_id: vec3<u32>
) {
    let index = global_id.x;

    // Bounds check
    if (index >= arrayLength(&insert_requests)) {
        return;
    }

    let request = insert_requests[index];

    // Check if we have space
    let current_entries = atomicLoad(&config.current_entries);
    let current_size = atomicLoad(&config.current_size_bytes);

    var needs_eviction = false;

    if (current_entries >= config.max_entries) {
        needs_eviction = true;
    }

    if ((current_size + request.size_bytes) > config.max_size_bytes) {
        needs_eviction = true;
    }

    // Evict if necessary
    if (needs_eviction) {
        let _ = cache_evict_internal();
    }

    // Insert the new entry
    let entry_index = cache_insert_internal(
        request.key,
        request.data_index,
        request.size_bytes
    );

    // Update timestamp for next LRU calculation
    let _ = atomicAdd(&config.timestamp, 1u);
}

// ============================================
// STATISTICS UPDATE KERNEL
// ============================================

// Update cache statistics kernel
// Resets or updates statistics tracking
@compute @workgroup_size(1)
fn cache_update_stats(
    @builtin(global_invocation_id) global_id: vec3<u32>
) {
    // This kernel can be used to periodically update statistics
    // or perform cache maintenance operations

    let total_requests = atomicLoad(&config.hits) + atomicLoad(&config.misses);

    if (total_requests > 0u) {
        // Calculate hit ratio could be done here
        let hit_ratio = (atomicLoad(&config.hits) * 1000u) / total_requests;
        // Could store to debug buffer for monitoring
    }

    // Optionally, we could scan for cold entries and mark them
    // for pre-emptive eviction here
}

// Reset statistics kernel
@compute @workgroup_size(1)
fn cache_reset_stats() {
    atomicStore(&config.hits, 0u);
    atomicStore(&config.misses, 0u);
    atomicStore(&config.evictions, 0u);
    atomicStore(&config.timestamp, 0u);
}

// Clear cache kernel
// Evicts all entries and resets cache
@compute @workgroup_size(256)
fn cache_clear(
    @builtin(global_invocation_id) global_id: vec3<u32>
) {
    let index = global_id.x;

    if (index >= config.max_entries) {
        return;
    }

    let entry_ptr = &cache_table.entries[index];
    entry_ptr.valid = ENTRY_INVALID;
    entry_ptr.last_access = 0u;
    entry_ptr.access_count = 0u;

    // Reset statistics if this is the first work item
    if (index == 0u) {
        atomicStore(&config.current_entries, 0u);
        atomicStore(&config.current_size_bytes, 0u);
        atomicStore(&config.hits, 0u);
        atomicStore(&config.misses, 0u);
        atomicStore(&config.evictions, 0u);
        atomicStore(&config.timestamp, 0u);
    }
}

// ============================================
// UTILITY KERNELS
// ============================================

// Batch lookup kernel
// Optimized for processing multiple lookups with shared workgroup memory
@compute @workgroup_size(256)
fn cache_batch_lookup(
    @builtin(global_invocation_id) global_id: vec3<u32>,
    @builtin(workgroup_id) workgroup_id: vec3<u32>
) {
    let index = global_id.x;

    if (index >= arrayLength(&lookup_requests)) {
        return;
    }

    // Workgroup barrier for synchronization
    workgroupBarrier();

    let request = lookup_requests[index];

    // Perform cache lookup
    var result = cache_lookup_internal(request.key);

    // Update statistics atomically
    if (result.cache_hit == CACHE_HIT) {
        let _ = atomicAdd(&config.hits, 1u);

        // Update entry with new access info
        let entry_ptr = &cache_table.entries[result.data_ptr];
        let new_count = atomicAdd(&entry_ptr.access_count, 1u);
        entry_ptr.last_access = atomicAdd(&config.timestamp, 1u);
    } else {
        let _ = atomicAdd(&config.misses, 1u);
    }

    // Storage barrier before writing results
    storageBarrier();

    // Store result
    lookup_results[index] = result;

    // Workgroup barrier before completion
    workgroupBarrier();
}

// Hot file detection kernel
// Identifies frequently accessed files based on access count
@compute @workgroup_size(256)
fn cache_detect_hot_files(
    @builtin(global_invocation_id) global_id: vec3<u32>
) {
    let index = global_id.x;

    if (index >= config.max_entries) {
        return;
    }

    let entry = cache_table.entries[index];

    // Check if entry is valid and meets hot threshold
    if (entry.valid == ENTRY_VALID && entry.access_count >= config.hot_threshold) {
        // This is a hot file
        // Could be written to a separate debug buffer or statistics array
        // For now, we just identify them
        let _ = entry;  // Prevent unused variable warning
    }
}

// ============================================
// PERFORMANCE OPTIMIZATION NOTES
// ============================================
//
// 1. Hash-Based Lookup:
//    - O(1) average case lookup time
//    - FNV-1a inspired hash for good distribution
//    - Linear probing for collision resolution
//
// 2. LRU Eviction:
//    - Timestamp-based tracking for access order
//    - Global atomic timestamp for consistency
//    - Eviction on insert when cache is full
//
// 3. Atomic Statistics:
//    - Lock-free hit/miss counting
//    - Atomic size tracking for memory limits
//    - Per-entry atomic access counting
//
// 4. Memory Access Patterns:
//    - Coalesced access patterns for hash table
//    - Storage barriers for consistency
//    - Workgroup barriers for synchronization
//
// 5. Performance Targets:
//    - Lookup latency: <100ns (GPU)
//    - Insert latency: <500ns (GPU)
//    - Throughput: >10M lookups/sec
//    - Hit ratio target: >80%
//
// 6. Cache Policies:
//    - LRU eviction for temporal locality
//    - Hot file detection for prefetch hints
//    - Size-aware eviction for memory limits
//
// 7. Scalability:
//    - 256 work items per workgroup
//    - Parallel lookup/insert operations
//    - Atomic operations for consistency
//
// 8. Use Cases:
//    - Texture data caching for rendering
//    - Shader uniform caching
//    - Vertex buffer caching
//    - Compressed texture caching
//
// ============================================
