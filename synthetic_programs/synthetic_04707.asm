; input driven program
; initialization
  LDI r16, 0x9E9B08
  LDI r10, 52
  LDI r5, 1636
  LDI r14, 128
  LDI r9, 1034
main_0:
  AND r7, r3, r12
  AND r5, r9, r8
  AND r14, r5, r3
  OR r11, r2, r5
  FRAME
  JMP main_0
