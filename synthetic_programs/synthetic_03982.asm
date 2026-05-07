; subroutine calls
; initialization
  LDI r9, 16
  LDI r6, 623
  LDI r7, 255
  LDI r4, 3795
  LDI r0, 32
  LDI r5, 2520
  LDI r15, 0xACCB61
  LDI r10, 2567
  CALL func_0
func_0:
  DIV r27, r2, r15
  MUL r11, r13, r10
  MOD r7, r11, r0
  SHR r7, r6, r1
  MUL r10, r7, r6
  SHR r14, r0, r5
  RET
  HALT
