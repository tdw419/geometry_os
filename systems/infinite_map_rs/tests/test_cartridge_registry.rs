//! Tests for CartridgeRegistry

use infinite_map_rs::cartridge_registry::{CartridgeEntry, CartridgeRegistry};

#[test]
fn test_cartridge_registry_add_entry() {
    let mut registry = CartridgeRegistry::new();

    let entry = CartridgeEntry {
        id: "test-cartridge-1".to_string(),
        path: "/tmp/test.rts.png".to_string(),
        spawn_x: 100.0,
        spawn_y: 200.0,
        generation: 1,
        fitness: 0.95,
        created_at: std::time::SystemTime::now(),
    };

    registry.add_entry(entry);

    assert_eq!(registry.len(), 1);
    assert!(registry.get_entry("test-cartridge-1").is_some());
}

#[test]
fn test_cartridge_registry_get_by_position() {
    let mut registry = CartridgeRegistry::new();

    let entry = CartridgeEntry {
        id: "test-cartridge-1".to_string(),
        path: "/tmp/test.rts.png".to_string(),
        spawn_x: 100.0,
        spawn_y: 200.0,
        generation: 1,
        fitness: 0.95,
        created_at: std::time::SystemTime::now(),
    };

    registry.add_entry(entry);

    let found = registry.get_entry_at_position(100.0, 200.0, 50.0); // 50px tolerance
    assert!(found.is_some());
    assert_eq!(found.unwrap().id, "test-cartridge-1");
}
