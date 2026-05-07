; input driven program
; initialization
  LDI r24, 2153
  LDI r4, 0xE5D286
  LDI r9, 738
  LDI r3, 10
main_0:
  LDI r4, 255
  LDI r1, 3464
  LDI r4, 16
  LDI r11, 0x77A3B6
  CIRCLE r4, r1, r4, r11
  OR r6, r14, r2
  OR r14, r12, r5
  AND r10, r5, r1
  AND r1, r4, r7
  IKEY r0
  CMPI r0, 64
  JNZ r0, key_1
  LDI r1, 32
  LDI r8, 2211
  LDI r6, 0x2355C3
  DRAWTEXT r1, r8, r6, "WORLD"
  FRAME
  JMP main_0
