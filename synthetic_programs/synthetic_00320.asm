; subroutine calls
; initialization
  LDI r6, 10
  LDI r9, 64
  LDI r10, 687
  LDI r5, 2981
  LDI r13, 0x071C90
  LDI r15, 3341
  LDI r4, 0xDB264D
  LDI r11, 0x208951
  CALL func_0
func_0:
  DIV r8, r13, r5
  SHR r1, r5, r3
  RET
  CALL func_1
func_1:
  DIV r6, r8, r10
  SHR r13, r0, r2
  DIV r9, r30, r2
  DIV r8, r14, r2
  RET
  HALT
