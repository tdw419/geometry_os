; subroutine calls
; initialization
  LDI r8, 379
  LDI r6, 0xF919BB
  LDI r14, 1768
  CALL func_0
func_0:
  ADD r11, r12, r6
  SUB r8, r10, r1
  XOR r7, r5, r10
  MUL r13, r10, r15
  RET
  CALL func_1
func_1:
  DIV r1, r4, r5
  SHL r11, r8, r12
  SUB r12, r0, r19
  SHL r3, r12, r8
  RET
  CALL func_2
func_2:
  MUL r15, r1, r8
  SUB r13, r0, r14
  RET
  HALT
