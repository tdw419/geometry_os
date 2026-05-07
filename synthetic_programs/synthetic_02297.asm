; input driven program
; initialization
  LDI r15, 787
  LDI r7, 256
  LDI r4, 0
  LDI r5, 3545
main_0:
  SHL r7, r13, r3
  SHLI r14, r12, 4
  IKEY r3
  CMPI r3, 0x1A22C8
  JNZ r3, key_1
  ADDI r11, r5, 8
  FRAME
  JMP main_0
