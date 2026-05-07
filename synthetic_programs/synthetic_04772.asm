; subroutine calls
; initialization
  LDI r10, 32
  LDI r19, 0xEE876A
  LDI r2, 0xF7F4F1
  CALL func_0
func_0:
  XOR r14, r0, r10
  OR r1, r2, r14
  DIV r0, r12, r10
  RET
  HALT
