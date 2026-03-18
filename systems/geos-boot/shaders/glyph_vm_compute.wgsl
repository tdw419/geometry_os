// Glyph VM Compute Shader
// Placeholder - reads events, increments cycle counter

@group(0) @binding(0) var<storage, read_write> vm_memory: array<u32>;
@group(0) @binding(1) var<storage, read_write> events: array<u32>;

@compute @workgroup_size(1, 1, 1)
fn main() {
    // Events buffer layout:
    // [0] = version
    // [1] = frame_number
    // [2] = event_count
    // [3] = _padding
    // [4+] = events (4 u32s each)

    let event_count = events[2u];

    if (event_count > 0u) {
        // Echo first event to VM memory for visibility
        vm_memory[256u] = events[4u]; // event_type
        vm_memory[257u] = events[5u]; // param_1
        vm_memory[258u] = events[6u]; // param_2
    }

    // Increment cycle counter at vm_memory[1]
    vm_memory[1u] += 1u;
}
