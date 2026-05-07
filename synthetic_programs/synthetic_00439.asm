; input driven program
; initialization
  LDI r9, 255
  LDI r0, 0x621FD0
  LDI r1, 64
main_0:
  IKEY r2
  CMPI r2, 0
  JNZ r2, key_1
  XOR r7, r11, r14
  XOR r1, r6, r2
  AND r15, r10, r6
  OR r11, r13, r17
  FRAME
  JMP main_0
