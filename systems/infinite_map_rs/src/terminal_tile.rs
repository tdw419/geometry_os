// systems/infinite_map_rs/src/terminal_tile.rs
// Phase 30.7: Terminal Tile Rendering - GPU accelerated text buffers

use std::time::Instant;
use crate::terminal_emulator::TerminalEmulator;

pub struct TerminalTile {
    pub id: usize,
    pub title: String,
    pub width_chars: u32,
    pub height_chars: u32,
    pub texture_width: u32,
    pub texture_height: u32,
    pub texture_data: Vec<u8>,
    pub needs_render: bool,
    pub last_update: Instant,
    pub emulator: TerminalEmulator,
    pub window_id: Option<usize>,
}

impl TerminalTile {
    pub fn new(id: usize, title: String, width: u32, height: u32) -> Self {
        let tex_w = width * 8;
        let tex_h = height * 16;
        TerminalTile {
            id,
            title,
            width_chars: width,
            height_chars: height,
            texture_width: tex_w,
            texture_height: tex_h,
            texture_data: vec![0; (tex_w * tex_h * 4) as usize],
            needs_render: true,
            last_update: Instant::now(),
            emulator: TerminalEmulator::new(height as usize, width as usize),
            window_id: None,
        }
    }

    pub fn get_shader_buffer(&self, _emulator: &TerminalEmulator) -> Vec<u32> {
        // Return packed representation for compute shaders
        // packed: (char << 24) | (fg << 16) | (bg << 8) | flags
        Vec::new()
    }

    pub fn update_texture(&mut self, external_emulator: Option<&TerminalEmulator>) {
        if !self.needs_render && external_emulator.is_none() {
            return;
        }

        let char_w = 8;
        let char_h = 16;
        let size_chars = (self.width_chars, self.height_chars);
        
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
                // Determine which emulator to use and get the cell data
                let (c, fg, bg) = {
                    let emu = match external_emulator {
                        Some(e) => e,
                        None => &self.emulator,
                    };
                    
                    let cell = match emu.get_buffer().get_cell(y as usize, x as usize) {
                        Some(c) => c,
                        None => continue,
                    };

                    let fg = cell.attrs.effective_fg().to_rgba();
                    let bg = cell.attrs.effective_bg().to_rgba();
                    (cell.c, fg, bg)
                };

                // Draw background if not black
                if bg[0] != 0 || bg[1] != 0 || bg[2] != 0 {
                    self.draw_rect_internal(
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
                self.draw_char_internal(
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

    fn draw_rect_internal(&mut self, x: u32, y: u32, w: u32, h: u32, color: [u8; 3]) {
        let tex_w = self.texture_width;
        
        for dy in 0..h {
            for dx in 0..w {
                let px = x + dx;
                let py = y + dy;
                let idx = ((py * tex_w + px) * 4) as usize;
                if idx + 3 < self.texture_data.len() {
                    self.texture_data[idx] = color[0];
                    self.texture_data[idx + 1] = color[1];
                    self.texture_data[idx + 2] = color[2];
                    self.texture_data[idx + 3] = 255;
                }
            }
        }
    }

    fn draw_char_internal(&mut self, _c: char, _x: u32, _y: u32, _color: [u8; 3]) {
        // Placeholder for MSDF or bitmap font rendering
    }
}
