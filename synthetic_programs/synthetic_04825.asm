; input driven program
; initialization
  LDI r2, 0x972B86
  LDI r3, 64
  LDI r1, 0x44171B
  LDI r18, 0xAA04CD
  LDI r14, 528
  LDI r12, 2
  LDI r4, 460
main_0:
  AND r4, r5, r7
  AND r5, r6, r1
  CMP r3, r6
  CMPI r6, 0x7B10EE
  LDI r9, 0x37DBDB
  LDI r4, 4000
  LDI r8, 4
  TEXT r9, r4, r8, "HELLO"
  IKEY r8
  CMPI r8, 0x816D5B
  JNZ r8, key_1
  FRAME
  JMP main_0
