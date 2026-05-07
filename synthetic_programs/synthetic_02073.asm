; drawing loop program
; initialization
  LDI r5, 0
  LDI r1, 1
  LDI r15, 0x1BF043
main_0:
  OR r0, r7, r22
  OR r8, r5, r12
  OR r7, r1, r4
  LDI r25, 0xE90F3F
  LDI r7, 0x1A7A85
  LDI r14, 0x057902
  WPIXEL
  SUB r4, r5, r7
  FRAME
  JMP main_0
