; drawing loop program
; initialization
  LDI r11, 4072
  LDI r2, 10
  LDI r13, 0xDCA365
main_0:
  IKEY r9
  CMPI r9, 1
  JNZ r9, key_1
  SHR r12, r7, r4
  SAR r14, r3, r10
  SHR r0, r13, r1
  SAR r9, r3, r12
  CMP r2, r3
  CMPI r4, 0x61E717
  CMPI r14, r9, 0xC3C087
  FRAME
  JMP main_0
