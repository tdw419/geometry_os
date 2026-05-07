; input driven program
; initialization
  LDI r6, 0x58C0AA
  LDI r15, 2419
  LDI r12, 16
main_0:
  XOR r15, r12, r1
  AND r11, r13, r12
  IKEY r13
  CMPI r13, 4
  JNZ r13, key_1
  MOD r27, r4, r1
  FRAME
  JMP main_0
