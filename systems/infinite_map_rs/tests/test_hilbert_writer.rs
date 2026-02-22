// tests/test_hilbert_writer.rs
//! Tests for HilbertWriter - 1D to 2D weight mutation mapping

use infinite_map_rs::hilbert_writer::{HilbertWriter, WeightMutation};

#[test]
fn test_create_weight_mutation() {
    let mutation = WeightMutation {
        index_1d: 12345,
        weight_delta: 0.05,
    };

    assert_eq!(mutation.index_1d, 12345);
    assert_eq!(mutation.weight_delta, 0.05);
}

#[test]
fn test_hilbert_index_to_2d() {
    let writer = HilbertWriter::new(2048); // 2048x2048 atlas

    let coord = writer.index_to_2d(12345);

    assert!(coord.x < 2048);
    assert!(coord.y < 2048);
}

#[test]
fn test_write_mutation_to_buffer() {
    let mut writer = HilbertWriter::new(512);

    let mutation = WeightMutation {
        index_1d: 100,
        weight_delta: 0.1,
    };

    let result = writer.apply_mutation(&mutation);

    assert!(result.is_ok());
}

#[test]
fn test_batch_district_upgrade() {
    let mut writer = HilbertWriter::new(512);

    let indices = vec![1000, 1001, 1002, 1003];
    let result = writer.upgrade_district(&indices, 0.5); // Upgrade to steel

    assert!(result.is_ok());
    assert_eq!(result.unwrap(), 4); // 4 pixels updated
}
