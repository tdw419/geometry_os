; subroutine calls
; initialization
  LDI r19, 32
  LDI r14, 64
  LDI r13, 0xAC2A69
  LDI r0, 8
  LDI r7, 8
  LDI r4, 0x29CB9C
  LDI r3, 3256
  CALL func_0
func_0:
  DIV r8, r5, r3
  AND r9, r3, r12
  AND r9, r28, r12
  RET
  CALL func_1
func_1:
  DIV r1, r12, r2
  SHL r1, r11, r14
  SHR r5, r7, r11
  MUL r0, r5, r20
  SHL r14, r6, r9
  MOD r27, r4, r14
  RET
  CALL func_2
func_2:
  SHR r2, r10, r13
  DIV r12, r0, r10
  SUB r6, r8, r4
  MUL r12, r6, r0
  XOR r3, r7, r0
  SHR r3, r14, r11
  RET
  CALL func_3
func_3:
  AND r3, r17, r7
  SUB r5, r15, r9
  SHR r3, r7, r11
  RET
  HALT
