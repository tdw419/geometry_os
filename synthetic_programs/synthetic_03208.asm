; input driven program
; initialization
  LDI r11, 255
  LDI r31, 2
  LDI r5, 335
  LDI r10, 256
main_0:
  LDI r4, 3791
  LDI r15, 0x2C213F
  LDI r13, 0xC5B24E
  WPIXEL
  XOR r14, r16, r5
  XOR r0, r9, r3
  OR r9, r14, r8
  OR r7, r14, r17
  AND r13, r8, r14
  XOR r24, r12, r5
  OR r10, r9, r7
  CMPI r8, 17
  LDI r13, 10
  LDI r12, 0x7DDA49
  LDI r0, 0x791CF3
  DRAWTEXT r13, r12, r0, "WORLD"
  LDI r15, 1217
  FILL r15
  FRAME
  JMP main_0
