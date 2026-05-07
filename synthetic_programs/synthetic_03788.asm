; counted animation
; initialization
  LDI r7, 0xD26801
  LDI r0, 64
  LDI r12, 1811
  LDI r11, 0x40804B
  LDI r8, 0xC86B9D
  LDI r4, 2172
  LDI r9, 1
  LDI r1, 11
loop_0:
  ADDI r3, r1, 0x1F3C5F
  LDI r11, 1
  SUB r1, r1, r11
  JNZ r1, loop_0
  LDI r4, 256
loop_1:
  ADDI r13, r14, 0x3D5506
  ANDI r11, r5, 32
  LDI r6, 256
  FILL r6
  LDI r12, 1
  SUB r4, r4, r12
  JNZ r4, loop_1
  LDI r26, 26
loop_2:
  LDI r10, 2233
  LDI r12, 1085
  LDI r12, 1800
  PSET r10, r12, r12
  LDI r5, 0xF17446
  LDI r11, 10
  LDI r7, 3124
  LDI r14, 1754
  LDI r1, 0x08EC8C
  RECTF r5, r11, r7, r14, r1
  LDI r1, 1
  SUB r26, r26, r1
  JNZ r26, loop_2
  HALT
