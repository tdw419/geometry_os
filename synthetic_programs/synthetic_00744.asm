; input driven program
; initialization
  LDI r1, 2
  LDI r10, 0x914971
main_0:
  CMPI r3, 60
  CMPI r5, 128
  XOR r12, r13, r10
  CMPI r10, 255
  IKEY r24
  CMPI r24, 245
  JNZ r24, key_1
  OR r15, r4, r9
  FRAME
  JMP main_0
