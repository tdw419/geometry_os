; subroutine calls
; initialization
  LDI r10, 256
  LDI r3, 2164
  LDI r2, 1284
  LDI r0, 2416
  LDI r13, 0x25390A
  LDI r14, 64
  LDI r8, 0x2F932D
  LDI r29, 16
  CALL func_0
func_0:
  XOR r6, r3, r2
  XOR r1, r8, r13
  SHL r9, r4, r6
  RET
  HALT
