; subroutine calls
; initialization
  LDI r10, 256
  LDI r13, 0x36BB72
  LDI r7, 0x1D763D
  LDI r4, 0x54FAFC
  LDI r8, 0x6BBBEF
  LDI r14, 2105
  LDI r2, 8
  LDI r15, 0x5441A7
  CALL func_0
func_0:
  SUB r22, r8, r9
  OR r12, r13, r3
  ADD r14, r12, r6
  XOR r6, r5, r1
  DIV r7, r8, r14
  RET
  CALL func_1
func_1:
  DIV r14, r13, r6
  SHL r1, r11, r0
  SHR r5, r18, r15
  MOD r10, r0, r8
  DIV r12, r30, r2
  MOD r11, r8, r7
  RET
  HALT
