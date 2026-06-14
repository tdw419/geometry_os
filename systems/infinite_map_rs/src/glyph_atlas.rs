//! GlyphAtlas - Unicode Font Rendering with Caching (Phase 30.8)
//!
//! This module provides a glyph atlas for rendering and caching font glyphs.
//! It supports both ASCII (via embedded bitmap font) and Unicode characters
//! (via fontdue when a font is loaded).

use fontdue::{Font, FontSettings};
use std::collections::HashMap;

use crate::font_bitmap::FONT_8X16;

/// Key for looking up glyphs in the cache.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct GlyphKey {
    /// The character to render.
    pub character: char,
    /// The font size in pixels (stored as u32 for Eq/Hash).
    pub size: u32,
}

impl GlyphKey {
    /// Create a new glyph key.
    pub fn new(character: char, size: f32) -> Self {
        Self {
            character,
            size: size as u32,
        }
    }

    /// Get the font size as f32.
    pub fn size_f32(&self) -> f32 {
        self.size as f32
    }
}

/// Information about a rendered glyph.
#[derive(Debug, Clone)]
pub struct GlyphInfo {
    /// Width of the glyph in pixels.
    pub width: u32,
    /// Height of the glyph in pixels.
    pub height: u32,
    /// Horizontal advance to the next character.
    pub advance_x: f32,
    /// Horizontal bearing (offset from origin to glyph left).
    pub bearing_x: f32,
    /// Vertical bearing (offset from baseline to glyph top).
    pub bearing_y: f32,
    /// Pixel data (alpha values, 0-255).
    pub pixels: Vec<u8>,
}

/// A glyph atlas that renders and caches font glyphs.
pub struct GlyphAtlas {
    /// Width of the atlas texture.
    width: u32,
    /// Height of the atlas texture.
    height: u32,
    /// Cache of rendered glyphs.
    cache: HashMap<GlyphKey, GlyphInfo>,
    /// Optional fontdue font for Unicode support.
    font: Option<Font>,
    /// Cache hit counter.
    cache_hits: u64,
    /// Cache miss counter.
    cache_misses: u64,
}

impl GlyphAtlas {
    /// Create a new glyph atlas with the given dimensions.
    ///
    /// The dimensions specify the size of the virtual texture atlas,
    /// which may be used for packing rendered glyphs.
    pub fn new(width: u32, height: u32) -> Self {
        // Try to load a default font for Unicode support
        let font = Self::load_default_font();

        Self {
            width,
            height,
            cache: HashMap::new(),
            font,
            cache_hits: 0,
            cache_misses: 0,
        }
    }

    /// Attempt to load a default font for Unicode rendering.
    ///
    /// Tries common system fonts. Falls back to None if no font is available,
    /// in which case only ASCII characters will be rendered using the embedded bitmap.
    fn load_default_font() -> Option<Font> {
        // Common font paths on Linux
        let font_paths = [
            "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf",
            "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
            "/usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf",
            "/usr/share/fonts/truetype/noto/NotoSansMono-Regular.ttf",
            "/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc",
            "/usr/share/fonts/truetype/freefont/FreeMono.ttf",
        ];

        for path in &font_paths {
            if let Ok(bytes) = std::fs::read(path) {
                if let Ok(font) = Font::from_bytes(
                    bytes,
                    FontSettings {
                        collection_index: 0,
                        scale: 40.0, // Default scale, will be overridden per-glyph
                        load_substitutions: false,
                    },
                ) {
                    return Some(font);
                }
            }
        }

        None
    }

    /// Get the width of the atlas.
    pub fn width(&self) -> u32 {
        self.width
    }

    /// Get the height of the atlas.
    pub fn height(&self) -> u32 {
        self.height
    }

    /// Get a cached glyph, returning None if not present.
    pub fn get_glyph(&self, key: &GlyphKey) -> Option<&GlyphInfo> {
        let glyph = self.cache.get(key);
        if glyph.is_some() {
            // Note: We can't increment cache_hits here since we only have &self
            // Statistics are updated in render_glyph
        }
        glyph
    }

    /// Render a glyph and cache it.
    ///
    /// For ASCII characters, uses the embedded 8x16 bitmap font.
    /// For Unicode characters, uses fontdue if a font is loaded.
    ///
    /// Returns None if the character cannot be rendered.
    pub fn render_glyph(&mut self, key: &GlyphKey) -> Option<GlyphInfo> {
        // Check cache first
        if let Some(glyph) = self.cache.get(key) {
            self.cache_hits += 1;
            return Some(glyph.clone());
        }

        self.cache_misses += 1;

        // Try to render the glyph
        let glyph = if key.character.is_ascii() {
            self.render_ascii_glyph(key)
        } else if let Some(ref font) = self.font {
            self.render_unicode_glyph(font, key)
        } else {
            return None;
        };

        // Cache the result
        if let Some(ref g) = glyph {
            self.cache.insert(*key, g.clone());
        }

        glyph
    }

