; input driven program
; initialization
  LDI r1, 1
  LDI r4, 0x1ECB2B
  LDI r14, 2051
  LDI r7, 4
  LDI r8, 3564
  LDI r5, 1303
main_0:
  IKEY r30
  CMPI r30, 63
  JNZ r30, key_1
  LDI r4, 1
  LDI r3, 0x9FD859
  LDI r5, 751
  WPIXEL
  ANDI r2, r10, 209
  AND r14, r25, r12
  XOR r15, r6, r24
  SAR r3, r1, r11
  SHR r8, r7, r4
  SHL r0, r1, r14
  SAR r15, r13, r2
  FRAME
  JMP main_0
