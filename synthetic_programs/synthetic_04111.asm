; drawing loop program
; initialization
  LDI r29, 64
  LDI r1, 0x06AC62
  LDI r8, 1581
  LDI r16, 0xBB6FB9
  LDI r5, 16
main_0:
  LDI r8, 0x7C6111
  LDI r2, 2603
  LDI r13, 0x6C6B75
  DRAWTEXT r8, r2, r13, "WORLD"
  OR r5, r0, r7
  XOR r4, r0, r15
  AND r5, r3, r11
  AND r13, r2, r5
  XOR r11, r6, r0
  XOR r3, r5, r7
  SHR r10, r5, r2
  SAR r0, r3, r15
  LDI r1, 0x9610FF
  LDI r15, 279
  LDI r25, 4071
  LDI r4, 2924
  LDI r12, 1935
  LINE r1, r15, r25, r4, r12
  FRAME
  JMP main_0
