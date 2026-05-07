; drawing loop program
; initialization
  LDI r4, 256
  LDI r6, 2
  LDI r11, 4
  LDI r3, 1
  LDI r10, 1774
  LDI r15, 0x144D3F
  LDI r12, 3830
main_0:
  IKEY r12
  CMPI r12, 0xDA1D71
  JNZ r12, key_1
  SHR r14, r6, r10
  SHLI r15, r12, 128
  IKEY r3
  CMPI r3, 247
  JNZ r3, key_2
  IKEY r2
  CMPI r2, 0x40F9C1
  JNZ r2, key_3
  LDI r8, 256
  LDI r6, 974
  LDI r15, 2847
  PSET r8, r6, r15
  SUBI r7, r3, 0xEFDFC5
  FRAME
  JMP main_0
