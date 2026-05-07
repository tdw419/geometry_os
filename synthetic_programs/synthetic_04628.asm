; input driven program
; initialization
  LDI r13, 1
  LDI r3, 0x0529B2
  LDI r0, 4068
  LDI r12, 3316
  LDI r7, 0x3131AE
  LDI r9, 2644
  LDI r2, 2526
  LDI r11, 2666
main_0:
  IKEY r5
  CMPI r5, 4
  JNZ r5, key_1
  CMP r9, r14
  FRAME
  JMP main_0
