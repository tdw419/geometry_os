; input driven program
; initialization
  LDI r3, 10
  LDI r2, 294
  LDI r10, 64
main_0:
  LDI r0, 8
  LDI r2, 0x3B1618
  LDI r30, 3914
  TEXT r0, r2, r30, "HELLO"
  CMP r6, r0
  CMP r8, r9
  CMPI r8, 0x75C7AA
  LDI r11, 0xE3470C
  LDI r15, 3205
  LDI r13, 623
  LDI r8, 16
  LDI r15, 665
  RECTF r11, r15, r13, r8, r15
  XOR r0, r4, r5
  AND r15, r13, r6
  AND r3, r4, r6
  FRAME
  JMP main_0
