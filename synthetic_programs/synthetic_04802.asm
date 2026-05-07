; mixed program
; initialization
  LDI r1, 10
  LDI r23, 0x8473E5
  CMPI r3, 0xBD4656
  CMP r6, r11
  JZ r6, else_0
  DIV r2, r9, r6
  JMP endif_1
else_0:
  LDI r4, 64
  LDI r1, 1102
  LDI r14, 0xCA64DB
  LDI r7, 1647
  CIRCLE r4, r1, r14, r7
endif_1:
  XOR r2, r11, r15
  IKEY r6
  CMPI r6, 64
  JNZ r6, key_2
  LDI r14, 0x36F604
  LDI r6, 0x90E0D4
  LDI r8, 256
  TEXT r14, r6, r8, "HELLO"
  CMPI r2, 256
  HALT
