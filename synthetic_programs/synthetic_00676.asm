; drawing loop program
; initialization
  LDI r14, 1
  LDI r7, 0xD056E7
main_0:
  OR r2, r8, r4
  OR r6, r4, r16
  XOR r11, r6, r5
  XOR r8, r1, r5
  OR r5, r1, r9
  AND r11, r10, r1
  AND r12, r15, r8
  FRAME
  JMP main_0
