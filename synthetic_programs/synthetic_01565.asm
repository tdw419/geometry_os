; subroutine calls
; initialization
  LDI r9, 3549
  LDI r7, 255
  LDI r15, 256
  CALL func_0
func_0:
  ADD r7, r2, r3
  SHL r4, r7, r11
  SHL r7, r15, r9
  SHL r4, r3, r2
  DIV r4, r3, r11
  OR r9, r0, r17
  RET
  HALT
