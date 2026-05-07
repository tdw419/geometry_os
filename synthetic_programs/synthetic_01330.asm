; counted animation
; initialization
  LDI r14, 1133
  LDI r13, 256
  LDI r1, 2891
  LDI r15, 2
  LDI r5, 1490
  LDI r2, 48
loop_0:
  ANDI r15, r5, 128
  CMPI r1, r6, 67
  LDI r6, 0xCC11FB
  LDI r11, 4
  LDI r2, 1988
  LDI r0, 16
  CIRCLE r6, r11, r2, r0
  LDI r6, 1
  SUB r2, r2, r6
  JNZ r2, loop_0
  LDI r13, 0x65A61C
loop_1:
  CMPI r2, r19, 136
  LDI r5, 1
  SUB r13, r13, r5
  JNZ r13, loop_1
  LDI r4, 4
loop_2:
  CMPI r4, r24, 248
  LDI r14, 0x16B145
  LDI r14, 1705
  LDI r15, 2
  LDI r15, 2107
  LDI r27, 10
  LINE r14, r14, r15, r15, r27
  LDI r1, 1
  SUB r4, r4, r1
  JNZ r4, loop_2
  HALT
