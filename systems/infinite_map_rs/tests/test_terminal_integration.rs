// Phase 30.8: Terminal Integration Tests
//
// Tests for GlyphAtlas and DamageTracker integration with TerminalBuffer

use infinite_map_rs::terminal_emulator::{TerminalBuffer, CellAttributes};
use infinite_map_rs::damage_tracker::DamageTracker;
use infinite_map_rs::glyph_atlas::{GlyphAtlas, GlyphKey};

/// Test that TerminalBuffer integrates with DamageTracker
#[test]
fn test_buffer_damage_tracking() {
    let mut buffer = TerminalBuffer::new(24, 80);
    let mut tracker = DamageTracker::new(80, 24);

    // Initially no damage
    assert!(!tracker.has_damage());

    // Write a character with tracking
    buffer.write_char_tracked('A', CellAttributes::default(), &mut tracker);

    // Now we should have damage
    assert!(tracker.has_damage());
    assert!(tracker.is_dirty(0, 0));

    // Cursor should have advanced
    let (row, col) = buffer.get_cursor();
    assert_eq!(row, 0);
    assert_eq!(col, 1);
}

/// Test that multiple writes create multiple dirty cells
#[test]
fn test_multiple_tracked_writes() {
    let mut buffer = TerminalBuffer::new(24, 80);
    let mut tracker = DamageTracker::new(80, 24);

    // Write several characters
    buffer.write_char_tracked('H', CellAttributes::default(), &mut tracker);
    buffer.write_char_tracked('i', CellAttributes::default(), &mut tracker);
    buffer.write_char_tracked('!', CellAttributes::default(), &mut tracker);

    // All three cells should be dirty
    assert!(tracker.is_dirty(0, 0)); // 'H'
    assert!(tracker.is_dirty(1, 0)); // 'i'
    assert!(tracker.is_dirty(2, 0)); // '!'
}

/// Test full damage marking
#[test]
fn test_full_damage_marking() {
    let buffer = TerminalBuffer::new(24, 80);
    let mut tracker = DamageTracker::new(80, 24);

    // Mark entire screen as damaged
    buffer.mark_full_damage(&mut tracker);

    // Should have damage
    assert!(tracker.has_damage());

    // Should cover corners and center
    assert!(tracker.is_dirty(0, 0));
    assert!(tracker.is_dirty(79, 0));
    assert!(tracker.is_dirty(0, 23));
    assert!(tracker.is_dirty(79, 23));
    assert!(tracker.is_dirty(40, 12));

    // Compute dirty rects should cover the whole screen
    let rects = tracker.compute_dirty_rects();
    assert!(!rects.is_empty());
}

/// Test that regular write_char does NOT trigger damage tracking
#[test]
fn test_untracked_write_no_damage() {
    let mut buffer = TerminalBuffer::new(24, 80);
    let mut tracker = DamageTracker::new(80, 24);

    // Write without tracking
    buffer.write_char('X', CellAttributes::default());

    // Should NOT have damage
    assert!(!tracker.has_damage());
    assert!(!tracker.is_dirty(0, 0));
}

/// Test GlyphAtlas basic functionality
#[test]
fn test_glyph_atlas_creation() {
    let atlas = GlyphAtlas::new(512, 512);
    assert_eq!(atlas.width(), 512);
    assert_eq!(atlas.height(), 512);
}

/// Test GlyphAtlas rendering ASCII characters
#[test]
fn test_glyph_atlas_ascii_rendering() {
    let mut atlas = GlyphAtlas::new(512, 512);

    for c in 32u8..=126u8 {
        let key = GlyphKey::new(c as char, 16.0);
        let glyph = atlas.render_glyph(&key);
        assert!(glyph.is_some(), "Failed to render ASCII char: {}", c as char);
    }
}

/// Test GlyphAtlas caching behavior
#[test]
fn test_glyph_atlas_caching() {
    let mut atlas = GlyphAtlas::new(512, 512);

    let key = GlyphKey::new('A', 16.0);

    // First render: cache miss
    let _glyph1 = atlas.render_glyph(&key).unwrap();
    let (_, misses) = atlas.cache_stats();
    assert_eq!(misses, 1);

    // Second render: cache hit
    let _glyph2 = atlas.render_glyph(&key).unwrap();
    let (hits, _) = atlas.cache_stats();
    assert_eq!(hits, 1);
}

