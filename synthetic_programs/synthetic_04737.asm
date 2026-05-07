; drawing loop program
; initialization
  LDI r10, 2001
  LDI r11, 0
  LDI r13, 2564
  LDI r5, 0x9DFFC1
  LDI r2, 3029
  LDI r12, 3412
  LDI r1, 3562
  LDI r15, 1533
; palette
  LDI r0, 0x50BC
  LDI r9, 1
  LDI r13, 0x00AAFF
  STORE r0, r13
  ADD r0, r0, r9
  LDI r13, 0x00FFAA
  STORE r0, r13
  ADD r0, r0, r9
  LDI r13, 0xAAAAAA
  STORE r0, r13
  ADD r0, r0, r9
  LDI r13, 0x000066
  STORE r0, r13
  ADD r0, r0, r9
  LDI r13, 0x0000FF
  STORE r0, r13
  ADD r0, r0, r9
  LDI r13, 0xFFFF00
  STORE r0, r13
  ADD r0, r0, r9
  LDI r13, 0x444444
  STORE r0, r13
  ADD r0, r0, r9
  LDI r13, 0xDD0044
  STORE r0, r13
  ADD r0, r0, r9
  LDI r13, 0x0000CC
  STORE r0, r13
  ADD r0, r0, r9
  LDI r13, 0x00FFAA
  STORE r0, r13
  ADD r0, r0, r9
main_0:
  ANDI r0, r1, 89
  XOR r7, r3, r13
  AND r11, r13, r9
  OR r12, r15, r13
  FRAME
  JMP main_0
