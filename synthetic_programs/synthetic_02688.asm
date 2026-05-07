; input driven program
; initialization
  LDI r15, 2
  LDI r6, 2314
  LDI r8, 2685
  LDI r12, 2141
  LDI r7, 0xB6C26A
  LDI r11, 128
  LDI r2, 1276
  LDI r14, 0x35E35D
main_0:
  LDI r1, 2512
  LDI r8, 16
  LDI r10, 0
  DRAWTEXT r1, r8, r10, "WORLD"
  CMP r9, r2
  LDI r0, 794
  LDI r12, 0x3B811B
  LDI r10, 77
  WPIXEL
  FRAME
  JMP main_0
