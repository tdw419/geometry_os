; drawing loop program
; initialization
  LDI r5, 2786
  LDI r13, 255
  LDI r4, 0xBCC7A9
  LDI r8, 3108
  LDI r6, 0
main_0:
  CMP r29, r15
  LDI r8, 2550
  LDI r0, 128
  LDI r23, 1
  PSET r8, r0, r23
  ANDI r24, r23, 4
  SHL r10, r3, r11
  FRAME
  JMP main_0
