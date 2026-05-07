; subroutine calls
; initialization
  LDI r14, 0xD18F0F
  LDI r1, 4
  LDI r8, 128
  LDI r3, 0
  LDI r13, 32
  LDI r12, 0xCD09B7
  LDI r6, 32
  LDI r0, 0x445CCC
  CALL func_0
func_0:
  SHL r10, r8, r4
  XOR r23, r2, r4
  RET
  CALL func_1
func_1:
  DIV r10, r14, r11
  ADD r4, r9, r15
  OR r5, r1, r7
  RET
  HALT
