; counted animation
; initialization
  LDI r14, 256
  LDI r4, 0x8BC030
  LDI r6, 8
  LDI r7, 300
  LDI r8, 2129
  LDI r0, 256
loop_0:
  LDI r8, 4013
  LDI r11, 0xD827AF
  LDI r7, 1060
  PSETI
  LDI r5, 1
  SUB r0, r0, r5
  JNZ r0, loop_0
  LDI r7, 0
loop_1:
  SUBI r0, r3, 1
  LDI r10, 0x0FFD30
  LDI r11, 2909
  LDI r24, 2014
  LDI r13, 255
  LDI r30, 990
  RECTF r10, r11, r24, r13, r30
  ADDI r2, r6, 256
  LDI r24, 1
  SUB r7, r7, r24
  JNZ r7, loop_1
  HALT
