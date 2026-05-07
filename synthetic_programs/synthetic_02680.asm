; input driven program
; initialization
  LDI r5, 1000
  LDI r6, 3493
  LDI r11, 1
  LDI r13, 1637
  LDI r15, 1631
  LDI r3, 0x55D904
main_0:
  LDI r14, 4
  LDI r4, 2587
  LDI r14, 64
  LDI r9, 2
  LDI r8, 16
  RECTF r14, r4, r14, r9, r8
  CMP r0, r10
  XOR r12, r8, r2
  AND r5, r3, r10
  XOR r2, r4, r0
  FRAME
  JMP main_0
