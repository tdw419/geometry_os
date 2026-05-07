; drawing loop program
; initialization
  LDI r9, 0x4C6D89
  LDI r1, 2632
  LDI r6, 256
  LDI r11, 3017
  LDI r5, 256
  LDI r13, 4
  LDI r2, 0xF0D79D
main_0:
  CMPI r4, 4
  ADDI r8, r19, 1
  ANDI r3, r9, 32
  FRAME
  JMP main_0
