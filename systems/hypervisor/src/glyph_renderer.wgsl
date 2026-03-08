// Glyph Renderer WGSL Compute Shader
// Renders glyph primitives to a Hilbert-indexed texture buffer
// Part of the Native Glyph Visual Shell project
// Target: 60 FPS at 10,000+ glyphs with 95% spatial coherence

// Opcode constants for glyph commands
const GLYPH_NOP: u32 = 0x00u;
const GLYPH_SET_COLOR: u32 = 0x01u;
const GLYPH_DRAW_RECT: u32 = 0x02u;
const GLYPH_FILL_RECT: u32 = 0x03u;
const GLYPH_DRAW_PIXEL: u32 = 0x04u;
const GLYPH_DRAW_CIRCLE: u32 = 0x05u;
const GLYPH_FILL_CIRCLE: u32 = 0x06u;
const GLYPH_DRAW_LINE: u32 = 0x07u;

// Maximum number of commands in the buffer
const MAX_COMMANDS: u32 = 4096u;

// Glyph command structure (32 bytes)
struct GlyphCommand {
    opcode: u32,
    x: u32,
    y: u32,
    width: u32,
    height: u32,
    color: u32,  // 0xRRGGBBAA format
    flags: u32,
    _padding: array<u32, 1>,
}

// Command buffer for glyph rendering
struct GlyphCommandBuffer {
    count: atomic<u32>,
    commands: array<GlyphCommand, 4096>,
}

// Render state for the glyph renderer
struct GlyphRenderState {
    dimension: u32,  // substrate dimension = 2^order
    order: u32,      // Hilbert curve order
    current_color: u32,
    commands_processed: atomic<u32>,
}
