; drawing loop program
; initialization
  LDI r16, 255
  LDI r7, 1
  LDI r6, 4
main_0:
  SUBI r10, r8, 146
  IKEY r14
  CMPI r14, 0x174421
  JNZ r14, key_1
  IKEY r4
  CMPI r4, 255
  JNZ r4, key_2
  LDI r9, 64
  LDI r4, 2
  LDI r13, 64
  PSETI
  AND r14, r26, r4
  CMPI r15, 256
  FRAME
  JMP main_0
