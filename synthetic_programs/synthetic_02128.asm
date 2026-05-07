; subroutine calls
; initialization
  LDI r2, 800
  LDI r9, 0xC6C38A
  LDI r13, 10
  CALL func_0
func_0:
  OR r1, r7, r3
  XOR r10, r11, r3
  OR r10, r4, r1
  DIV r13, r24, r15
  SHR r8, r15, r11
  SHR r3, r4, r7
  RET
  HALT
