; input driven program
; initialization
  LDI r7, 0x77AB0C
  LDI r2, 366
  LDI r14, 312
  LDI r3, 369
  LDI r4, 2837
  LDI r0, 255
  LDI r12, 2
  LDI r8, 1210
main_0:
  IKEY r7
  CMPI r7, 0x006B9B
  JNZ r7, key_1
  SHLI r2, r29, 1
  SAR r13, r1, r8
  SHR r11, r1, r5
  SHR r4, r15, r6
  CMP r4, r13
  IKEY r12
  CMPI r12, 0xD12E36
  JNZ r12, key_2
  IKEY r1
  CMPI r1, 4
  JNZ r1, key_3
  FRAME
  JMP main_0
