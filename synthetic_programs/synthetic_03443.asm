; drawing loop program
; initialization
  LDI r10, 0xCCA51C
  LDI r7, 0x5A8A92
  LDI r2, 2
  LDI r6, 1213
  LDI r1, 8
  LDI r11, 2470
  LDI r8, 0x11968C
  LDI r13, 2505
main_0:
  OR r12, r5, r10
  AND r2, r0, r14
  AND r6, r13, r8
  CMP r6, r4
  FRAME
  JMP main_0
