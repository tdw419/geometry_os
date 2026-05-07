; subroutine calls
; initialization
  LDI r2, 1990
  LDI r6, 4
  LDI r12, 32
  LDI r4, 1
  LDI r8, 0x0CD2DF
  CALL func_0
func_0:
  MUL r14, r12, r3
  SUB r3, r12, r5
  AND r4, r18, r1
  XOR r11, r2, r6
  RET
  CALL func_1
func_1:
  OR r1, r9, r6
  XOR r15, r4, r13
  SHL r19, r15, r2
  DIV r14, r10, r1
  RET
  HALT
