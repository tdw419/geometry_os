; subroutine calls
; initialization
  LDI r10, 32
  LDI r1, 670
  LDI r18, 0xA59F4E
  LDI r5, 128
  LDI r8, 0xEDA1A5
  LDI r3, 2537
  LDI r4, 2488
  LDI r9, 0x7CCBD1
  CALL func_0
func_0:
  SHL r22, r14, r13
  ADD r11, r1, r15
  DIV r7, r15, r1
  MUL r13, r0, r11
  DIV r9, r4, r14
  AND r12, r6, r10
  RET
  CALL func_1
func_1:
  SHR r6, r11, r12
  SHL r5, r2, r1
  XOR r15, r0, r7
  MUL r4, r7, r8
  RET
  HALT
