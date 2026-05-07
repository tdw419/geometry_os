; mixed program
; initialization
  LDI r14, 0xCF4852
  LDI r5, 0x275965
  LDI r8, 32
  LDI r15, 3120
  LDI r7, 84
  LDI r0, 255
  LDI r3, 0x05986A
  LDI r4, 64
  OR r7, r13, r5
  XOR r19, r0, r12
  XOR r4, r11, r8
  AND r0, r13, r1
  AND r6, r15, r7
  AND r13, r5, r22
  OR r3, r9, r11
  LDI r0, 0xA151BB
  LDI r7, 1848
  LDI r7, 32
  DRAWTEXT r0, r7, r7, "WORLD"
  IKEY r4
  CMPI r4, 0x34F9C3
  JNZ r4, key_0
  HALT
