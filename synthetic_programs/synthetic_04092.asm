; drawing loop program
; initialization
  LDI r14, 0x6D4871
  LDI r2, 0xB0C739
  LDI r0, 0xB33EF8
  LDI r15, 2
  LDI r9, 128
main_0:
  LDI r10, 1709
  LDI r17, 0xA355BA
  LDI r15, 0
  LDI r9, 4
  LDI r12, 64
  RECTF r10, r17, r15, r9, r12
  IKEY r3
  CMPI r3, 0xBB7CF2
  JNZ r3, key_1
  LDI r12, 0x2623EB
  LDI r8, 3099
  LDI r9, 2928
  LDI r9, 255
  LDI r12, 2501
  LINE r12, r8, r9, r9, r12
  ADDI r13, r12, 1
  FRAME
  JMP main_0
