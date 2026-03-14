#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct AppId(pub u64);

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct GlyphId(pub u32);

#[derive(Debug, Clone, Copy, PartialEq)]
pub struct AppLayout {
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
}

#[derive(Debug, Clone, PartialEq)]
pub enum Intent {
    KeyPress(char),
    MouseClick { x: u32, y: u32 },
    Custom { opcode: u32, payload: Vec<f32> },
}
