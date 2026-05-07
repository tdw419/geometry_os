; mixed program
; initialization
  LDI r8, 255
  LDI r13, 2637
  LDI r3, 128
  LDI r0, 520
  LDI r26, 4033
  LDI r5, 0xA123E1
  LDI r1, 2132
  CALL func_0
func_0:
  AND r2, r9, r5
  OR r3, r4, r11
  MOD r2, r12, r9
  RET
  OR r15, r9, r8
  XOR r3, r8, r7
  SHR r14, r9, r5
  SAR r1, r4, r5
  SAR r2, r9, r7
  CALL func_1
func_1:
  MOD r13, r0, r7
  MOD r4, r2, r5
  ADD r0, r11, r2
  RET
  HALT
