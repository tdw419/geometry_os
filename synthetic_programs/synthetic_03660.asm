; subroutine calls
; initialization
  LDI r2, 256
  LDI r8, 256
  LDI r10, 3339
  LDI r9, 32
  LDI r3, 575
  CALL func_0
func_0:
  OR r4, r13, r1
  XOR r3, r10, r1
  SUB r12, r13, r8
  RET
  HALT
