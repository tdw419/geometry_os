; input driven program
; initialization
  LDI r14, 467
  LDI r23, 64
  LDI r12, 0x49E1E5
  LDI r1, 3216
  LDI r3, 64
  LDI r6, 13
main_0:
  CMP r5, r8
  LDI r4, 3317
  LDI r9, 194
  LDI r9, 2699
  WPIXEL
  CMP r1, r15
  XOR r5, r3, r7
  IKEY r31
  CMPI r31, 17
  JNZ r31, key_1
  FRAME
  JMP main_0
