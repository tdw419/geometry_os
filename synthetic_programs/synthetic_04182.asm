; mixed program
; initialization
  LDI r8, 2826
  LDI r6, 479
; palette
  LDI r4, 0x2093
  LDI r12, 1
  LDI r6, 0x00FFAA
  STORE r4, r6
  ADD r4, r4, r12
  LDI r6, 0x00FF00
  STORE r4, r6
  ADD r4, r4, r12
  LDI r6, 0xDD0044
  STORE r4, r6
  ADD r4, r4, r12
  LDI r6, 0x44FF00
  STORE r4, r6
  ADD r4, r4, r12
  LDI r6, 0xDD0044
  STORE r4, r6
  ADD r4, r4, r12
  LDI r6, 0x008888
  STORE r4, r6
  ADD r4, r4, r12
  LDI r6, 0x000000
  STORE r4, r6
  ADD r4, r4, r12
  LDI r6, 0xAA00AA
  STORE r4, r6
  ADD r4, r4, r12
  LDI r6, 0x44FF00
  STORE r4, r6
  ADD r4, r4, r12
  LDI r6, 0x00FFFF
  STORE r4, r6
  ADD r4, r4, r12
  XOR r23, r3, r8
  XOR r10, r14, r5
  XOR r3, r11, r0
  OR r11, r5, r2
  DIV r6, r1, r15
  IKEY r12
  CMPI r12, 40
  JNZ r12, key_0
main_1:
  IKEY r8
  CMPI r8, 0
  JNZ r8, key_2
  SUBI r14, r8, 102
  ANDI r14, r4, 8
  LDI r6, 0
  LDI r4, 0x72F245
  LDI r11, 1583
  TEXT r6, r4, r11, "HELLO"
  FRAME
  JMP main_1
