; drawing loop program
; initialization
  LDI r4, 2
  LDI r2, 0
  LDI r8, 1589
  LDI r7, 128
  LDI r1, 1
; palette
  LDI r10, 0x301C
  LDI r30, 1
  LDI r9, 0xFF4400
  STORE r10, r9
  ADD r10, r10, r30
  LDI r9, 0x00FF44
  STORE r10, r9
  ADD r10, r10, r30
  LDI r9, 0x0000FF
  STORE r10, r9
  ADD r10, r10, r30
  LDI r9, 0x000000
  STORE r10, r9
  ADD r10, r10, r30
  LDI r9, 0x00FFFF
  STORE r10, r9
  ADD r10, r10, r30
  LDI r9, 0xAA00AA
  STORE r10, r9
  ADD r10, r10, r30
  LDI r9, 0xFF0000
  STORE r10, r9
  ADD r10, r10, r30
  LDI r9, 0x0044FF
  STORE r10, r9
  ADD r10, r10, r30
  LDI r9, 0xFFEE00
  STORE r10, r9
  ADD r10, r10, r30
main_0:
  MUL r9, r11, r0
  XOR r10, r7, r9
  AND r13, r5, r12
  CMP r8, r5
  FRAME
  JMP main_0
