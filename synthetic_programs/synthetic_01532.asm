; input driven program
; initialization
  LDI r5, 1465
  LDI r8, 1681
  LDI r11, 998
  LDI r6, 255
main_0:
  AND r2, r5, r6
  AND r14, r3, r7
  AND r7, r10, r9
  MUL r2, r9, r0
  FRAME
  JMP main_0
