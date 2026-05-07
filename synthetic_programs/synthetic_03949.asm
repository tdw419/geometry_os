; drawing loop program
; initialization
  LDI r9, 256
  LDI r15, 3562
  LDI r2, 3160
  LDI r13, 0xC15982
  LDI r0, 3096
main_0:
  CMP r11, r8
  SUB r10, r9, r15
  LDI r10, 1
  LDI r0, 1
  LDI r6, 2210
  DRAWTEXT r10, r0, r6, "WORLD"
  LDI r8, 0x84110A
  LDI r2, 3576
  LDI r5, 128
  DRAWTEXT r8, r2, r5, "WORLD"
  SUBI r24, r10, 0x6AE909
  FRAME
  JMP main_0
