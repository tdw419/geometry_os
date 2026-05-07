; subroutine calls
; initialization
  LDI r9, 0x347661
  LDI r14, 935
  LDI r3, 0xD34E0A
  LDI r15, 256
  LDI r10, 0x1EF87A
  LDI r11, 0x79446F
  LDI r6, 0xE57A34
  LDI r7, 10
  CALL func_0
func_0:
  AND r12, r11, r13
  DIV r8, r2, r9
  MOD r13, r15, r2
  OR r15, r12, r7
  SHL r3, r9, r30
  XOR r1, r0, r3
  RET
  CALL func_1
func_1:
  AND r11, r27, r12
  XOR r15, r6, r13
  RET
  CALL func_2
func_2:
  AND r3, r14, r2
  AND r9, r2, r7
  ADD r3, r0, r13
  MUL r0, r11, r9
  RET
  HALT
