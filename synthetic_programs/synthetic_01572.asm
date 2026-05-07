; drawing loop program
; initialization
  LDI r11, 64
  LDI r3, 0xA83FE1
  LDI r2, 8
  LDI r0, 0xBF6A10
  LDI r9, 255
; palette
  LDI r13, 0x2462
  LDI r3, 1
  LDI r9, 0x0044FF
  STORE r13, r9
  ADD r13, r13, r3
  LDI r9, 0x550077
  STORE r13, r9
  ADD r13, r13, r3
  LDI r9, 0xFF0000
  STORE r13, r9
  ADD r13, r13, r3
  LDI r9, 0xFFFF00
  STORE r13, r9
  ADD r13, r13, r3
main_0:
  LDI r5, 16
  LDI r4, 64
  LDI r2, 0
  LDI r15, 0x3F8541
  LDI r9, 0x464E11
  LINE r5, r4, r2, r15, r9
  LDI r3, 0x25C54B
  LDI r0, 0x5CACC0
  LDI r4, 3216
  PSET r3, r0, r4
  LDI r6, 2300
  LDI r8, 8
  LDI r13, 0x8FF672
  DRAWTEXT r6, r8, r13, "WORLD"
  ADD r6, r3, r8
  FRAME
  JMP main_0