    /// Render an ASCII character using the embedded bitmap font.
    fn render_ascii_glyph(&self, key: &GlyphKey) -> Option<GlyphInfo> {
        let c = key.character as u8;

        // Our bitmap font covers ASCII 32-126
        if !(32..=126).contains(&c) {
            return None;
        }

        let bitmap_index = (c - 32) as usize;
        let bitmap = &FONT_8X16[bitmap_index];

        // Scale factor based on requested size
        // Base font is 8 pixels wide, 16 pixels tall
        let scale = (key.size_f32() / 16.0).clamp(0.5, 4.0);
        let scaled_width = (8.0 * scale) as u32;
        let scaled_height = (16.0 * scale) as u32;

        // Render the glyph with scaling
        let mut pixels = vec![0u8; (scaled_width * scaled_height) as usize];

        for y in 0..scaled_height {
            for x in 0..scaled_width {
                // Map scaled coordinates back to original
                let src_x = (x as f32 / scale) as usize;
                let src_y = (y as f32 / scale) as usize;

                if src_y < 16 && src_x < 8 {
                    let byte = bitmap[src_y];
                    let bit = 7 - src_x;
                    if (byte >> bit) & 1 == 1 {
                        // Use bilinear-like interpolation for better scaling
                        let idx = (y * scaled_width + x) as usize;
                        pixels[idx] = 255;
                    }
                }
            }
        }

        Some(GlyphInfo {
            width: scaled_width,
            height: scaled_height,
            advance_x: scaled_width as f32,
            bearing_x: 0.0,
            bearing_y: scaled_height as f32,
            pixels,
        })
    }

    /// Render a Unicode character using fontdue.
    fn render_unicode_glyph(&self, font: &Font, key: &GlyphKey) -> Option<GlyphInfo> {
        let size = key.size_f32();

        // Use fontdue's rasterize method which takes a char directly
        let (metrics, pixels) = font.rasterize(key.character, size);

        Some(GlyphInfo {
            width: metrics.width as u32,
            height: metrics.height as u32,
            advance_x: metrics.advance_width,
            bearing_x: metrics.bounds.xmin,
            bearing_y: metrics.bounds.ymin + metrics.height as f32,
            pixels: pixels.to_vec(),
        })
    }

    /// Clear the glyph cache.
    pub fn clear_cache(&mut self) {
        self.cache.clear();
        self.cache_hits = 0;
        self.cache_misses = 0;
    }

    /// Get cache statistics as (hits, misses).
    pub fn cache_stats(&self) -> (u64, u64) {
        (self.cache_hits, self.cache_misses)
    }

    /// Get the number of cached glyphs.
    pub fn cached_count(&self) -> usize {
        self.cache.len()
    }

    /// Check if a font is loaded for Unicode rendering.
    pub fn has_unicode_support(&self) -> bool {
        self.font.is_some()
    }

    /// Render a string and return glyph positions.
    ///
    /// This is a convenience method for rendering multiple characters.
    /// Returns a vector of (GlyphInfo, x_offset) pairs.
    pub fn render_string(&mut self, text: &str, size: f32) -> Vec<(GlyphInfo, f32)> {
        let mut result = Vec::new();
        let mut x = 0.0f32;

        for c in text.chars() {
            let key = GlyphKey::new(c, size);
            if let Some(glyph) = self.render_glyph(&key) {
                result.push((glyph.clone(), x + glyph.bearing_x));
                x += glyph.advance_x;
            }
        }

        result
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_glyph_key_basic() {
        let key = GlyphKey::new('A', 16.0);
        assert_eq!(key.character, 'A');
        assert_eq!(key.size, 16);
    }

    #[test]
    fn test_glyph_key_hash_and_eq() {
        use std::collections::HashSet;

        let mut set = HashSet::new();
        set.insert(GlyphKey::new('A', 16.0));
        set.insert(GlyphKey::new('A', 16.0)); // Duplicate
        set.insert(GlyphKey::new('B', 16.0));
        set.insert(GlyphKey::new('A', 14.0));

        assert_eq!(set.len(), 3);
    }

    #[test]
    fn test_atlas_basic() {
        let atlas = GlyphAtlas::new(512, 512);
        assert_eq!(atlas.width(), 512);
        assert_eq!(atlas.height(), 512);
    }

    #[test]
    fn test_ascii_rendering() {
        let mut atlas = GlyphAtlas::new(512, 512);

        for c in 32u8..=126u8 {
            let key = GlyphKey::new(c as char, 16.0);
            let glyph = atlas.render_glyph(&key);
            assert!(
                glyph.is_some(),
                "Failed to render ASCII char: {}",
                c as char
            );
        }
    }

    #[test]
    fn test_cache_behavior() {
        let mut atlas = GlyphAtlas::new(512, 512);

        let key = GlyphKey::new('X', 16.0);

        // First render should be a miss
        let _glyph1 = atlas.render_glyph(&key).unwrap();
        let (_, misses) = atlas.cache_stats();
        assert_eq!(misses, 1);

        // Second call should hit cache
        let _glyph2 = atlas.render_glyph(&key).unwrap();
        let (hits, _) = atlas.cache_stats();
        assert_eq!(hits, 1);
    }

    #[test]
    fn test_different_sizes_separate_cache() {
        let mut atlas = GlyphAtlas::new(512, 512);

        let key16 = GlyphKey::new('A', 16.0);
        let key24 = GlyphKey::new('A', 24.0);

        let g16 = atlas.render_glyph(&key16).unwrap();
        let g24 = atlas.render_glyph(&key24).unwrap();

        // Different sizes should produce different glyphs
        assert_ne!(g16.height, g24.height);
    }

    #[test]
    fn test_render_string() {
        let mut atlas = GlyphAtlas::new(512, 512);

        let glyphs = atlas.render_string("Hello", 16.0);
        assert_eq!(glyphs.len(), 5);

        // Each glyph should have increasing x offset
        for i in 1..glyphs.len() {
            assert!(glyphs[i].1 >= glyphs[i - 1].1);
        }
    }
}
