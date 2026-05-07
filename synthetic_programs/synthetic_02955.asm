; input driven program
; initialization
  LDI r2, 0xBEF1B9
  LDI r8, 0x287D0E
  LDI r12, 0
  LDI r6, 219
  LDI r3, 0
  LDI r11, 0xF2675B
  LDI r5, 2131
  LDI r29, 1652
main_0:
  CMP r8, r10
  LDI r2, 0xBB3BEF
  LDI r9, 1798
  LDI r7, 2917
  LDI r6, 0xCDFFB0
  CIRCLE r2, r9, r7, r6
  LDI r6, 32
  LDI r7, 1192
  LDI r3, 11
  TEXT r6, r7, r3, "HELLO"
  AND r3, r2, r6
  AND r11, r13, r12
  SHL r4, r13, r15
  MOD r1, r10, r8
  FRAME
  JMP main_0
