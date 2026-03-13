/// VCC Hardware Attestation Shader
/// Computes a 64-bit hash using FNV-1a + MurmurHash3 finalization on GPU.
/// This is the "source of truth" - CPU is untrusted.
///
/// The GPU computes the hash directly from VRAM, bypassing
/// any potential CPU tampering with the atlas data.

// Module-level constants for FNV-1a hash
const FNV_OFFSET: u32 = 2166136261u;
const FNV_PRIME: u32 = 16777619u;

struct VCCHashInput {
    atlas_width: u32,
    atlas_height: u32,
    contract_hash_low: u32,  // Expected hash (first 64 bits)
    contract_hash_high: u32,
}

struct VCCHashOutput {
    computed_hash_low: u32,
    computed_hash_high: u32,
    matches_contract: u32,
    _padding: u32,
}

@group(0) @binding(0) var<uniform> input: VCCHashInput;
@group(0) @binding(1) var<storage, read> atlas_data: array<u32>;
@group(0) @binding(2) var<storage, read_write> output: VCCHashOutput;

// MurmurHash3-style mixing for 64-bit output
fn murmur3_fmix64(k: u32) -> u32 {
    var h: u32 = k;
    h ^= h >> 16u;
    h = h * 0x85ebca6bu;
    h ^= h >> 13u;
    h = h * 0xc2b2ae35u;
    h ^= h >> 16u;
    return h;
}

@compute @workgroup_size(64)
fn compute_vcc_hash(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Only first workgroup computes the hash
    if (global_id.x != 0u) { return; }

    let total_pixels = input.atlas_width * input.atlas_height;
    let total_u32 = total_pixels * 4u;  // RGBA = 4 bytes per pixel

    // Split data into two halves and hash separately
    let half_len = total_u32 / 2u;

    // Hash first half for low bits
    var hash_low: u32 = FNV_OFFSET;
    for (var i: u32 = 0u; i < half_len; i = i + 1u) {
        hash_low = hash_low ^ atlas_data[i];
        hash_low = hash_low * FNV_PRIME;
    }
    hash_low = murmur3_fmix64(hash_low);

    // Hash second half for high bits
    var hash_high: u32 = FNV_OFFSET;
    for (var i: u32 = half_len; i < total_u32; i = i + 1u) {
        hash_high = hash_high ^ atlas_data[i];
        hash_high = hash_high * FNV_PRIME;
    }
    hash_high = murmur3_fmix64(hash_high);

    // Mix together for better avalanche
    hash_low = hash_low ^ (hash_high * 0x9e3779b9u);
    hash_high = hash_high ^ (hash_low * 0x9e3779b9u);

    let computed_hash_low = hash_low;
    let computed_hash_high = hash_high;

    output.computed_hash_low = computed_hash_low;
    output.computed_hash_high = computed_hash_high;

    // Check if computed hash matches expected contract hash
    let low_matches = computed_hash_low == input.contract_hash_low;
    let high_matches = computed_hash_high == input.contract_hash_high;
    output.matches_contract = select(0u, 1u, low_matches && high_matches);
}

// NOTE: A truly parallel reduction hash would require:
// 1. Workgroup-shared memory for partial hashes
// 2. Multiple dispatch workgroups
// 3. A second pass to combine workgroup results
// 4. Workgroup sync barriers (workgroupBarrier())
//
// The current single-threaded approach is correct and sufficient for
// attestation purposes. Parallel reduction could be added later if
// performance becomes a bottleneck for very large atlases.
