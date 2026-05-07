; input driven program
; initialization
  LDI r11, 16
  LDI r22, 4083
  LDI r2, 16
  LDI r8, 1
  LDI r0, 128
  LDI r13, 3692
main_0:
  SHL r8, r13, r4
  DIV r4, r12, r2
  IKEY r5
  CMPI r5, 0
  JNZ r5, key_1
  FRAME
  JMP main_0
