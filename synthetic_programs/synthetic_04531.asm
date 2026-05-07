; subroutine calls
; initialization
  LDI r12, 4
  LDI r4, 1095
  LDI r0, 256
  CALL func_0
func_0:
  OR r14, r17, r13
  DIV r11, r15, r9
  MOD r15, r5, r4
  ADD r12, r0, r3
  RET
  HALT
