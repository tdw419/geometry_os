; drawing loop program
; initialization
  LDI r10, 1518
  LDI r4, 8
  LDI r14, 64
; palette
  LDI r13, 0x50ED
  LDI r9, 1
  LDI r5, 0x00FFAA
  STORE r13, r5
  ADD r13, r13, r9
  LDI r5, 0x0044FF
  STORE r13, r5
  ADD r13, r13, r9
  LDI r5, 0x8800FF
  STORE r13, r5
  ADD r13, r13, r9
  LDI r5, 0xFF0000
  STORE r13, r5
  ADD r13, r13, r9
  LDI r5, 0xAA00AA
  STORE r13, r5
  ADD r13, r13, r9
  LDI r5, 0x00FFFF
  STORE r13, r5
  ADD r13, r13, r9
  LDI r5, 0x0000FF
  STORE r13, r5
  ADD r13, r13, r9
  LDI r5, 0x880088
  STORE r13, r5
  ADD r13, r13, r9
  LDI r5, 0x000000
  STORE r13, r5
  ADD r13, r13, r9
  LDI r5, 0x0000CC
  STORE r13, r5
  ADD r13, r13, r9
main_0:
  AND r13, r3, r1
  XOR r11, r7, r1
  AND r11, r13, r1
  ANDI r0, r10, 0x64882B
  ADDI r21, r5, 105
  FRAME
  JMP main_0
