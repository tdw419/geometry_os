; input driven program
; initialization
  LDI r15, 4
  LDI r13, 276
  LDI r28, 231
main_0:
  LDI r1, 0x11B0F5
  LDI r10, 0x9BC4C1
  LDI r9, 0x133F76
  LDI r9, 32
  LDI r13, 1368
  RECTF r1, r10, r9, r9, r13
  CMPI r11, r0, 2
  LDI r12, 0xB6B271
  LDI r12, 3372
  LDI r9, 128
  WPIXEL
  LDI r6, 0x6F67DE
  LDI r31, 2275
  LDI r2, 0xDAC06C
  TEXT r6, r31, r2, "HELLO"
  AND r6, r13, r4
  AND r8, r3, r5
  XOR r2, r3, r9
  FRAME
  JMP main_0
