; drawing loop program
; initialization
  LDI r13, 0x893A9C
  LDI r4, 0x125289
  LDI r14, 64
  LDI r8, 128
  LDI r12, 0x6AF7D4
main_0:
  IKEY r5
  CMPI r5, 126
  JNZ r5, key_1
  CMP r3, r15
  DIV r5, r10, r8
  XOR r18, r9, r13
  AND r2, r9, r22
  CMPI r12, 0xE917A9
  FRAME
  JMP main_0
