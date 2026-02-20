//! Tests for GlyphAtlas component (Phase 30.8)
//!
//! The GlyphAtlas provides Unicode font rendering with caching for terminal emulation.

use infinite_map_rs::glyph_atlas::{GlyphAtlas, GlyphKey, GlyphInfo};

#[test]
fn test_glyph_atlas_creation() {
    let atlas = GlyphAtlas::new(512, 512);
    assert_eq!(atlas.width(), 512);
    assert_eq!(atlas.height(), 512);
}

#[test]
fn test_glyph_key_creation() {
    let key = GlyphKey::new('A', 16.0);
    assert_eq!(key.character, 'A');
    assert_eq!(key.size, 16);
}

#[test]
fn test_glyph_key_equality() {
    let key1 = GlyphKey::new('A', 16.0);
    let key2 = GlyphKey::new('A', 16.0);
    let key3 = GlyphKey::new('A', 14.0);
    let key4 = GlyphKey::new('B', 16.0);

    assert_eq!(key1, key2);
    assert_ne!(key1, key3);
    assert_ne!(key1, key4);
}

#[test]
fn test_glyph_cache_miss_returns_none() {
    let atlas = GlyphAtlas::new(256, 256);
    let key = GlyphKey::new('A', 16.0);
    assert!(atlas.get_glyph(&key).is_none());
}

#[test]
fn test_glyph_render_and_cache() {
    let mut atlas = GlyphAtlas::new(512, 512);
    let key = GlyphKey::new('H', 16.0);

    let glyph = atlas.render_glyph(&key).expect("Failed to render 'H'");
    assert!(glyph.width > 0);
    assert!(glyph.height > 0);

    // Should now be cached
    let cached = atlas.get_glyph(&key).expect("Should be cached");
    assert_eq!(cached.width, glyph.width);
    assert_eq!(cached.height, glyph.height);
}

#[test]
fn test_ascii_glyph_rendering() {
    let mut atlas = GlyphAtlas::new(512, 512);

    // Test all printable ASCII characters
    for c in 32u8..=126u8 {
        let key = GlyphKey::new(c as char, 16.0);
        let glyph = atlas.render_glyph(&key)
            .unwrap_or_else(|| panic!("Failed to render ASCII char: {} ({})", c as char, c));

        // Basic validation
        assert!(glyph.width <= 16, "Glyph width should be reasonable for 8x16 font");
        assert!(glyph.height <= 16, "Glyph height should be reasonable for 8x16 font");
        assert!(!glyph.pixels.is_empty() || c == 32, "Space can have empty pixels");
    }
}

#[test]
fn test_unicode_glyph_rendering() {
    let mut atlas = GlyphAtlas::new(512, 512);

    // Test Unicode character (Chinese)
    let key = GlyphKey::new('中', 16.0);
    let glyph = atlas.render_glyph(&key);

    // For Unicode without a proper font loaded, we may return None or a placeholder
    // This test just verifies the function doesn't panic
    if let Some(g) = glyph {
        // If rendered, verify basic structure
        assert!(g.width > 0 || g.height > 0);
    }
    // It's acceptable for Unicode to not render without a proper font
}

#[test]
fn test_glyph_info_properties() {
    let mut atlas = GlyphAtlas::new(512, 512);
    let key = GlyphKey::new('M', 16.0);

    let glyph = atlas.render_glyph(&key).expect("Failed to render 'M'");

    // Verify glyph info has all expected properties
    assert!(glyph.width > 0);
    assert!(glyph.height > 0);
    assert!(glyph.advance_x > 0.0);
    assert!(glyph.bearing_x >= 0.0);
    assert!(glyph.bearing_y >= 0.0);

    // Pixels should match dimensions
    let expected_len = (glyph.width as usize) * (glyph.height as usize);
    assert_eq!(glyph.pixels.len(), expected_len);
}

#[test]
fn test_multiple_sizes() {
    let mut atlas = GlyphAtlas::new(512, 512);

    let key_12 = GlyphKey::new('A', 12.0);
    let key_16 = GlyphKey::new('A', 16.0);
    let key_24 = GlyphKey::new('A', 24.0);

    let glyph_12 = atlas.render_glyph(&key_12).expect("Failed to render at size 12");
    let glyph_16 = atlas.render_glyph(&key_16).expect("Failed to render at size 16");
    let glyph_24 = atlas.render_glyph(&key_24).expect("Failed to render at size 24");

    // Different sizes should be cached separately
    assert_ne!(glyph_12.height, glyph_16.height);
    assert_ne!(glyph_16.height, glyph_24.height);

    // All should be retrievable from cache
    assert!(atlas.get_glyph(&key_12).is_some());
    assert!(atlas.get_glyph(&key_16).is_some());
    assert!(atlas.get_glyph(&key_24).is_some());
}

#[test]
fn test_cache_clear() {
    let mut atlas = GlyphAtlas::new(256, 256);

    // Render some glyphs
    let key = GlyphKey::new('X', 16.0);
    atlas.render_glyph(&key).expect("Failed to render");

    // Verify cached
    assert!(atlas.get_glyph(&key).is_some());

    // Clear cache
    atlas.clear_cache();

    // Should no longer be cached
    assert!(atlas.get_glyph(&key).is_none());
}

#[test]
fn test_cache_statistics() {
    let mut atlas = GlyphAtlas::new(512, 512);

    // Initial stats
    let (hits, misses) = atlas.cache_stats();
    assert_eq!(hits, 0);
    assert_eq!(misses, 0);

    // Render a glyph (cache miss)
    let key1 = GlyphKey::new('A', 16.0);
    atlas.render_glyph(&key1);

    let (hits, misses) = atlas.cache_stats();
    assert_eq!(hits, 0);
    assert_eq!(misses, 1);

    // Render same glyph again (cache hit via render_glyph)
    atlas.render_glyph(&key1);

    let (hits, misses) = atlas.cache_stats();
    assert_eq!(hits, 1);
    assert_eq!(misses, 1);

    // Different glyph (cache miss)
    let key2 = GlyphKey::new('B', 16.0);
    atlas.render_glyph(&key2);

    let (hits, misses) = atlas.cache_stats();
    assert_eq!(hits, 1);
    assert_eq!(misses, 2);
}

#[test]
fn test_glyph_atlas_different_sizes() {
    let atlas_small = GlyphAtlas::new(128, 128);
    let atlas_large = GlyphAtlas::new(1024, 1024);

    assert_eq!(atlas_small.width(), 128);
    assert_eq!(atlas_small.height(), 128);
    assert_eq!(atlas_large.width(), 1024);
    assert_eq!(atlas_large.height(), 1024);
}
