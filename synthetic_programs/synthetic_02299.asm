; counted animation
; initialization
  LDI r9, 3820
  LDI r5, 255
  LDI r13, 3090
  LDI r2, 0x076A51
  LDI r15, 64
loop_0:
  LDI r10, 1780
  FILL r10
  ADDI r12, r11, 72
  LDI r14, 0x603C63
  LDI r27, 0xC0BC2D
  LDI r0, 0xB0E4AF
  LDI r8, 4000
  LDI r6, 2118
  RECTF r14, r27, r0, r8, r6
  SUBI r9, r13, 11
  LDI r1, 1
  SUB r15, r15, r1
  JNZ r15, loop_0
  HALT
