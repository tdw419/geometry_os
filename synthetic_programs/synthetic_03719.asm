; input driven program
; initialization
  LDI r10, 3684
  LDI r15, 128
  LDI r11, 0x8AC578
  LDI r14, 0x98EF91
  LDI r30, 1
main_0:
  SHLI r5, r8, 2
  SHLI r4, r3, 0
  IKEY r13
  CMPI r13, 63
  JNZ r13, key_1
  LDI r15, 0x05B280
  LDI r9, 0xAD34E1
  LDI r1, 0x9AE7EE
  LDI r0, 1351
  LDI r0, 64
  RECTF r15, r9, r1, r0, r0
  FRAME
  JMP main_0
