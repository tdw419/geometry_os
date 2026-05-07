; input driven program
; initialization
  LDI r14, 461
  LDI r6, 3327
  LDI r13, 3364
  LDI r3, 0xD2C90C
  LDI r9, 0x8468D7
  LDI r1, 255
  LDI r12, 2078
main_0:
  CMP r13, r1
  SUBI r10, r12, 2
  IKEY r15
  CMPI r15, 0x97253C
  JNZ r15, key_1
  ADDI r14, r19, 103
  DIV r10, r15, r0
  FRAME
  JMP main_0
