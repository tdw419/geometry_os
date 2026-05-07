; input driven program
; initialization
  LDI r6, 32
  LDI r8, 10
main_0:
  CMPI r15, r30, 0x436F5C
  AND r11, r30, r12
  XOR r11, r2, r9
  AND r8, r0, r6
  XOR r6, r0, r7
  IKEY r5
  CMPI r5, 128
  JNZ r5, key_1
  IKEY r14
  CMPI r14, 0xE2182F
  JNZ r14, key_2
  SUB r2, r14, r6
  IKEY r4
  CMPI r4, 15
  JNZ r4, key_3
  FRAME
  JMP main_0
