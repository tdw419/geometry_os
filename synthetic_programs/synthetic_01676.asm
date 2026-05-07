; input driven program
; initialization
  LDI r15, 2862
  LDI r7, 767
  LDI r12, 810
  LDI r10, 128
  LDI r0, 4
main_0:
  SUBI r6, r11, 123
  LDI r7, 2210
  LDI r4, 256
  LDI r12, 64
  WPIXEL
  FRAME
  JMP main_0
