; input driven program
; initialization
  LDI r4, 10
  LDI r5, 3252
  LDI r3, 3347
  LDI r1, 900
  LDI r12, 3015
  LDI r2, 0x693410
  LDI r6, 0x4FC484
  LDI r10, 2467
main_0:
  IKEY r2
  CMPI r2, 16
  JNZ r2, key_1
  SHL r14, r4, r11
  SHR r14, r17, r15
  FRAME
  JMP main_0
