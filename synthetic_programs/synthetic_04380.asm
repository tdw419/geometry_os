; mixed program
; initialization
  LDI r6, 1676
  LDI r12, 3414
  LDI r6, 128
  LDI r9, 0x4A60FB
  LDI r15, 2065
  PSETI
  CMP r3, r7
  JZ r3, else_0
  MOD r1, r4, r5
  JMP endif_1
else_0:
  LDI r14, 0x1B5E66
  LDI r13, 255
  LDI r6, 10
  LDI r5, 256
  LDI r7, 0x6B6D2E
  RECTF r14, r13, r6, r5, r7
  LDI r15, 1599
  FILL r15
  LDI r2, 0xCB4571
  LDI r8, 8
  LDI r13, 128
  WPIXEL
endif_1:
  LDI r6, 8
  LDI r1, 775
  LDI r3, 0xFDEF0F
  TEXT r6, r1, r3, "HELLO"
  LDI r2, 2904
  LDI r6, 3289
  LDI r14, 2
  TEXT r2, r6, r14, "HELLO"
  HALT