/// Test GlyphAtlas cache clearing
#[test]
fn test_glyph_atlas_clear_cache() {
    let mut atlas = GlyphAtlas::new(512, 512);

    // Render some glyphs
    atlas.render_glyph(&GlyphKey::new('X', 16.0)).unwrap();
    atlas.render_glyph(&GlyphKey::new('Y', 16.0)).unwrap();
    atlas.render_glyph(&GlyphKey::new('Z', 16.0)).unwrap();

    assert_eq!(atlas.cached_count(), 3);

    // Clear cache
    atlas.clear_cache();

    assert_eq!(atlas.cached_count(), 0);
    let (hits, misses) = atlas.cache_stats();
    assert_eq!(hits, 0);
    assert_eq!(misses, 0);
}

/// Test GlyphAtlas render_string convenience method
#[test]
fn test_glyph_atlas_render_string() {
    let mut atlas = GlyphAtlas::new(512, 512);

    let glyphs = atlas.render_string("Hello", 16.0);
    assert_eq!(glyphs.len(), 5);

    // Each glyph should have increasing x offset
    for i in 1..glyphs.len() {
        assert!(glyphs[i].1 >= glyphs[i - 1].1);
    }
}

/// Test integration: tracked writes followed by dirty rect computation
#[test]
fn test_tracked_writes_dirty_rects() {
    let mut buffer = TerminalBuffer::new(24, 80);
    let mut tracker = DamageTracker::new(80, 24);

    // Write a word at a specific location
    buffer.move_cursor(5, 10);
    for c in "TEST".chars() {
        buffer.write_char_tracked(c, CellAttributes::default(), &mut tracker);
    }

    // Compute dirty rects
    let rects = tracker.compute_dirty_rects();

    // Should have at least one rect
    assert!(!rects.is_empty());

    // The rect should contain the cells we wrote to
    let first_rect = &rects[0];
    assert!(first_rect.contains(10, 5)); // Start of "TEST"
    assert!(first_rect.contains(13, 5)); // End of "TEST"
}

/// Test integration: clear screen with full damage
#[test]
fn test_clear_screen_damage() {
    let mut buffer = TerminalBuffer::new(24, 80);
    let mut tracker = DamageTracker::new(80, 24);

    // Write some content
    buffer.write_char_tracked('A', CellAttributes::default(), &mut tracker);
    buffer.write_char_tracked('B', CellAttributes::default(), &mut tracker);

    // Clear the tracker
    tracker.clear();
    assert!(!tracker.has_damage());

    // Clear screen and mark full damage
    buffer.clear_screen();
    buffer.mark_full_damage(&mut tracker);

    // Should have full screen damage
    assert!(tracker.has_damage());
    let rects = tracker.compute_dirty_rects();
    assert!(!rects.is_empty());
}

/// Test Unicode support check
#[test]
fn test_glyph_atlas_unicode_support() {
    let atlas = GlyphAtlas::new(512, 512);

    // Check if Unicode support is available
    // This depends on system fonts being installed
    let has_unicode = atlas.has_unicode_support();

    // Just verify the method works; result depends on system
    if has_unicode {
        let mut atlas_mut = GlyphAtlas::new(512, 512);
        let key = GlyphKey::new('\u{4E2D}', 16.0); // Chinese character
        let result = atlas_mut.render_glyph(&key);
        // If we have Unicode support, it should render
        // (though we can't guarantee it without specific fonts)
        if result.is_some() {
            let glyph = result.unwrap();
            assert!(glyph.width > 0 || glyph.height > 0);
        }
    }
}

/// Test different font sizes create separate cache entries
#[test]
fn test_glyph_atlas_different_sizes() {
    let mut atlas = GlyphAtlas::new(512, 512);

    let key16 = GlyphKey::new('A', 16.0);
    let key24 = GlyphKey::new('A', 24.0);
    let key32 = GlyphKey::new('A', 32.0);

    let g16 = atlas.render_glyph(&key16).unwrap();
    let g24 = atlas.render_glyph(&key24).unwrap();
    let g32 = atlas.render_glyph(&key32).unwrap();

    // Different sizes should produce different sized glyphs
    assert!(g16.height < g24.height);
    assert!(g24.height < g32.height);

    // Should have 3 cached entries
    assert_eq!(atlas.cached_count(), 3);
}
