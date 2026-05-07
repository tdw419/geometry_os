; drawing loop program
; initialization
  LDI r4, 525
  LDI r10, 2811
  LDI r9, 1207
  LDI r15, 0x601094
  LDI r2, 1
  LDI r1, 0xEA7081
  LDI r17, 0xB17CD8
main_0:
  ADDI r2, r1, 256
  LDI r7, 128
  LDI r24, 10
  LDI r3, 2
  WPIXEL
  LDI r8, 0xE8A793
  LDI r0, 2
  LDI r5, 8
  DRAWTEXT r8, r0, r5, "WORLD"
  SUBI r0, r6, 0x946D59
  SHLI r0, r15, 5
  SHL r0, r12, r11
  SHL r10, r14, r5
  CMPI r6, r10, 32
  FRAME
  JMP main_0
