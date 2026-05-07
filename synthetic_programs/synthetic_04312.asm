; mixed program
; initialization
  LDI r3, 0xD93E7B
  LDI r12, 0x6912C7
  LDI r1, 8
; palette
  LDI r4, 0x40CE
  LDI r6, 1
  LDI r3, 0x00FFAA
  STORE r4, r3
  ADD r4, r4, r6
  LDI r3, 0xFF4400
  STORE r4, r3
  ADD r4, r4, r6
  LDI r3, 0xAAFF00
  STORE r4, r3
  ADD r4, r4, r6
  LDI r3, 0xAAFF00
  STORE r4, r3
  ADD r4, r4, r6
  LDI r3, 0xFFAA00
  STORE r4, r3
  ADD r4, r4, r6
  SHL r4, r6, r10
  LDI r5, 0xFF8E2B
  LDI r9, 3737
  LDI r13, 0
  LDI r14, 2
  LDI r24, 256
  RECTF r5, r9, r13, r14, r24
  IKEY r3
  CMPI r3, 0x20AB31
  JNZ r3, key_0
  LDI r6, 1470
  FILL r6
  LDI r3, 347
  LDI r15, 3316
  LDI r15, 0
  LDI r0, 3831
  LDI r1, 2457
  RECTF r3, r15, r15, r0, r1
  AND r0, r1, r7
  AND r5, r10, r12
  XOR r10, r4, r17
  SHLI r6, r13, 1
  SAR r3, r4, r2
  SHL r3, r11, r14
  SHLI r10, r3, 0xB72271
  HALT
