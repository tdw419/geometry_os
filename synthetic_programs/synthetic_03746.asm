; drawing loop program
; initialization
  LDI r7, 256
  LDI r11, 10
  LDI r15, 3568
  LDI r1, 0x2DC9EC
  LDI r3, 0x3B98FF
  LDI r5, 0x00B39B
; palette
  LDI r10, 0x2113
  LDI r6, 1
  LDI r14, 0xFFAA00
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0x0044FF
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0xFF00FF
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0x44FF00
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0xFFEE00
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0xDD0044
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0xAAFF00
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0xAA00AA
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0xFF00FF
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0xAA00AA
  STORE r10, r14
  ADD r10, r10, r6
  LDI r14, 0x0000FF
  STORE r10, r14
  ADD r10, r10, r6
main_0:
  XOR r14, r5, r23
  XOR r11, r12, r7
  XOR r14, r4, r10
  AND r10, r12, r31
  OR r2, r1, r6
  XOR r8, r3, r6
  FRAME
  JMP main_0
