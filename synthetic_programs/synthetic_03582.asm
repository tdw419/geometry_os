; counted animation
; initialization
  LDI r14, 2215
  LDI r3, 1
  LDI r5, 986
  LDI r4, 16
loop_0:
  AND r0, r11, r4
  LDI r3, 1
  SUB r4, r4, r3
  JNZ r4, loop_0
  LDI r1, 2
loop_1:
  LDI r5, 32
  LDI r11, 4
  LDI r4, 10
  LDI r15, 3138
  LDI r3, 0xC7E772
  LINE r5, r11, r4, r15, r3
  LDI r7, 2586
  LDI r12, 0xFB0149
  LDI r7, 391
  PSET r7, r12, r7
  LDI r13, 1
  SUB r1, r1, r13
  JNZ r1, loop_1
  LDI r11, 0x5BC5BE
loop_2:
  CMPI r31, r13, 54
  CMPI r29, r14, 255
  LDI r2, 128
  LDI r8, 424
  LDI r26, 3039
  LDI r11, 1
  LDI r2, 2264
  RECTF r2, r8, r26, r11, r2
  SHL r7, r5, r9
  LDI r5, 1
  SUB r11, r11, r5
  JNZ r11, loop_2
  HALT
