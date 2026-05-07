; drawing loop program
; initialization
  LDI r3, 0x668FD4
  LDI r4, 1558
  LDI r5, 1
  LDI r9, 2132
  LDI r13, 2690
  LDI r1, 4
main_0:
  LDI r0, 0xE06914
  LDI r9, 16
  LDI r9, 255
  DRAWTEXT r0, r9, r9, "WORLD"
  SHLI r11, r0, 2
  SAR r13, r15, r12
  SUBI r4, r5, 155
  SUBI r1, r8, 255
  FRAME
  JMP main_0
