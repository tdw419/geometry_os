; drawing loop program
; initialization
  LDI r7, 1923
  LDI r15, 2671
  LDI r13, 128
  LDI r3, 0x71EE2F
  LDI r8, 16
; palette
  LDI r10, 0x40DF
  LDI r1, 1
  LDI r0, 0xAA00AA
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xAAFF00
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xAA00AA
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xFFFFFF
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0x0000FF
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xFF0000
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0x0000FF
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xDD0044
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xFF00FF
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xAAAAAA
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0x00FFAA
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xFF00FF
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0x0000CC
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xFFEE00
  STORE r10, r0
  ADD r10, r10, r1
  LDI r0, 0xFFAA00
  STORE r10, r0
  ADD r10, r10, r1
main_0:
  SUBI r11, r13, 0x13D58F
  CMP r14, r6
  LDI r17, 0xB5C6BF
  LDI r7, 0xA7A47E
  LDI r13, 0x22DBAD
  PSETI
  XOR r11, r13, r9
  AND r11, r7, r4
  XOR r1, r3, r9
  XOR r19, r8, r2
  AND r7, r8, r0
  FRAME
  JMP main_0
