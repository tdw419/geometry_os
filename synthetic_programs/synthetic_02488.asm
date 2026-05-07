; input driven program
; initialization
  LDI r12, 256
  LDI r21, 0x53E6F9
  LDI r6, 0xEAA206
main_0:
  CMPI r14, 0x56C419
  LDI r12, 64
  LDI r1, 1
  LDI r15, 3830
  TEXT r12, r1, r15, "HELLO"
  IKEY r9
  CMPI r9, 172
  JNZ r9, key_1
  LDI r8, 856
  LDI r13, 0x09A701
  LDI r8, 3851
  TEXT r8, r13, r8, "HELLO"
  FRAME
  JMP main_0
