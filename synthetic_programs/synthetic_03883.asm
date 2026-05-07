; drawing loop program
; initialization
  LDI r2, 2140
  LDI r15, 8
  LDI r8, 577
; palette
  LDI r9, 0x40DA
  LDI r7, 1
  LDI r4, 0x8800FF
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0x00AAFF
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0xFF4400
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0x00FFFF
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0x00FFFF
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0x000066
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0xDD0044
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0xFF0000
  STORE r9, r4
  ADD r9, r9, r7
main_0:
  AND r6, r10, r13
  AND r14, r6, r3
  XOR r15, r6, r1
  LDI r5, 0x42EDD5
  LDI r4, 0xF44856
  LDI r7, 0xDD5E21
  DRAWTEXT r5, r4, r7, "WORLD"
  SUBI r2, r28, 0x0A060A
  XOR r3, r10, r8
  OR r8, r29, r3
  FRAME
  JMP main_0
