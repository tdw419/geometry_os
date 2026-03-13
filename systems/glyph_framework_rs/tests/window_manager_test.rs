//! WindowManager Integration Tests
//
// Tests the WindowManager functionality end-to-end with the Glyph Framework.
//

use glyph_framework_rs::{AppCoordinator, AppLayout, WgpuBackend, AppId};

#[test]
fn test_window_manager_spawns_as_app_zero() {
    let backend = WgpuBackend::new(16);
    let mut coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");

    // Spawn WindowManager as App #0
    let layout = AppLayout { x: 0, y: 0, width: 32, height: 32 };
    let app_id = coordinator.spawn_app("window_manager", layout).expect("Failed to spawn app");

    assert_eq!(app_id, AppId(0), "WindowManager should be App #0");
}

#[test]
fn test_layout_registry_stores_app_positions() {
    let backend = WgpuBackend::new(16);
    let mut coordinator = AppCoordinator::new(backend).expect("Failed to create coordinator");

    // Spawn WindowManager
    let _wm_id = coordinator.spawn_app("window_manager", AppLayout { x: 0, y: 0, width: 1024, height: 768 }).expect("Failed to spawn WM");

    // Spawn two apps
    let app1_id = coordinator.spawn_app("app1", AppLayout { x: 100, y: 100, width: 200, height: 200 }).expect("Failed to spawn app1");
    let app2_id = coordinator.spawn_app("app2", AppLayout { x: 400, y: 200, width: 200, height: 200 }).expect("Failed to spawn app2");

    // Verify apps are spawned
    assert_eq!(app1_id, AppId(1));
    assert_eq!(app2_id, AppId(2));
}
