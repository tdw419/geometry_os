; input driven program
; initialization
  LDI r6, 0x9C938C
  LDI r3, 3299
  LDI r7, 0xDD2D1B
  LDI r10, 2125
  LDI r0, 0x30E89F
main_0:
  LDI r9, 1
  LDI r1, 0x4E5EA8
  LDI r8, 0x2CAB3B
  LDI r4, 513
  LDI r15, 1569
  RECTF r9, r1, r8, r4, r15
  CMPI r15, 107
  CMPI r9, 256
  IKEY r4
  CMPI r4, 0xD29D93
  JNZ r4, key_1
  AND r9, r0, r3
  AND r10, r30, r4
  LDI r4, 4
  LDI r11, 3803
  LDI r2, 628
  PSETI
  FRAME
  JMP main_0
