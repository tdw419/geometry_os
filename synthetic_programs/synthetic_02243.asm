; counted animation
; initialization
  LDI r7, 0x11A62D
  LDI r23, 64
  LDI r8, 13
loop_0:
  LDI r12, 1431
  FILL r12
  LDI r15, 0xA6072E
  LDI r2, 3009
  LDI r9, 2169
  WPIXEL
  LDI r11, 0x3F53F6
  LDI r11, 448
  LDI r14, 1391
  LDI r11, 0xF415BE
  LDI r6, 1675
  RECTF r11, r11, r14, r11, r6
  LDI r4, 1
  SUB r8, r8, r4
  JNZ r8, loop_0
  LDI r9, 32
loop_1:
  LDI r13, 128
  LDI r2, 2566
  LDI r12, 2911
  LDI r13, 256
  LDI r5, 60
  RECTF r13, r2, r12, r13, r5
  DIV r13, r0, r11
  LDI r3, 1
  SUB r9, r9, r3
  JNZ r9, loop_1
  LDI r5, 0x596305
loop_2:
  ADDI r6, r2, 41
  LDI r2, 1
  SUB r5, r5, r2
  JNZ r5, loop_2
  HALT
