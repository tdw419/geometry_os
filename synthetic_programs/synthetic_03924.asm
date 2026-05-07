; mixed program
; initialization
  LDI r14, 0xB18010
  LDI r5, 2763
  LDI r10, 255
  LDI r2, 8
  LDI r4, 0xCA31DF
; palette
  LDI r3, 0x2116
  LDI r11, 1
  LDI r15, 0x8800FF
  STORE r3, r15
  ADD r3, r3, r11
  LDI r15, 0xAAFF00
  STORE r3, r15
  ADD r3, r3, r11
  LDI r15, 0xFFAA00
  STORE r3, r15
  ADD r3, r3, r11
  LDI r15, 0x0000CC
  STORE r3, r15
  ADD r3, r3, r11
  LDI r15, 0xFFEE00
  STORE r3, r15
  ADD r3, r3, r11
  LDI r15, 0x880088
  STORE r3, r15
  ADD r3, r3, r11
  LDI r15, 0xFFFFFF
  STORE r3, r15
  ADD r3, r3, r11
  LDI r4, 0
  LDI r7, 0xB3978E
  LDI r4, 2
  TEXT r4, r7, r4, "HELLO"
  LDI r9, 0x593CAD
  STORE r9, r3
  LOAD r8, r9
  LDI r6, 3836
  STORE r6, r10
  LOAD r7, r6
  LDI r1, 0xE2925D
  LDI r7, 1009
  LDI r1, 0x1E42EA
  TEXT r1, r7, r1, "HELLO"
  AND r5, r8, r6
  IKEY r2
  CMPI r2, 0x1A2304
  JNZ r2, key_0
  LDI r7, 0x13E502
loop_1:
  SHL r10, r11, r0
  LDI r5, 0x7B06C3
  LDI r15, 2513
  LDI r8, 8
  LDI r5, 255
  CIRCLE r5, r15, r8, r5
  LDI r8, 4
  LDI r14, 0x781319
  LDI r0, 990
  PSET r8, r14, r0
  LDI r9, 1
  SUB r7, r7, r9
  JNZ r7, loop_1
  LDI r11, 649
  LDI r9, 3677
  LDI r8, 3257
  TEXT r11, r9, r8, "HELLO"
  HALT
