; counted animation
; initialization
  LDI r2, 771
  LDI r12, 0x8E3951
  LDI r14, 8
  LDI r5, 0
  LDI r4, 0x1C9387
  LDI r13, 0x57F7E8
loop_0:
  MUL r9, r0, r6
  LDI r3, 1
  SUB r13, r13, r3
  JNZ r13, loop_0
  LDI r3, 0xBC2D04
loop_1:
  ADDI r10, r7, 16
  LDI r12, 0xCDA62D
  LDI r12, 2296
  LDI r2, 3984
  LDI r8, 256
  LDI r4, 0x337EE4
  RECTF r12, r12, r2, r8, r4
  ANDI r8, r11, 0x3DF558
  LDI r11, 1
  SUB r3, r3, r11
  JNZ r3, loop_1
  HALT
