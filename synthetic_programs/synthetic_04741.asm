; subroutine calls
; initialization
  LDI r4, 312
  LDI r8, 0xE42A14
  LDI r11, 157
  LDI r6, 32
  LDI r14, 32
  LDI r0, 4
  LDI r27, 1797
  CALL func_0
func_0:
  MOD r13, r7, r3
  AND r6, r8, r12
  MOD r0, r5, r7
  MUL r4, r1, r8
  SHR r0, r4, r5
  MOD r18, r13, r2
  RET
  CALL func_1
func_1:
  MUL r14, r11, r10
  MOD r3, r12, r6
  SHL r6, r4, r24
  DIV r1, r11, r6
  SHR r5, r3, r10
  RET
  CALL func_2
func_2:
  SHR r12, r3, r4
  SHL r14, r9, r4
  SHL r14, r10, r15
  MOD r10, r3, r13
  MOD r1, r4, r5
  MOD r2, r7, r28
  RET
  HALT
