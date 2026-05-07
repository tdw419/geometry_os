; input driven program
; initialization
  LDI r4, 0xA2BF1D
  LDI r11, 0x6206D9
  LDI r13, 0xFBFAC9
  LDI r10, 1532
  LDI r3, 0xF96AAD
main_0:
  IKEY r6
  CMPI r6, 2
  JNZ r6, key_1
  CMPI r9, 212
  IKEY r4
  CMPI r4, 0xEE35A7
  JNZ r4, key_2
  LDI r14, 0x93E808
  LDI r27, 0x037F75
  LDI r6, 64
  LDI r5, 0x80270A
  LDI r2, 0x168883
  LINE r14, r27, r6, r5, r2
  SHLI r14, r0, 128
  SAR r3, r15, r14
  SHLI r3, r0, 0x9532AF
  SHR r13, r8, r30
  FRAME
  JMP main_0
