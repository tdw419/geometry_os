; input driven program
; initialization
  LDI r13, 0x81C560
  LDI r15, 10
  LDI r7, 669
  LDI r5, 973
main_0:
  OR r10, r11, r7
  OR r1, r6, r4
  IKEY r13
  CMPI r13, 4
  JNZ r13, key_1
  OR r14, r10, r12
  SUBI r13, r3, 255
  FRAME
  JMP main_0
