; input driven program
; initialization
  LDI r0, 1542
  LDI r11, 0x366D74
  LDI r9, 256
  LDI r6, 255
main_0:
  XOR r12, r6, r7
  XOR r14, r7, r2
  AND r8, r25, r29
  LDI r8, 0
  LDI r9, 0x370839
  LDI r2, 3199
  LDI r10, 1206
  CIRCLE r8, r9, r2, r10
  XOR r1, r12, r11
  AND r19, r1, r0
  OR r5, r2, r15
  CMPI r6, r7, 240
  FRAME
  JMP main_0
