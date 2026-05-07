; input driven program
; initialization
  LDI r12, 128
  LDI r4, 0x20FC1D
main_0:
  ADDI r1, r4, 1
  IKEY r21
  CMPI r21, 2
  JNZ r21, key_1
  SUB r14, r5, r8
  FRAME
  JMP main_0
