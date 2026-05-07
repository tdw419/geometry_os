; subroutine calls
; initialization
  LDI r7, 0x798D4B
  LDI r3, 0x311B5D
  LDI r4, 2796
  LDI r5, 638
  LDI r12, 128
  LDI r15, 2801
  CALL func_0
func_0:
  DIV r11, r5, r10
  SUB r9, r1, r8
  MUL r1, r7, r15
  MUL r10, r7, r11
  XOR r14, r10, r6
  AND r3, r5, r1
  RET
  CALL func_1
func_1:
  ADD r13, r9, r6
  XOR r13, r3, r7
  RET
  HALT
