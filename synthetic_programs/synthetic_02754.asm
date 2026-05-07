; mixed program
; initialization
  LDI r9, 0xAEC38E
  LDI r7, 1698
  LDI r0, 0x27A89B
  LDI r2, 751
  LDI r12, 0x4A9B30
  LDI r11, 0
  LDI r3, 3768
  LDI r14, 0x272E0F
  LDI r8, 0x71B18F
loop_0:
  LDI r0, 3832
  LDI r10, 16
  LDI r13, 419
  WPIXEL
  ANDI r21, r4, 10
  LDI r4, 1
  SUB r8, r8, r4
  JNZ r8, loop_0
  SHL r15, r14, r11
  SHL r6, r2, r0
  SHL r12, r22, r4
  CMPI r2, 142
  HALT
