; subroutine calls
; initialization
  LDI r12, 4008
  LDI r4, 128
  LDI r11, 0xCCEB4B
  LDI r6, 3735
  LDI r8, 677
  LDI r23, 32
  CALL func_0
func_0:
  ADD r13, r14, r4
  OR r10, r15, r2
  MUL r13, r11, r6
  RET
  CALL func_1
func_1:
  DIV r4, r13, r3
  MUL r14, r1, r7
  RET
  CALL func_2
func_2:
  DIV r10, r0, r8
  OR r3, r5, r14
  MUL r0, r11, r10
  DIV r11, r4, r2
  RET
  HALT
