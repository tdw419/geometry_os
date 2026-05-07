; input driven program
; initialization
  LDI r10, 255
  LDI r4, 469
  LDI r12, 4046
  LDI r8, 473
  LDI r15, 2
  LDI r7, 550
  LDI r5, 28
main_0:
  IKEY r5
  CMPI r5, 241
  JNZ r5, key_1
  SAR r4, r9, r0
  SHL r4, r9, r8
  FRAME
  JMP main_0
