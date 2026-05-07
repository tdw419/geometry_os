; drawing loop program
; initialization
  LDI r18, 676
  LDI r4, 0xCC4568
  LDI r9, 1640
  LDI r7, 131
  LDI r2, 851
  LDI r15, 0xF6A319
  LDI r6, 0x79A243
; palette
  LDI r10, 0x2460
  LDI r2, 1
  LDI r3, 0xDD0044
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x000066
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0xFF00FF
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x00FF00
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x00AAFF
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x000000
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0xFF00FF
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x0000CC
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0xFF00FF
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x0000CC
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x0000CC
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0xFF0000
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x444444
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x000000
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0x000066
  STORE r10, r3
  ADD r10, r10, r2
  LDI r3, 0xAA00AA
  STORE r10, r3
  ADD r10, r10, r2
main_0:
  SHL r3, r4, r2
  LDI r1, 16
  LDI r15, 0x16DBD8
  LDI r12, 1301
  LDI r12, 704
  LDI r10, 1580
  RECTF r1, r15, r12, r12, r10
  OR r7, r6, r4
  LDI r9, 0xC71BF8
  LDI r10, 0x54F2AF
  LDI r3, 2152
  TEXT r9, r10, r3, "HELLO"
  SAR r13, r10, r29
  SHR r11, r8, r9
  XOR r13, r9, r3
  XOR r1, r2, r5
  OR r0, r14, r11
  FRAME
  JMP main_0
