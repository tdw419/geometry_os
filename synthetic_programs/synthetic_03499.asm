; subroutine calls
; initialization
  LDI r2, 32
  LDI r9, 64
  LDI r13, 1
  LDI r1, 0
  LDI r3, 3103
  CALL func_0
func_0:
  MUL r1, r7, r14
  SUB r9, r6, r11
  AND r2, r12, r6
  RET
  CALL func_1
func_1:
  OR r11, r8, r4
  SHL r3, r1, r8
  SHL r10, r2, r8
  MUL r1, r2, r8
  XOR r15, r10, r5
  RET
  HALT
