; drawing loop program
; initialization
  LDI r8, 0x3C0D1D
  LDI r2, 0x2F73E9
  LDI r17, 3420
  LDI r10, 3308
  LDI r15, 0xB4CDD4
; palette
  LDI r13, 0x604B
  LDI r1, 1
  LDI r7, 0xAA00AA
  STORE r13, r7
  ADD r13, r13, r1
  LDI r7, 0xAA00AA
  STORE r13, r7
  ADD r13, r13, r1
  LDI r7, 0x444444
  STORE r13, r7
  ADD r13, r13, r1
  LDI r7, 0x00AAFF
  STORE r13, r7
  ADD r13, r13, r1
main_0:
  SAR r0, r10, r15
  SAR r12, r5, r11
  SHR r15, r5, r13
  SHL r4, r3, r9
  SAR r16, r5, r3
  SHR r5, r0, r9
  SAR r7, r8, r30
  SAR r6, r12, r14
  SHL r11, r7, r9
  SHL r7, r13, r12
  SHR r13, r1, r6
  IKEY r12
  CMPI r12, 0xAE635F
  JNZ r12, key_1
  LDI r14, 0
  LDI r15, 0xD0D577
  LDI r9, 2873
  LDI r11, 0x482E1C
  LDI r13, 0xA08C55
  RECTF r14, r15, r9, r11, r13
  FRAME
  JMP main_0
