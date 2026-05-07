; drawing loop program
; initialization
  LDI r15, 32
  LDI r3, 256
  LDI r14, 3872
  LDI r13, 0x376F01
  LDI r7, 0x35FF2A
main_0:
  IKEY r9
  CMPI r9, 47
  JNZ r9, key_1
  LDI r3, 0x722D20
  LDI r25, 10
  LDI r10, 2831
  PSET r3, r25, r10
  SUBI r2, r13, 46
  FRAME
  JMP main_0
