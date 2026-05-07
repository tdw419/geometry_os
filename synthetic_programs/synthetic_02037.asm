; input driven program
; initialization
  LDI r6, 0x1233A5
  LDI r10, 229
main_0:
  LDI r17, 0x6C5CDA
  LDI r11, 0
  LDI r14, 3913
  TEXT r17, r11, r14, "HELLO"
  LDI r4, 456
  LDI r7, 4
  LDI r15, 8
  DRAWTEXT r4, r7, r15, "WORLD"
  SHR r12, r9, r3
  SAR r14, r1, r13
  CMP r2, r5
  OR r12, r21, r3
  AND r6, r4, r15
  AND r11, r14, r10
  XOR r13, r7, r2
  FRAME
  JMP main_0
