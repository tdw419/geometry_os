; subroutine calls
; initialization
  LDI r10, 64
  LDI r13, 0x03A212
  LDI r5, 1882
  LDI r11, 1
  LDI r8, 1278
  LDI r0, 0xAB59F8
  LDI r2, 16
  LDI r6, 32
  CALL func_0
func_0:
  DIV r15, r3, r13
  SHR r13, r2, r6
  RET
  HALT
