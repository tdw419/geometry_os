; subroutine calls
; initialization
  LDI r6, 0xFCE4F3
  LDI r8, 2
  LDI r12, 0x0AE3BB
  LDI r0, 16
  LDI r1, 32
  LDI r13, 10
  LDI r10, 8
  LDI r14, 994
  CALL func_0
func_0:
  SUB r1, r4, r10
  SHR r2, r11, r0
  ADD r1, r9, r10
  XOR r12, r5, r14
  SUB r4, r13, r3
  OR r15, r8, r2
  RET
  CALL func_1
func_1:
  OR r7, r6, r2
  AND r0, r14, r6
  AND r6, r10, r9
  AND r3, r7, r12
  RET
  CALL func_2
func_2:
  XOR r12, r8, r9
  XOR r4, r3, r7
  ADD r5, r15, r14
  SHL r2, r6, r13
  OR r14, r3, r12
  RET
  HALT
