; drawing loop program
; initialization
  LDI r12, 1
  LDI r11, 0xDE80C8
  LDI r4, 1757
main_0:
  SHL r14, r7, r2
  LDI r0, 44
  LDI r11, 16
  LDI r13, 3468
  PSET r0, r11, r13
  LDI r8, 3366
  LDI r0, 0xFB3867
  LDI r11, 867
  WPIXEL
  FRAME
  JMP main_0
