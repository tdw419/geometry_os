; subroutine calls
; initialization
  LDI r15, 0x14803C
  LDI r2, 8
  LDI r4, 0xA1BB41
  LDI r10, 4
  LDI r0, 2
  LDI r12, 0x2A49CF
  LDI r11, 3074
  LDI r3, 32
  CALL func_0
func_0:
  DIV r1, r10, r7
  MOD r9, r3, r15
  RET
  HALT
