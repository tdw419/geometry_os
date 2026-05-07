; input driven program
; initialization
  LDI r1, 10
  LDI r15, 10
  LDI r5, 8
  LDI r10, 0xEFECEA
main_0:
  CMP r20, r13
  IKEY r0
  CMPI r0, 244
  JNZ r0, key_1
  LDI r3, 3996
  LDI r6, 0x7319ED
  LDI r6, 1962
  PSET r3, r6, r6
  AND r6, r2, r4
  AND r28, r11, r0
  XOR r5, r1, r2
  IKEY r5
  CMPI r5, 43
  JNZ r5, key_2
  FRAME
  JMP main_0
