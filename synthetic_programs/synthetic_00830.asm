; input driven program
; initialization
  LDI r7, 255
  LDI r6, 0x742DDA
  LDI r12, 0x1F57CA
  LDI r18, 3846
  LDI r11, 32
  LDI r5, 512
  LDI r2, 2857
  LDI r1, 2728
main_0:
  LDI r0, 0x411E55
  LDI r12, 0xA57757
  LDI r7, 0xEA5594
  LDI r13, 0x1AD3AD
  LDI r14, 2571
  RECTF r0, r12, r7, r13, r14
  CMPI r8, r1, 166
  AND r29, r9, r12
  XOR r14, r7, r28
  FRAME
  JMP main_0
