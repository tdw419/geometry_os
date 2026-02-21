#[cfg(test)]
mod tests {
    use crate::rendering::geometric_interpreter::{
        GeometricEngine, GeometricInstruction, GeometricOpcode,
    };

    #[test]
    fn test_geometric_add() {
        let mut engine = GeometricEngine::new();
        engine.registers[1] = 10;
        engine.registers[2] = 20;

        // ADD x3, x1, x2 (0x33, 1, 2, 3)
        let instr = GeometricInstruction::from([0x33, 1, 2, 3]);
        engine.step(instr);

        assert_eq!(engine.registers[3], 30);
        assert_eq!(engine.pc, 1);
    }

    #[test]
    fn test_geometric_mov_immediate() {
        let mut engine = GeometricEngine::new();

        // MOV x1, 42 (0x01, 42, 0, 1)
        // Note: Our interpreter treats values >= 32 as immediates in read_reg
        let instr = GeometricInstruction::from([0x01, 42, 0, 1]);
        engine.step(instr);

        assert_eq!(engine.registers[1], 42);
    }

    #[test]
    fn test_geometric_halt() {
        let mut engine = GeometricEngine::new();

        // HALT (0x07, 0, 0, 0)
        let instr = GeometricInstruction::from([0x07, 0, 0, 0]);
        engine.step(instr);

        assert!(engine.halted);

        // Next step should do nothing
        let instr_add = GeometricInstruction::from([0x33, 1, 2, 3]);
        engine.step(instr_add);
        assert_eq!(engine.registers[3], 0);
    }
}
