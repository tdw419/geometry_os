; subroutine calls
; initialization
  LDI r4, 256
  LDI r10, 0xCD4106
  LDI r13, 426
  LDI r0, 3222
  LDI r7, 0xAB51DB
  CALL func_0
func_0:
  MOD r0, r4, r13
  SUB r26, r14, r8
  ADD r10, r1, r14
  RET
  CALL func_1
func_1:
  SHL r5, r2, r0
  DIV r8, r5, r12
  MUL r6, r5, r4
  AND r2, r11, r15
  SHR r15, r5, r9
  RET
  CALL func_2
func_2:
  XOR r11, r8, r12
  XOR r1, r3, r0
  DIV r5, r0, r8
  RET
  HALT
