; counted animation
; initialization
  LDI r1, 0xE01A76
  LDI r12, 0x183AB4
  LDI r14, 954
  LDI r7, 0x868103
loop_0:
  LDI r6, 3902
  LDI r10, 2777
  LDI r11, 0x2FFD71
  LDI r11, 0x28AB82
  LDI r9, 661
  LINE r6, r10, r11, r11, r9
  LDI r7, 0xFAAACF
  LDI r13, 0x1E63FF
  LDI r15, 0x5F563F
  WPIXEL
  SUBI r4, r11, 64
  LDI r15, 1
  SUB r7, r7, r15
  JNZ r7, loop_0
  HALT
