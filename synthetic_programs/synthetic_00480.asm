; input driven program
; initialization
  LDI r1, 909
  LDI r20, 1151
  LDI r11, 0xE368B6
  LDI r0, 2
  LDI r3, 8
  LDI r8, 0xF9F6E6
main_0:
  ADDI r8, r9, 57
  CMP r12, r15
  IKEY r3
  CMPI r3, 0xE9972D
  JNZ r3, key_1
  LDI r11, 1028
  LDI r15, 256
  LDI r11, 256
  DRAWTEXT r11, r15, r11, "WORLD"
  XOR r6, r13, r8
  CMP r4, r12
  FRAME
  JMP main_0
