; subroutine calls
; initialization
  LDI r7, 0x0A1FF4
  LDI r10, 1823
  CALL func_0
func_0:
  XOR r8, r10, r11
  SUB r9, r0, r5
  AND r5, r3, r7
  DIV r12, r2, r1
  SHL r6, r26, r4
  SHR r15, r6, r4
  RET
  CALL func_1
func_1:
  ADD r8, r14, r11
  SHR r12, r31, r9
  SUB r10, r8, r15
  SHL r7, r12, r3
  RET
  CALL func_2
func_2:
  OR r4, r0, r2
  SHR r5, r8, r1
  SHL r7, r12, r1
  DIV r15, r12, r13
  RET
  HALT
