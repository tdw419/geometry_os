; counted animation
; initialization
  LDI r2, 300
  LDI r0, 974
  LDI r12, 979
  LDI r13, 0
loop_0:
  SUB r0, r25, r15
  LDI r7, 0
  LDI r12, 0x27EA6B
  LDI r2, 246
  LDI r2, 2578
  LDI r4, 8
  LINE r7, r12, r2, r2, r4
  SUB r14, r15, r9
  LDI r0, 1
  SUB r13, r13, r0
  JNZ r13, loop_0
  LDI r11, 0xBF8D4F
loop_1:
  CMPI r2, r13, 0xD35640
  DIV r28, r1, r14
  LDI r0, 1
  SUB r11, r11, r0
  JNZ r11, loop_1
  LDI r1, 37
loop_2:
  SUBI r1, r15, 0x493144
  LDI r0, 4
  LDI r2, 8
  LDI r2, 2267
  LDI r5, 256
  LDI r3, 2865
  LINE r0, r2, r2, r5, r3
  MUL r2, r7, r8
  LDI r7, 1
  SUB r1, r1, r7
  JNZ r1, loop_2
  HALT
