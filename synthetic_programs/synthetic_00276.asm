; drawing loop program
; initialization
  LDI r11, 4
  LDI r29, 2355
  LDI r7, 383
  LDI r0, 8
  LDI r15, 0
  LDI r3, 3822
  LDI r1, 32
main_0:
  SUB r15, r0, r8
  XOR r8, r12, r15
  AND r8, r12, r0
  OR r12, r1, r15
  SHR r3, r6, r4
  SAR r4, r9, r6
  FRAME
  JMP main_0
