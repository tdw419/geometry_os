; mixed program
; initialization
  LDI r12, 1091
  LDI r1, 2855
  LDI r5, 256
  LDI r10, 0xCBA0CA
  LDI r3, 0x2533A8
  LDI r4, 549
  LDI r8, 256
  LDI r9, 64
  LDI r10, 359
  LDI r1, 3891
  LDI r9, 2494
  DRAWTEXT r10, r1, r9, "WORLD"
  SHR r12, r1, r11
  CALL func_0
func_0:
  ADD r4, r0, r15
  AND r1, r2, r0
  MUL r23, r12, r14
  AND r4, r9, r14
  RET
  CALL func_1
func_1:
  DIV r7, r4, r8
  ADD r2, r15, r4
  RET
  LDI r3, 0xA6F06B
  LDI r8, 2871
  LDI r9, 149
  LDI r2, 28
  LDI r7, 128
  RECTF r3, r8, r9, r2, r7
  HALT
