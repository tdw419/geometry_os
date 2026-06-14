// Hex Expansion Compute Shader
// Expands raw binary substrate into visual hex dump format
// Part of Phase 40: Hex Tensor Editor

struct HexEditorUniforms {
    cursor_byte_pos: u32,
    cursor_nibble: u32, // 0 = high nibble, 1 = low nibble
    rows_visible: u32,
    bytes_per_row: u32,
    scroll_offset: u32,
}

@group(0) @binding(0) var<uniform> uniforms: HexEditorUniforms;
@group(0) @binding(1) var<storage, read> substrate: array<u32>; // Raw bytes packed as u32
@group(0) @binding(2) var<storage, read_write> text_display: array<u32>; // Output char indices
@group(0) @binding(3) var<storage, read_write> color_map: array<u32>; // Output colors 
@group(0) @binding(4) var<storage, read> annotation_map: array<u32>; // Input metadata (1=Insight, 2=Patch)

// Helper: Get byte from packed u32 array
fn get_byte(index: u32) -> u32 {
    let word_index = index / 4u;
    let byte_offset = index % 4u;
    if (word_index >= arrayLength(&substrate)) {
        return 0u;
    }
    let word = substrate[word_index];
    return (word >> (byte_offset * 8u)) & 0xFFu;
}

// Helper: Get annotation for byte
fn get_annotation(index: u32) -> u32 {
    if (index >= arrayLength(&annotation_map)) {
        return 0u;
    }
    return annotation_map[index];
}

// Helper: Convert nibble to hex char code
fn nibble_to_hex(nibble: u32) -> u32 {
    if (nibble < 10u) {
        return nibble + 48u; // '0'..'9'
    } else {
        return nibble - 10u + 65u; // 'A'..'F'
    }
}

// Entopy color mapping
fn entropy_color(byte_val: u32) -> u32 {
    // ABGR format (Low endian u32)
    // 00 or FF = Low entropy (Blue-ish) -> 0xFFFFAA00
    // ASCII = Medium (Green) -> 0xFF00AA00
    // Control = High (Red-ish) -> 0xFF0000AA
    
    if (byte_val == 0u || byte_val == 255u) {
        return 0xFFFFAA00u; 
    } else if (byte_val >= 32u && byte_val <= 126u) {
        return 0xFF00AA00u; 
    } else {
        return 0xFF0000AAu; 
    }
}

// Annotation Color Mapping
fn annotation_color(tag: u32) -> u32 {
    if (tag == 1u) {
        return 0xFF00D7FFu; // Gold/Yellow -> Neural Insight
    } else if (tag == 2u) {
        return 0xFF0000FFu; // Red -> Patch Suggestion
    }
    return 0u;
}

@compute @workgroup_size(64)
fn expand_hex(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let row_index = global_id.x;
    if (row_index >= uniforms.rows_visible) {
        return;
    }

    let bytes_per_row = uniforms.bytes_per_row;
    let base_addr = (uniforms.scroll_offset + row_index) * bytes_per_row;
    
    let chars_per_row = 10u + (bytes_per_row * 3u) + 2u + bytes_per_row + 1u; // +1 newline
    let output_base = row_index * chars_per_row;

    // 1. Render Offset (Address) - Gray Color
    let addr_color = 0xFFAAAAAAu;
    for (var i = 0u; i < 8u; i = i + 1u) {
        let shift = (7u - i) * 4u;
        let nibble = (base_addr >> shift) & 0xFu;
        text_display[output_base + i] = nibble_to_hex(nibble);
        color_map[output_base + i] = addr_color;
    }
    text_display[output_base + 8u] = 32u;
    text_display[output_base + 9u] = 32u;

    // 2. Render Hex Bytes and ASCII
    let hex_start = output_base + 10u;
    let ascii_start = hex_start + (bytes_per_row * 3u) + 1u;
    
    text_display[ascii_start] = 124u; // '|'
    color_map[ascii_start] = addr_color;
    
    for (var b = 0u; b < bytes_per_row; b = b + 1u) {
        let byte_addr = base_addr + b;
        let val = get_byte(byte_addr);
        let tag = get_annotation(byte_addr);
        
        var color = entropy_color(val);
        let tag_color = annotation_color(tag);
        if (tag_color != 0u) {
            color = tag_color;
        }

        if (byte_addr == uniforms.cursor_byte_pos) {
             // Inverting color logic or specific cursor color handled by renderer usually
             // But we can force white/black here
             color = 0xFFFFFFFFu;
        }
        
        // Hex visualization
        let hex_pos = hex_start + (b * 3u);
        text_display[hex_pos] = nibble_to_hex((val >> 4u) & 0xFu);
        text_display[hex_pos + 1u] = nibble_to_hex(val & 0xFu);
        text_display[hex_pos + 2u] = 32u; // Space
        
        color_map[hex_pos] = color;
        color_map[hex_pos + 1u] = color;
        
        // ASCII visualization
        let ascii_pos = ascii_start + 1u + b;
        if (val >= 32u && val <= 126u) {
            text_display[ascii_pos] = val;
        } else {
            text_display[ascii_pos] = 46u; // '.'
        }
        color_map[ascii_pos] = color;
    }
    
    text_display[ascii_start + 1u + bytes_per_row] = 124u; // '|'
    color_map[ascii_start + 1u + bytes_per_row] = addr_color;
    text_display[ascii_start + 1u + bytes_per_row + 1u] = 10u; // Newline
}
