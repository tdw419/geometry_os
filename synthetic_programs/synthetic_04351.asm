; subroutine calls
; initialization
  LDI r14, 0xC81735
  LDI r0, 2
  CALL func_0
func_0:
  OR r4, r2, r8
  MUL r10, r8, r0
  DIV r4, r12, r15
  SHR r12, r7, r6
  RET
  HALT
