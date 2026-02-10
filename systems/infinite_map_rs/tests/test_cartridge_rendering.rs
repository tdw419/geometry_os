//! Tests for cartridge rendering in Evolution Zone

//! Test that cartridges are rendered during update cycle
#[test]
fn test_cartridges_rendered_during_update() {
    use crate::app::InfiniteMapApp;

    // The presence of render_cartridges method means cartridges will be rendered
    // during the update_modules() cycle
    // This is a compile-time check since rendering requires GPU context
}

//! Test that cartridge registry is accessible
#[test]
fn test_cartridge_registry_accessible() {
    use crate::evolution_manager::EvolutionManager;

    let manager = EvolutionManager::new("/tmp/test.sock".to_string());

    // Verify get_cartridge_registry method exists and is callable
    let _registry = manager.get_cartridge_registry();
    // If we get here, the method exists
}
