; mixed program
; initialization
  LDI r12, 0x401305
  LDI r0, 8
  LDI r27, 3650
  LDI r9, 1625
  LDI r14, 255
  LDI r11, 1142
  OR r6, r4, r13
  CMP r8, r9
  JZ r8, else_0
  DIV r5, r10, r18
  XOR r9, r14, r3
  JMP endif_1
else_0:
  LDI r3, 0xCDF358
  FILL r3
  LDI r11, 1066
  LDI r15, 3228
  LDI r4, 0xB50DF6
  LDI r14, 3304
  LDI r29, 1
  RECTF r11, r15, r4, r14, r29
  LDI r13, 2861
  LDI r10, 10
  LDI r5, 3999
  LDI r5, 673
  LDI r11, 3077
  RECTF r13, r10, r5, r5, r11
endif_1:
  LDI r9, 4
loop_2:
  ANDI r5, r8, 148
  ANDI r6, r2, 29
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_2
  MOD r3, r8, r13
  CMP r14, r0
  JNZ r14, else_3
  DIV r6, r12, r28
  JMP endif_4
else_3:
  LDI r10, 256
  LDI r9, 2228
  LDI r12, 3319
  LDI r12, 0x759CD8
  CIRCLE r10, r9, r12, r12
  LDI r9, 4
  LDI r14, 0xB91131
  LDI r8, 828
  WPIXEL
  LDI r11, 16
  FILL r11
endif_4:
  HALT
