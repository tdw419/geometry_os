; subroutine calls
; initialization
  LDI r4, 255
  LDI r9, 0x2B7CCC
  LDI r3, 16
  CALL func_0
func_0:
  XOR r15, r3, r6
  SHL r7, r6, r4
  RET
  CALL func_1
func_1:
  AND r3, r4, r11
  OR r14, r8, r12
  OR r15, r6, r2
  MOD r12, r6, r1
  DIV r11, r4, r3
  RET
  HALT
