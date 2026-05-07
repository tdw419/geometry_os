; input driven program
; initialization
  LDI r1, 3712
  LDI r2, 64
main_0:
  SHL r9, r4, r11
  SHL r12, r11, r6
  SHR r2, r13, r12
  LDI r3, 2
  LDI r8, 361
  LDI r5, 4052
  WPIXEL
  LDI r9, 0x72E77E
  LDI r1, 32
  LDI r23, 4
  DRAWTEXT r9, r1, r23, "WORLD"
  CMPI r8, r4, 128
  SAR r0, r26, r11
  SHL r6, r18, r11
  SAR r9, r0, r6
  AND r11, r1, r22
  XOR r4, r12, r6
  XOR r9, r6, r21
  FRAME
  JMP main_0
