; input driven program
; initialization
  LDI r3, 0
  LDI r15, 117
  LDI r10, 4
  LDI r2, 2
  LDI r29, 0x6F30AC
main_0:
  LDI r6, 0x7FB31A
  LDI r11, 0x2CB6BB
  LDI r0, 16
  DRAWTEXT r6, r11, r0, "WORLD"
  ADDI r7, r13, 128
  IKEY r19
  CMPI r19, 64
  JNZ r19, key_1
  FRAME
  JMP main_0
