; input driven program
; initialization
  LDI r0, 255
  LDI r4, 0xF7E6AB
  LDI r12, 128
main_0:
  IKEY r1
  CMPI r1, 0x95E28B
  JNZ r1, key_1
  OR r12, r6, r10
  XOR r4, r7, r15
  FRAME
  JMP main_0
