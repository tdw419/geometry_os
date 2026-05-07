; input driven program
; initialization
  LDI r0, 2
  LDI r12, 0xEE5E17
  LDI r13, 0xE63E85
  LDI r2, 98
  LDI r14, 3117
  LDI r9, 0xD32053
  LDI r5, 8
main_0:
  LDI r11, 2119
  LDI r12, 1881
  LDI r5, 256
  DRAWTEXT r11, r12, r5, "WORLD"
  OR r7, r15, r14
  XOR r8, r15, r2
  AND r9, r5, r7
  AND r0, r13, r11
  FRAME
  JMP main_0
