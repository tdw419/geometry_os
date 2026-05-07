; input driven program
; initialization
  LDI r13, 0x99F2D8
  LDI r25, 2
  LDI r11, 0x17355A
main_0:
  LDI r1, 3884
  LDI r6, 0x645DF6
  LDI r7, 2940
  DRAWTEXT r1, r6, r7, "WORLD"
  LDI r7, 0x2C6B7D
  LDI r0, 0xAEB300
  LDI r15, 0xA11406
  WPIXEL
  SUBI r10, r3, 256
  SHR r4, r8, r7
  FRAME
  JMP main_0
