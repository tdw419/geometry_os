; drawing loop program
; initialization
  LDI r0, 0x1B29B9
  LDI r6, 4
  LDI r3, 0x5D5C8C
  LDI r5, 1093
main_0:
  IKEY r15
  CMPI r15, 81
  JNZ r15, key_1
  AND r7, r9, r12
  AND r3, r15, r13
  SHL r1, r0, r5
  MUL r2, r11, r7
  LDI r14, 2608
  LDI r13, 10
  LDI r6, 0xA2EC2E
  DRAWTEXT r14, r13, r6, "WORLD"
  IKEY r12
  CMPI r12, 234
  JNZ r12, key_2
  FRAME
  JMP main_0
