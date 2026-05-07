; input driven program
; initialization
  LDI r1, 0xDB9332
  LDI r9, 128
  LDI r12, 1375
  LDI r10, 0xC63A65
  LDI r8, 3977
  LDI r15, 95
main_0:
  IKEY r5
  CMPI r5, 35
  JNZ r5, key_1
  SUBI r8, r4, 0x117AB5
  AND r11, r6, r30
  XOR r6, r15, r5
  FRAME
  JMP main_0
