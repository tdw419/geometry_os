; input driven program
; initialization
  LDI r9, 255
  LDI r3, 0x02D1F9
  LDI r6, 255
  LDI r10, 1
main_0:
  XOR r8, r15, r9
  AND r16, r11, r6
  IKEY r6
  CMPI r6, 10
  JNZ r6, key_1
  CMP r7, r14
  LDI r2, 1825
  LDI r6, 0
  LDI r11, 255
  PSET r2, r6, r11
  FRAME
  JMP main_0
