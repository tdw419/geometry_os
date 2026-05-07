; input driven program
; initialization
  LDI r7, 3787
  LDI r0, 128
  LDI r9, 2608
  LDI r3, 2364
  LDI r2, 32
  LDI r5, 2695
  LDI r6, 1
main_0:
  IKEY r8
  CMPI r8, 0x2CB5AD
  JNZ r8, key_1
  ADD r5, r1, r3
  FRAME
  JMP main_0
