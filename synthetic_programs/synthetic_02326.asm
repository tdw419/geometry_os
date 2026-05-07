; subroutine calls
; initialization
  LDI r13, 0xEA3B1B
  LDI r12, 3701
  LDI r8, 460
  LDI r7, 390
  LDI r5, 0x1C04AC
  CALL func_0
func_0:
  OR r8, r1, r12
  SHL r7, r9, r13
  SUB r7, r13, r3
  SHR r15, r6, r12
  RET
  CALL func_1
func_1:
  ADD r12, r5, r29
  AND r5, r0, r14
  AND r2, r6, r16
  AND r9, r8, r1
  RET
  CALL func_2
func_2:
  AND r0, r14, r11
  XOR r9, r0, r6
  ADD r1, r5, r14
  RET
  CALL func_3
func_3:
  XOR r5, r11, r9
  SUB r9, r2, r15
  RET
  HALT
