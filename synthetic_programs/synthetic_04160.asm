; mixed program
; initialization
  LDI r0, 1899
  LDI r9, 586
; palette
  LDI r12, 0x8060
  LDI r4, 1
  LDI r3, 0xAA00AA
  STORE r12, r3
  ADD r12, r12, r4
  LDI r3, 0x000000
  STORE r12, r3
  ADD r12, r12, r4
  LDI r3, 0xFFEE00
  STORE r12, r3
  ADD r12, r12, r4
  LDI r3, 0x0044FF
  STORE r12, r3
  ADD r12, r12, r4
  LDI r3, 0xDD0044
  STORE r12, r3
  ADD r12, r12, r4
  MUL r11, r14, r28
  IKEY r6
  CMPI r6, 64
  JNZ r6, key_0
  LDI r15, 2
  LDI r8, 128
  LDI r3, 0x27E77F
  TEXT r15, r8, r3, "HELLO"
main_1:
  CMPI r1, 0xBBF560
  CMPI r3, 0x1D5925
  AND r1, r14, r13
  XOR r0, r4, r11
  AND r29, r0, r10
  LDI r15, 3018
  LDI r3, 0xA639AA
  LDI r9, 4
  LDI r15, 255
  CIRCLE r15, r3, r9, r15
  CMPI r10, 10
  FRAME
  JMP main_1
