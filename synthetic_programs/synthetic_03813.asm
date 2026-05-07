; mixed program
; initialization
  LDI r11, 3076
  LDI r3, 4
  LDI r14, 64
  LDI r13, 0x760989
  LDI r7, 3051
  LDI r1, 0x99C467
  LDI r5, 128
  LDI r14, 32
  LDI r9, 3883
  LDI r8, 34
  LDI r12, 4
  LDI r11, 973
  RECTF r14, r9, r8, r12, r11
  LDI r4, 0xAE81AD
  LDI r15, 0x1CC2A0
  LDI r13, 0xD78894
  DRAWTEXT r4, r15, r13, "WORLD"
  CMP r2, r1
  LDI r2, 703
  LDI r9, 982
  LDI r7, 435
  DRAWTEXT r2, r9, r7, "WORLD"
  CALL func_0
func_0:
  AND r10, r14, r4
  MOD r11, r1, r12
  RET
  CMPI r7, 255
  HALT
