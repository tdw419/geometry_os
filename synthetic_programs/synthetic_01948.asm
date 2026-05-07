; subroutine calls
; initialization
  LDI r9, 0xD316BF
  LDI r14, 128
  CALL func_0
func_0:
  DIV r10, r0, r8
  SHL r13, r12, r11
  XOR r22, r2, r8
  AND r8, r6, r14
  XOR r12, r4, r18
  RET
  CALL func_1
func_1:
  SHR r8, r12, r13
  SHL r4, r3, r9
  SUB r3, r7, r0
  ADD r14, r4, r6
  RET
  CALL func_2
func_2:
  SHR r5, r13, r11
  ADD r1, r7, r3
  OR r13, r6, r11
  XOR r30, r5, r15
  SHR r7, r2, r9
  RET
  HALT
