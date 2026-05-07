; subroutine calls
; initialization
  LDI r15, 3280
  LDI r1, 2145
  LDI r6, 0x732D03
  LDI r4, 0x3105A4
  LDI r13, 0x2AED4D
  LDI r20, 2667
  CALL func_0
func_0:
  SHR r10, r8, r9
  OR r12, r6, r11
  AND r13, r21, r0
  ADD r10, r11, r7
  AND r4, r6, r3
  XOR r13, r11, r3
  RET
  CALL func_1
func_1:
  ADD r0, r10, r3
  XOR r15, r2, r8
  SHR r12, r15, r8
  DIV r12, r4, r10
  SUB r20, r2, r10
  SHR r5, r15, r14
  RET
  HALT
