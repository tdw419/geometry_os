; subroutine calls
; initialization
  LDI r2, 255
  LDI r12, 128
  CALL func_0
func_0:
  DIV r8, r13, r2
  XOR r3, r25, r15
  SHL r3, r2, r0
  SHL r0, r5, r7
  SHL r4, r9, r13
  SHL r4, r8, r2
  RET
  CALL func_1
func_1:
  SUB r6, r3, r2
  MUL r7, r6, r30
  XOR r3, r6, r2
  RET
  HALT
