; conditional logic
; initialization
  LDI r0, 0x9CE8A2
  LDI r4, 551
  LDI r6, 8
  LDI r10, 255
  LDI r9, 0xBD541A
  LDI r12, 2336
  LDI r11, 56
  LDI r7, 0xAEEE68
  CMP r9, r15
  JZ r9, else_0
  DIV r6, r12, r7
  MUL r13, r2, r14
  ADD r6, r13, r0
  JMP endif_1
else_0:
  LDI r14, 1
  LDI r14, 32
  LDI r15, 3938
  LDI r3, 0
  LDI r15, 0x73A99D
  RECTF r14, r14, r15, r3, r15
  LDI r2, 3891
  LDI r9, 1
  LDI r2, 3957
  LDI r2, 0xC9B7CE
  CIRCLE r2, r9, r2, r2
  LDI r15, 4
  LDI r12, 0xEF4893
  LDI r1, 128
  WPIXEL
endif_1:
  CMP r11, r10
  JNZ r11, else_2
  DIV r4, r10, r13
  JMP endif_3
else_2:
  LDI r0, 0x9D001A
  LDI r9, 10
  LDI r3, 10
  WPIXEL
  LDI r11, 1242
  LDI r11, 2957
  LDI r9, 128
  PSET r11, r11, r9
  LDI r30, 0x01BD3D
  LDI r10, 0x96D566
  LDI r13, 8
  PSET r30, r10, r13
  LDI r9, 3967
  LDI r15, 3519
  LDI r6, 2215
  LDI r3, 256
  LDI r12, 2476
  LINE r9, r15, r6, r3, r12
endif_3:
  HALT
