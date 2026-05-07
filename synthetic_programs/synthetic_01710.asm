; input driven program
; initialization
  LDI r9, 1
  LDI r10, 560
  LDI r15, 1544
  LDI r2, 2235
  LDI r14, 128
  LDI r12, 16
  LDI r11, 128
  LDI r13, 255
main_0:
  IKEY r0
  CMPI r0, 0x71FE4E
  JNZ r0, key_1
  CMPI r3, 180
  SHLI r13, r5, 64
  SHL r11, r12, r14
  XOR r10, r14, r7
  SHL r6, r3, r12
  SAR r6, r1, r12
  SHR r4, r20, r10
  CMPI r7, 0x33741C
  FRAME
  JMP main_0
