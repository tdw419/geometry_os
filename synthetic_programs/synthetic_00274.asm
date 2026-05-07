; counted animation
; initialization
  LDI r13, 255
  LDI r1, 0x30A61B
  LDI r3, 16
loop_0:
  LDI r24, 1
  LDI r0, 128
  LDI r12, 0xB438BB
  WPIXEL
  LDI r0, 653
  LDI r13, 492
  LDI r12, 128
  WPIXEL
  LDI r10, 0x363F61
  FILL r10
  CMPI r4, r8, 0x0C3D5A
  LDI r15, 1
  SUB r3, r3, r15
  JNZ r3, loop_0
  HALT
