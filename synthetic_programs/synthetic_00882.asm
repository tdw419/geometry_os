; input driven program
; initialization
  LDI r9, 4
  LDI r12, 255
  LDI r14, 64
main_0:
  IKEY r15
  CMPI r15, 0x4A8314
  JNZ r15, key_1
  CMPI r4, r11, 112
  SHL r12, r4, r7
  SHL r15, r23, r13
  ADDI r0, r15, 170
  FRAME
  JMP main_0
