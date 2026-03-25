// system_status.rs -> Complete System Status Checker
// Phase 21: Production validation

use std::fs;
use std::path::Path;

struct SystemStatus {
    instance_id: String,
    version: String,
    modules: Vec<ModuleStatus>,
    demos: Vec<DemoStatus>,
    docs: Vec<DocStatus>,
    total_lines: usize,
    total_bytes: usize,
}

struct ModuleStatus {
    name: String,
    path: String,
    lines: usize,
    bytes: usize,
    exists: bool,
}

struct DemoStatus {
    name: String,
    path: String,
    compiled: bool,
    runs: bool,
}

struct DocStatus {
    name: String,
    path: String,
    exists: bool,
}

impl SystemStatus {
    fn new() -> Self {
        Self {
            instance_id: "geometry-os-main".to_string(),
            version: "2.1.0".to_string(),
            modules: Vec::new(),
            demos: Vec::new(),
            docs: Vec::new(),
            total_lines: 0,
            total_bytes: 0,
        }
    }

    fn check_module(&mut self, name: &str, path: &str) {
        let exists = Path::new(path).exists();
        let (lines, bytes) = if exists {
            if let Ok(content) = fs::read_to_string(path) {
                let l = content.lines().count();
                let b = content.len();
                self.total_lines += l;
                self.total_bytes += b;
                (l, b)
            } else {
                (0, 0)
            }
        } else {
            (0, 0)
        };

        self.modules.push(ModuleStatus {
            name: name.to_string(),
            path: path.to_string(),
            lines,
            bytes,
            exists,
        });
    }

    fn check_demo(&mut self, name: &str, source: &str, binary: &str) {
        let source_exists = Path::new(source).exists();
        let binary_exists = Path::new(binary).exists();
        
        self.demos.push(DemoStatus {
            name: name.to_string(),
            path: binary.to_string(),
            compiled: source_exists && binary_exists,
            runs: binary_exists,
        });
    }

    fn check_doc(&mut self, name: &str, path: &str) {
        self.docs.push(DocStatus {
            name: name.to_string(),
            path: path.to_string(),
            exists: Path::new(path).exists(),
        });
    }

    fn print_report(&self) {
        println!("╔════════════════════════════════════════════════════════════════╗");
        println!("║           GEOMETRY OS: SYSTEM STATUS REPORT                   ║");
        println!("╚════════════════════════════════════════════════════════════════╝");
        println!();
        
        println!("📊 Instance: {} (v{})", self.instance_id, self.version);
        println!();

        // Modules
        println!("🧩 COGNITIVE MODULES ({})", self.modules.len());
        println!("────────────────────────────────────────────────────────────────");
        
        let mut modules_exist = 0;
        for m in &self.modules {
            let status = if m.exists { "✅" } else { "❌" };
            let size = if m.exists {
                format!("{:.1}KB", m.bytes as f32 / 1024.0)
            } else {
                "N/A".to_string()
            };
            println!("  {} {:<25} {:>8}  {:>6}", status, m.name, m.lines, size);
            if m.exists { modules_exist += 1; }
        }
        println!("  ────────────────────────────────────────────────────────────");
        println!("  {}/{} modules present", modules_exist, self.modules.len());
        println!();

        // Demos
        println!("🎮 DEMOS ({})", self.demos.len());
        println!("────────────────────────────────────────────────────────────────");
        
        let mut demos_ready = 0;
        for d in &self.demos {
            let status = if d.compiled { "✅ READY" } else { "❌ MISSING" };
            println!("  {} {}", d.name, status);
            if d.compiled { demos_ready += 1; }
        }
        println!("  ────────────────────────────────────────────────────────────");
        println!("  {}/{} demos ready", demos_ready, self.demos.len());
        println!();

        // Docs
        println!("📚 DOCUMENTATION ({})", self.docs.len());
        println!("────────────────────────────────────────────────────────────────");
        
        let mut docs_exist = 0;
        for d in &self.docs {
            let status = if d.exists { "✅" } else { "❌" };
            println!("  {} {}", status, d.name);
            if d.exists { docs_exist += 1; }
        }
        println!("  ────────────────────────────────────────────────────────────");
        println!("  {}/{} docs present", docs_exist, self.docs.len());
        println!();

        // Totals
        println!("📈 STATISTICS");
        println!("────────────────────────────────────────────────────────────────");
        println!("  Total Lines: {}", self.total_lines);
        println!("  Total Size: {:.1} KB", self.total_bytes as f32 / 1024.0);
        println!();

        // Final status
        let module_pct = modules_exist as f32 / self.modules.len().max(1) as f32 * 100.0;
        let demo_pct = demos_ready as f32 / self.demos.len().max(1) as f32 * 100.0;
        let doc_pct = docs_exist as f32 / self.docs.len().max(1) as f32 * 100.0;

        println!("════════════════════════════════════════════════════════════════");
        println!("                    SYSTEM HEALTH                               ");
        println!("════════════════════════════════════════════════════════════════");
        println!();
        println!("  Modules:  {}/{} ({:.0}%) {}", modules_exist, self.modules.len(), module_pct, if module_pct == 100.0 { "✅" } else { "⚠️" });
        println!("  Demos:    {}/{} ({:.0}%) {}", demos_ready, self.demos.len(), demo_pct, if demo_pct == 100.0 { "✅" } else { "⚠️" });
        println!("  Docs:     {}/{} ({:.0}%) {}", docs_exist, self.docs.len(), doc_pct, if doc_pct == 100.0 { "✅" } else { "⚠️" });
        println!();

        if module_pct == 100.0 && demo_pct == 100.0 && doc_pct == 100.0 {
            println!("  ✅ STATUS: PRODUCTION READY");
        } else if module_pct >= 80.0 && demo_pct >= 80.0 {
            println!("  🟡 STATUS: DEVELOPMENT");
        } else {
            println!("  ⚠️  STATUS: INCOMPLETE");
        }
        println!();
        println!("════════════════════════════════════════════════════════════════");
    }
}

fn main() {
    let mut status = SystemStatus::new();

    // Check cognitive modules
    status.check_module("neural_mirror", "cognitive/neural_mirror.rs");
    status.check_module("awareness_logger", "cognitive/awareness_logger.rs");
    status.check_module("memory_compressor", "cognitive/memory_compressor.rs");
    status.check_module("dissonance_handler", "cognitive/dissonance_handler.rs");
    status.check_module("memory_replay", "cognitive/memory_replay.rs");
    status.check_module("dream_cycle", "cognitive/dream_cycle.rs");
    status.check_module("neural_gateway", "cognitive/neural_gateway.rs");
    status.check_module("collective_sync", "cognitive/collective_sync.rs");

    // Check demos
    status.check_demo("cognitive_demo", "cognitive_demo.rs", "cognitive_demo");
    status.check_demo("collective_demo", "collective_demo.rs", "collective_demo");
    status.check_demo("runtime", "geometry_os_runtime.rs", "geometry_os_runtime");
    status.check_demo("dashboard", "dashboard.rs", "dashboard");

    // Check docs
    status.check_doc("README", "docs/README.md");
    status.check_doc("COGNITIVE_STACK", "docs/COGNITIVE_STACK.md");
    status.check_doc("morning_boot.sh", "morning_boot.sh");
    status.check_doc("test_all.sh", "test_all.sh");

    status.print_report();
}
