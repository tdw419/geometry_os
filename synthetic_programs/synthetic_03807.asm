; drawing loop program
; initialization
  LDI r12, 1607
  LDI r5, 2053
  LDI r15, 10
  LDI r0, 2548
; palette
  LDI r17, 0x3073
  LDI r11, 1
  LDI r13, 0x00AAFF
  STORE r17, r13
  ADD r17, r17, r11
  LDI r13, 0x00FF00
  STORE r17, r13
  ADD r17, r17, r11
  LDI r13, 0x888800
  STORE r17, r13
  ADD r17, r17, r11
  LDI r13, 0x550077
  STORE r17, r13
  ADD r17, r17, r11
  LDI r13, 0x008888
  STORE r17, r13
  ADD r17, r17, r11
main_0:
  SHL r7, r5, r25
  SUBI r13, r10, 0x52DECA
  AND r9, r1, r11
  XOR r11, r12, r10
  LDI r9, 1227
  LDI r9, 4002
  LDI r5, 0
  DRAWTEXT r9, r9, r5, "WORLD"
  LDI r10, 0x0ECAC2
  LDI r15, 256
  LDI r8, 0x34D4A2
  TEXT r10, r15, r8, "HELLO"
  FRAME
  JMP main_0
