use infinite_map_rs::damage_tracker::{DamageTracker, DirtyRect};

#[test]
fn test_damage_tracker_creation() {
    let tracker = DamageTracker::new(80, 24);
    assert_eq!(tracker.cols(), 80);
    assert_eq!(tracker.rows(), 24);
}

#[test]
fn test_mark_cell_dirty() {
    let mut tracker = DamageTracker::new(80, 24);
    tracker.mark_dirty(5, 3);
    assert!(tracker.is_dirty(5, 3));
    assert!(!tracker.is_dirty(0, 0));
}

#[test]
fn test_compute_dirty_rects_single() {
    let mut tracker = DamageTracker::new(80, 24);
    tracker.mark_dirty(10, 5);
    tracker.mark_dirty(11, 5);
    tracker.mark_dirty(10, 6);
    let rects = tracker.compute_dirty_rects();
    assert_eq!(rects.len(), 1);
    assert!(rects[0].contains(10, 5));
}

#[test]
fn test_compute_dirty_rects_disjoint() {
    let mut tracker = DamageTracker::new(80, 24);
    tracker.mark_dirty(5, 2);
    tracker.mark_dirty(50, 20);
    let rects = tracker.compute_dirty_rects();
    assert!(!rects.is_empty());
}

#[test]
fn test_clear_damage() {
    let mut tracker = DamageTracker::new(80, 24);
    tracker.mark_dirty(10, 5);
    assert!(tracker.has_damage());
    tracker.clear();
    assert!(!tracker.has_damage());
}

#[test]
fn test_hilbert_mapping() {
    let tracker = DamageTracker::new(80, 24);
    let (x, y) = tracker.hilbert_to_xy(0);
    assert!(x < 80);
    assert!(y < 24);
    let d1 = tracker.xy_to_hilbert(10, 5);
    let (x2, y2) = tracker.hilbert_to_xy(d1);
    assert_eq!((10, 5), (x2, y2));
}
