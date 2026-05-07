; drawing loop program
; initialization
  LDI r2, 16
  LDI r9, 4
  LDI r18, 186
  LDI r7, 256
  LDI r15, 16
  LDI r4, 0x09B216
  LDI r23, 64
; palette
  LDI r2, 0x70DF
  LDI r1, 1
  LDI r15, 0x880088
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0xFF4400
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0x000066
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0xFFAA00
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0xAA00AA
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0x550077
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0xFFFFFF
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0xFFFF00
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0x00FFAA
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0x444444
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0xFF00FF
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0xFFAA00
  STORE r2, r15
  ADD r2, r2, r1
  LDI r15, 0x888800
  STORE r2, r15
  ADD r2, r2, r1
main_0:
  AND r3, r15, r6
  AND r11, r9, r5
  AND r2, r14, r11
  AND r10, r9, r13
  XOR r3, r8, r1
  OR r14, r5, r8
  OR r14, r0, r5
  XOR r13, r11, r10
  LDI r15, 2
  LDI r10, 10
  LDI r5, 0x1716C3
  LDI r13, 128
  LDI r2, 0
  LINE r15, r10, r5, r13, r2
  LDI r14, 208
  LDI r2, 1
  LDI r13, 411
  DRAWTEXT r14, r2, r13, "WORLD"
  SUBI r6, r2, 256
  FRAME
  JMP main_0
