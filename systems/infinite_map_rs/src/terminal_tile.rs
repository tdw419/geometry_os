//! Phase 45 / Horizon 1.3: Native Terminal Tile
//!
//! A native GPU-accelerated terminal emulator that exists as a
//! spatial entity on the infinite map.

use crate::terminal_emulator::{TerminalEmulator, TerminalBuffer};
use std::time::Instant;

/// Represents a terminal tile on the map
pub struct TerminalTile {
    pub id: usize,
    pub pty_id: Option<usize>,
    pub window_id: Option<usize>,
    pub title: String,
    pub emulator: TerminalEmulator,
    pub buffer: TerminalBuffer,
    pub last_update: Instant,
    pub width_chars: usize,
    pub height_chars: usize,
    /// RGBA8 texture data
    pub texture_data: Vec<u8>,
    pub texture_width: u32,
    pub texture_height: u32,
    pub needs_render: bool,
}

impl TerminalTile {
    pub fn new(id: usize, title: String, w: usize, h: usize) -> Self {
        let buffer = TerminalBuffer::new(h, w);
        let mut emulator = TerminalEmulator::new(h, w);
        
        // Welcome message
        let welcome = format!("\x1b[36mGEOMETRY OS - TERMINAL v1.0\x1b[0m\nConnected to Visual Substrate.\nReady.\n\n$ ");
        emulator.feed(welcome.as_bytes());

        let char_w = 8;
        let char_h = 16;
        let tw = (w * char_w) as u32;
        let th = (h * char_h) as u32;

        Self {
            id,
            pty_id: None,
            window_id: None,
            title,
            emulator,
            buffer,
            last_update: Instant::now(),
            width_chars: w,
            height_chars: h,
            texture_data: vec![0u8; (tw * th * 4) as usize],
            texture_width: tw,
            texture_height: th,
            needs_render: true,
        }
    }

    /// Push data to terminal
    pub fn write(&mut self, data: &[u8]) {
        self.emulator.feed(data);
        self.needs_render = true;
    }

    /// Render terminal buffer to RGBA texture using a simple fallback font
    pub fn update_texture(&mut self, external_emulator: Option<&TerminalEmulator>) {
        if !self.needs_render {
            return;
        }

        let char_w = 8;
        let char_h = 16;
        let size_chars = (self.width_chars, self.height_chars);
        
        let emulator = external_emulator.unwrap_or(&self.emulator);

        // Clear background (Dark Blue-ish Black)
        for i in 0..self.texture_data.len() / 4 {
            self.texture_data[i * 4] = 10;
            self.texture_data[i * 4 + 1] = 12;
            self.texture_data[i * 4 + 2] = 15;
            self.texture_data[i * 4 + 3] = 255;
        }

        // Render each character
        for y in 0..size_chars.1 {
            for x in 0..size_chars.0 {
                let cell_data = {
                    let cell = match emulator.get_buffer().get_cell(y, x) {
                        Some(c) => c,
                        None => continue,
                    };

                    let fg = cell.attrs.effective_fg().to_rgba();
                    let bg = cell.attrs.effective_bg().to_rgba();
                    (cell.c, fg, bg)
                };

                let (c, fg, bg) = cell_data;

                // Draw background if not black
                if bg[0] != 0 || bg[1] != 0 || bg[2] != 0 {
                    self.draw_rect(
                        (x * char_w) as u32,
                        (y * char_h) as u32,
                        char_w as u32,
                        char_h as u32,
                        [bg[0], bg[1], bg[2]]
                    );
                }

                // Skip drawing if character is space and background was already handleable
                if c == ' ' {
                    continue;
                }

                // Draw character (Foreground)
                self.draw_char(
                    c,
                    (x * char_w) as u32,
                    (y * char_h) as u32,
                    [fg[0], fg[1], fg[2]]
                );
            }
        }

        self.needs_render = false;
        self.last_update = Instant::now();
    }

    fn draw_rect(&mut self, x: u32, y: u32, w: u32, h: u32, color: [u8; 3]) {
        for ry in 0..h {
            for rx in 0..w {
                let px = (x + rx) as usize;
                let py = (y + ry) as usize;
                if px < self.texture_width as usize && py < self.texture_height as usize {
                    let idx = (py * self.texture_width as usize + px) * 4;
                    self.texture_data[idx] = color[0];
                    self.texture_data[idx + 1] = color[1];
                    self.texture_data[idx + 2] = color[2];
                }
            }
        }
    }

    fn draw_char(&mut self, ch: char, x: u32, y: u32, color: [u8; 3]) {
        // Simple 5x7 bitmap (fallback)
        let pattern = crate::font_atlas::get_char_pattern(ch as u8);
        for py in 0..7 {
            let row = pattern[py as usize];
            for px in 0..5 {
                if (row >> (4 - px)) & 1 == 1 {
                    // Draw pixel (scaled to 8x16, let's just do 1:1 in top corner for now)
                    let tx = x + px as u32 + 1;
                    let ty = y + py as u32 + 4;
                    if tx < self.texture_width && ty < self.texture_height {
                        let idx = (ty * self.texture_width + tx) as usize * 4;
                        self.texture_data[idx] = color[0];
                        self.texture_data[idx + 1] = color[1];
                        self.texture_data[idx + 2] = color[2];
                    }
                }
            }
        }
    }

    fn ansi_to_rgb(&self, _color: u8) -> [u8; 3] {
        [200, 200, 200]
    }

    /// Generate packed u32 buffer for WGSL shader
    pub fn get_shader_buffer(&self, emulator: &TerminalEmulator) -> Vec<u32> {
        let buffer = emulator.get_buffer();
        let mut data = Vec::with_capacity(self.width_chars * self.height_chars);
        
        for y in 0..self.height_chars {
            for x in 0..self.width_chars {
                if let Some(cell) = buffer.get_cell(y, x) {
                    let char_byte = cell.c as u32;
                    let fg_idx = cell.attrs.effective_fg().to_indexed() as u32;
                    let bg_idx = cell.attrs.effective_bg().to_indexed() as u32;
                    let mut flags = 0u32;
                    if cell.attrs.bold { flags |= 1; }
                    if cell.attrs.dim { flags |= 2; }
                    if cell.attrs.italic { flags |= 4; }
                    if cell.attrs.underline { flags |= 8; }
                    if cell.attrs.blink { flags |= 16; }
                    if cell.attrs.inverse { flags |= 32; }
                    
                    let packed = (char_byte << 24) | (fg_idx << 16) | (bg_idx << 8) | flags;
                    data.push(packed);
                } else {
                    data.push(0);
                }
            }
        }
        data
    }
}
