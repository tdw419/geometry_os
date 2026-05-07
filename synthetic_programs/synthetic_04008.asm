; subroutine calls
; initialization
  LDI r4, 0xEA7924
  LDI r11, 0x1BA42C
  LDI r2, 4
  LDI r10, 256
  LDI r5, 0x5C9388
  LDI r8, 0x192CBA
  LDI r14, 3298
  CALL func_0
func_0:
  MUL r3, r4, r0
  DIV r15, r3, r12
  ADD r14, r11, r3
  RET
  CALL func_1
func_1:
  SHR r0, r9, r15
  AND r0, r2, r5
  MOD r6, r13, r11
  DIV r7, r6, r2
  RET
  CALL func_2
func_2:
  MUL r0, r12, r8
  SHL r12, r7, r1
  SHL r11, r7, r9
  RET
  HALT
