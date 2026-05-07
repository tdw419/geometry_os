; subroutine calls
; initialization
  LDI r7, 483
  LDI r1, 64
  LDI r13, 64
  CALL func_0
func_0:
  AND r8, r19, r16
  XOR r9, r15, r2
  SUB r0, r11, r8
  MOD r3, r0, r5
  RET
  HALT
