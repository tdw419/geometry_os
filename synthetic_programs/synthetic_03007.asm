; subroutine calls
; initialization
  LDI r5, 1
  LDI r13, 0
  CALL func_0
func_0:
  MUL r15, r1, r2
  OR r8, r14, r11
  SHR r1, r2, r8
  DIV r12, r9, r7
  RET
  HALT
