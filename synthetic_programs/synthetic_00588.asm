; drawing loop program
; initialization
  LDI r6, 3860
  LDI r14, 0xB3E41D
  LDI r0, 0xEE03A0
  LDI r1, 0xBEBF3D
  LDI r11, 485
  LDI r12, 8
  LDI r7, 0x37BCD6
  LDI r15, 0xFCD409
main_0:
  OR r5, r10, r1
  CMPI r10, r11, 8
  FRAME
  JMP main_0
