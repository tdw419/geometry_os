; subroutine calls
; initialization
  LDI r13, 0x1EE309
  LDI r2, 0x2526F1
  LDI r0, 255
  LDI r15, 0
  CALL func_0
func_0:
  MOD r15, r7, r11
  DIV r5, r9, r12
  ADD r9, r3, r2
  AND r6, r2, r1
  RET
  HALT
