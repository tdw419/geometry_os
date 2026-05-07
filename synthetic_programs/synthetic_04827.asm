; drawing loop program
; initialization
  LDI r0, 8
  LDI r11, 1697
  LDI r5, 2893
  LDI r4, 2
  LDI r8, 0
  LDI r7, 0x44B90E
  LDI r6, 0xD9EFBE
; palette
  LDI r5, 0x201D
  LDI r12, 1
  LDI r3, 0xFF0000
  STORE r5, r3
  ADD r5, r5, r12
  LDI r3, 0xAA00AA
  STORE r5, r3
  ADD r5, r5, r12
  LDI r3, 0x0000CC
  STORE r5, r3
  ADD r5, r5, r12
  LDI r3, 0xAAAAAA
  STORE r5, r3
  ADD r5, r5, r12
  LDI r3, 0x0044FF
  STORE r5, r3
  ADD r5, r5, r12
  LDI r3, 0xAA00AA
  STORE r5, r3
  ADD r5, r5, r12
  LDI r3, 0x008888
  STORE r5, r3
  ADD r5, r5, r12
  LDI r3, 0xAAFF00
  STORE r5, r3
  ADD r5, r5, r12
main_0:
  IKEY r14
  CMPI r14, 14
  JNZ r14, key_1
  CMPI r30, 255
  ADDI r14, r0, 1
  LDI r1, 2784
  LDI r2, 1714
  LDI r15, 8
  DRAWTEXT r1, r2, r15, "WORLD"
  LDI r2, 128
  LDI r0, 2004
  LDI r0, 1350
  TEXT r2, r0, r0, "HELLO"
  CMPI r7, 0xF00576
  FRAME
  JMP main_0
