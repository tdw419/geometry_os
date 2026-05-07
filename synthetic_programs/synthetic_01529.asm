; drawing loop program
; initialization
  LDI r12, 4
  LDI r9, 0x41DF2A
  LDI r2, 2979
  LDI r4, 0xD656BB
main_0:
  LDI r1, 1209
  LDI r8, 256
  LDI r13, 19
  PSETI
  SUBI r12, r0, 8
  IKEY r14
  CMPI r14, 10
  JNZ r14, key_1
  CMPI r15, r2, 256
  FRAME
  JMP main_0
