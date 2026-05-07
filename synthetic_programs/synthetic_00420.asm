; drawing loop program
; initialization
  LDI r12, 2701
  LDI r7, 4
  LDI r0, 842
main_0:
  LDI r4, 0x677E90
  LDI r4, 0x72F190
  LDI r14, 0xA4D04F
  LDI r1, 0xD1BEE1
  LDI r31, 0x98F2E3
  LINE r4, r4, r14, r1, r31
  IKEY r4
  CMPI r4, 8
  JNZ r4, key_1
  AND r3, r4, r10
  OR r15, r7, r1
  CMP r9, r14
  FRAME
  JMP main_0
