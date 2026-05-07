; drawing loop program
; initialization
  LDI r6, 128
  LDI r1, 64
  LDI r10, 4
main_0:
  AND r4, r13, r3
  OR r2, r12, r11
  AND r6, r7, r12
  AND r15, r3, r6
  FRAME
  JMP main_0
