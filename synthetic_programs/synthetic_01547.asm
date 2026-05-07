; input driven program
; initialization
  LDI r3, 2036
  LDI r8, 8
  LDI r10, 8
  LDI r21, 1
main_0:
  IKEY r10
  CMPI r10, 0x8D23A4
  JNZ r10, key_1
  LDI r7, 128
  LDI r28, 0xC895BF
  LDI r5, 1908
  WPIXEL
  OR r7, r1, r11
  AND r12, r6, r11
  XOR r7, r19, r1
  AND r14, r11, r4
  IKEY r4
  CMPI r4, 84
  JNZ r4, key_2
  CMPI r13, 177
  FRAME
  JMP main_0
