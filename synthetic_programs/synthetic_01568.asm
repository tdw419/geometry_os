; counted animation
; initialization
  LDI r15, 18
  LDI r24, 0x9CF8DE
  LDI r13, 128
loop_0:
  LDI r12, 0xB4CBF7
  LDI r11, 0x87EC04
  LDI r6, 705
  PSETI
  LDI r19, 1
  SUB r13, r13, r19
  JNZ r13, loop_0
  LDI r10, 0xAB4A31
loop_1:
  LDI r8, 0x024306
  LDI r0, 8
  LDI r7, 0x98961D
  LDI r0, 3132
  LDI r8, 1999
  RECTF r8, r0, r7, r0, r8
  SUBI r5, r0, 254
  LDI r2, 256
  FILL r2
  MUL r11, r15, r9
  LDI r1, 1
  SUB r10, r10, r1
  JNZ r10, loop_1
  HALT
