; input driven program
; initialization
  LDI r5, 4
  LDI r15, 2455
  LDI r8, 16
  LDI r9, 0x6EFCC6
  LDI r6, 255
  LDI r0, 0xFA8C68
  LDI r13, 2
  LDI r2, 128
main_0:
  IKEY r13
  CMPI r13, 211
  JNZ r13, key_1
  AND r11, r2, r9
  AND r15, r7, r9
  XOR r9, r7, r10
  OR r7, r0, r21
  FRAME
  JMP main_0
