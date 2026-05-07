; input driven program
; initialization
  LDI r2, 1625
  LDI r15, 256
  LDI r1, 1587
main_0:
  ADDI r9, r15, 0xCECC30
  SUBI r4, r12, 247
  IKEY r12
  CMPI r12, 201
  JNZ r12, key_1
  LDI r11, 0x787BCA
  LDI r2, 0x6EE2F3
  LDI r6, 1042
  DRAWTEXT r11, r2, r6, "WORLD"
  IKEY r24
  CMPI r24, 78
  JNZ r24, key_2
  FRAME
  JMP main_0
