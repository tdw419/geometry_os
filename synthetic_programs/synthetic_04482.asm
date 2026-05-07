; subroutine calls
; initialization
  LDI r14, 3672
  LDI r5, 64
  LDI r2, 2317
  LDI r15, 2520
  LDI r12, 0xA28D22
  LDI r6, 1
  CALL func_0
func_0:
  ADD r0, r1, r4
  XOR r14, r0, r6
  SHL r13, r1, r10
  DIV r4, r15, r13
  RET
  CALL func_1
func_1:
  AND r5, r12, r4
  MUL r11, r2, r15
  RET
  CALL func_2
func_2:
  SHR r8, r10, r6
  SHL r11, r1, r15
  ADD r18, r12, r6
  RET
  CALL func_3
func_3:
  ADD r7, r10, r6
  AND r13, r4, r1
  SHL r3, r2, r13
  DIV r3, r6, r15
  AND r7, r26, r5
  RET
  HALT
