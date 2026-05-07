; mixed program
; initialization
  LDI r2, 536
  LDI r1, 3432
  LDI r13, 32
  LDI r11, 1620
  LDI r15, 128
  DRAWTEXT r13, r11, r15, "WORLD"
  IKEY r9
  CMPI r9, 192
  JNZ r9, key_0
  LDI r1, 2939
  LDI r3, 2947
  LDI r23, 1618
  TEXT r1, r3, r23, "HELLO"
  LDI r9, 4
  LDI r9, 339
  LDI r6, 904
  LDI r12, 717
  CIRCLE r9, r9, r6, r12
  LDI r4, 44
  LDI r13, 1711
  LDI r9, 16
  TEXT r4, r13, r9, "HELLO"
  CMP r12, r13
  JZ r12, else_1
  DIV r7, r5, r15
  XOR r2, r11, r5
  JMP endif_2
else_1:
  LDI r15, 0xE8FCF5
  LDI r10, 0xF11BF7
  LDI r2, 0x6DD85B
  PSET r15, r10, r2
endif_2:
  HALT
