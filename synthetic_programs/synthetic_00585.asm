; subroutine calls
; initialization
  LDI r15, 3441
  LDI r1, 255
  LDI r4, 0
  LDI r10, 4
  CALL func_0
func_0:
  XOR r13, r15, r0
  MUL r8, r21, r5
  DIV r6, r14, r3
  MUL r13, r11, r6
  SHL r9, r15, r3
  MOD r7, r11, r13
  RET
  HALT
