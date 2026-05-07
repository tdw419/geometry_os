; drawing loop program
; initialization
  LDI r5, 0x7C415B
  LDI r2, 0xBA2EFA
  LDI r11, 2029
main_0:
  IKEY r12
  CMPI r12, 16
  JNZ r12, key_1
  SAR r10, r5, r12
  SHR r6, r13, r1
  IKEY r15
  CMPI r15, 217
  JNZ r15, key_2
  LDI r10, 256
  LDI r7, 0x5DC7D2
  LDI r6, 64
  PSET r10, r7, r6
  FRAME
  JMP main_0
