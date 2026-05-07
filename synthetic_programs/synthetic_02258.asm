; input driven program
; initialization
  LDI r11, 41
  LDI r14, 1662
  LDI r10, 0x4CC0FF
  LDI r7, 0
main_0:
  SAR r11, r15, r0
  SAR r14, r1, r9
  SHL r9, r4, r0
  OR r6, r11, r9
  AND r30, r26, r5
  XOR r3, r1, r11
  XOR r6, r8, r10
  XOR r15, r14, r13
  AND r12, r14, r0
  LDI r5, 0x1132C3
  LDI r8, 1
  LDI r9, 256
  DRAWTEXT r5, r8, r9, "WORLD"
  FRAME
  JMP main_0
