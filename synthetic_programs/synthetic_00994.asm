; subroutine calls
; initialization
  LDI r14, 0x9849FC
  LDI r12, 10
  LDI r10, 0xF9249A
  LDI r4, 1929
  LDI r11, 2514
  LDI r13, 16
  CALL func_0
func_0:
  DIV r5, r4, r8
  MOD r5, r3, r11
  OR r8, r2, r13
  AND r11, r5, r8
  AND r8, r10, r3
  RET
  HALT
