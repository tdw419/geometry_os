; input driven program
; initialization
  LDI r7, 576
  LDI r3, 2
  LDI r6, 0xAB296D
  LDI r4, 2136
  LDI r15, 0x8126D3
  LDI r13, 256
  LDI r10, 0x9C3A2E
main_0:
  LDI r9, 94
  LDI r11, 8
  LDI r0, 0x4C658F
  TEXT r9, r11, r0, "HELLO"
  IKEY r3
  CMPI r3, 145
  JNZ r3, key_1
  IKEY r1
  CMPI r1, 256
  JNZ r1, key_2
  LDI r5, 2427
  LDI r12, 32
  LDI r10, 0xEE4A58
  TEXT r5, r12, r10, "HELLO"
  MUL r0, r2, r10
  FRAME
  JMP main_0
