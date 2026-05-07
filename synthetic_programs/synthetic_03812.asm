; input driven program
; initialization
  LDI r14, 702
  LDI r1, 0xA8B0EE
main_0:
  LDI r11, 10
  LDI r4, 0x88919B
  LDI r9, 0x0CF6D4
  WPIXEL
  LDI r7, 16
  LDI r10, 0x0A68DE
  LDI r12, 3216
  LDI r8, 1856
  LDI r7, 0x1992B6
  RECTF r7, r10, r12, r8, r7
  ADD r1, r0, r25
  SUBI r0, r10, 4
  FRAME
  JMP main_0
