; input driven program
; initialization
  LDI r3, 4
  LDI r4, 3339
main_0:
  AND r31, r5, r12
  AND r14, r12, r4
  OR r0, r10, r6
  OR r1, r13, r3
  LDI r7, 2
  LDI r10, 2
  LDI r5, 32
  DRAWTEXT r7, r10, r5, "WORLD"
  OR r13, r5, r7
  XOR r2, r11, r12
  XOR r23, r6, r2
  OR r28, r24, r9
  XOR r5, r13, r15
  LDI r9, 552
  LDI r2, 0xFF64B8
  LDI r14, 0x9B4504
  LDI r8, 2336
  CIRCLE r9, r2, r14, r8
  FRAME
  JMP main_0
