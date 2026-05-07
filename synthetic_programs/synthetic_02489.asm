; drawing loop program
; initialization
  LDI r2, 0x2D4A7E
  LDI r26, 16
  LDI r7, 4
  LDI r0, 3535
  LDI r15, 0x359E38
  LDI r6, 1360
main_0:
  LDI r7, 210
  LDI r6, 0x6DAD12
  LDI r11, 255
  DRAWTEXT r7, r6, r11, "WORLD"
  SAR r3, r12, r1
  SHR r14, r0, r13
  SAR r15, r5, r3
  AND r15, r12, r13
  AND r5, r7, r9
  AND r3, r11, r0
  XOR r2, r4, r14
  XOR r14, r4, r9
  XOR r6, r15, r4
  XOR r12, r4, r9
  CMPI r28, r5, 0x6B241D
  XOR r12, r10, r4
  AND r0, r4, r14
  FRAME
  JMP main_0
