; drawing loop program
; initialization
  LDI r10, 2538
  LDI r14, 64
  LDI r0, 0
  LDI r11, 0x75E8F1
  LDI r5, 256
; palette
  LDI r5, 0x308D
  LDI r3, 1
  LDI r1, 0x00FF00
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0x00FF00
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0xFFFFFF
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0x000066
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0x008888
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0xAA00AA
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0xAA00AA
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0x00FFFF
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0x444444
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0xFF0000
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0xFFAA00
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0xDD0044
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0xFFFFFF
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0x00FFFF
  STORE r5, r1
  ADD r5, r5, r3
  LDI r1, 0xFFFFFF
  STORE r5, r1
  ADD r5, r5, r3
main_0:
  LDI r14, 0xEE1374
  LDI r13, 0xCEA73B
  LDI r2, 2
  TEXT r14, r13, r2, "HELLO"
  SUBI r3, r1, 8
  ADDI r12, r0, 0x6BCB31
  OR r11, r2, r8
  AND r6, r0, r7
  FRAME
  JMP main_0
