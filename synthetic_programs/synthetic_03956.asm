; subroutine calls
; initialization
  LDI r1, 768
  LDI r12, 4008
  CALL func_0
func_0:
  ADD r3, r5, r12
  ADD r12, r27, r9
  DIV r7, r0, r13
  RET
  CALL func_1
func_1:
  SHL r13, r0, r9
  SHL r13, r6, r8
  XOR r11, r3, r2
  MUL r9, r7, r14
  RET
  HALT
