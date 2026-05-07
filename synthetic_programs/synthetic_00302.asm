; drawing loop program
; initialization
  LDI r10, 32
  LDI r0, 8
  LDI r5, 21
  LDI r11, 10
  LDI r3, 0x506272
  LDI r2, 0xE01C0C
main_0:
  XOR r6, r19, r8
  AND r11, r9, r0
  LDI r1, 3061
  LDI r13, 1743
  LDI r4, 1191
  LDI r12, 2172
  CIRCLE r1, r13, r4, r12
  LDI r14, 128
  LDI r11, 0x684576
  LDI r12, 4
  TEXT r14, r11, r12, "HELLO"
  LDI r9, 1667
  LDI r9, 10
  LDI r2, 3189
  LDI r6, 16
  CIRCLE r9, r9, r2, r6
  XOR r9, r10, r8
  OR r19, r10, r25
  OR r3, r15, r7
  AND r17, r0, r6
  FRAME
  JMP main_0
