; input driven program
; initialization
  LDI r0, 32
  LDI r9, 348
  LDI r15, 16
main_0:
  AND r15, r14, r7
  XOR r5, r7, r11
  XOR r10, r3, r1
  XOR r6, r12, r7
  OR r3, r6, r9
  CMPI r9, r13, 32
  AND r2, r15, r11
  XOR r10, r2, r4
  XOR r6, r15, r28
  AND r26, r2, r8
  FRAME
  JMP main_0
