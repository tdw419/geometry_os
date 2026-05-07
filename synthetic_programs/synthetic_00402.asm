; input driven program
; initialization
  LDI r13, 0xCDBCEC
  LDI r6, 10
  LDI r7, 0x2D8403
  LDI r11, 1348
  LDI r5, 3226
  LDI r10, 0xFFFF84
  LDI r2, 0x0AE3E6
  LDI r0, 0x55EA77
main_0:
  CMPI r14, r12, 128
  SHR r20, r31, r11
  LDI r9, 0
  LDI r4, 0x3B9CD2
  LDI r6, 128
  LDI r21, 128
  LDI r12, 3079
  RECTF r9, r4, r6, r21, r12
  CMP r6, r0
  ADD r15, r1, r14
  FRAME
  JMP main_0
