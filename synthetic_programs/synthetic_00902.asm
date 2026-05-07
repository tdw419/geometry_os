; input driven program
; initialization
  LDI r8, 0
  LDI r9, 16
main_0:
  IKEY r3
  CMPI r3, 216
  JNZ r3, key_1
  CMPI r8, 4
  CMPI r3, 64
  ANDI r14, r7, 0x10902D
  ADDI r3, r0, 1
  FRAME
  JMP main_0
