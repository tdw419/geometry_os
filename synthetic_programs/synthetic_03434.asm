; mixed program
; initialization
  LDI r7, 3254
  LDI r28, 256
  LDI r3, 3286
  LDI r14, 1
  LDI r5, 0x046286
  LDI r10, 256
  LDI r4, 0xD7362B
  LDI r1, 812
  LDI r12, 0xE42A79
  RECTF r5, r10, r4, r1, r12
  CALL func_0
func_0:
  MOD r14, r2, r3
  SHL r8, r13, r12
  SHL r3, r11, r1
  ADD r2, r5, r7
  OR r9, r28, r15
  ADD r11, r4, r8
  RET
  MOD r12, r13, r10
  OR r15, r11, r9
  AND r3, r6, r14
  OR r8, r14, r13
  HALT
