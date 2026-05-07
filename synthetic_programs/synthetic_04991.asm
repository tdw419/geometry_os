; conditional logic
; initialization
  LDI r14, 0x4A7215
  LDI r7, 4
  LDI r11, 729
  LDI r2, 64
  LDI r9, 1
  CMP r8, r15
  JNZ r8, else_0
  SHL r15, r6, r10
  SHL r5, r4, r14
  SUB r14, r31, r9
  MOD r10, r0, r8
  JMP endif_1
else_0:
  LDI r13, 9
  LDI r11, 0xDAC3B2
  LDI r2, 3855
  PSETI
endif_1:
  CMP r12, r4
  JNZ r12, else_2
  MUL r11, r8, r6
  SHR r6, r7, r4
  JMP endif_3
else_2:
  LDI r9, 3249
  LDI r13, 2
  LDI r11, 0x329B3D
  LDI r10, 0
  LDI r13, 64
  RECTF r9, r13, r11, r10, r13
  LDI r1, 420
  FILL r1
  LDI r12, 2710
  LDI r9, 128
  LDI r3, 3739
  LDI r15, 0x71DF2D
  LDI r12, 64
  RECTF r12, r9, r3, r15, r12
  LDI r15, 0
  LDI r15, 32
  LDI r9, 1946
  LDI r3, 0
  LDI r8, 2715
  LINE r15, r15, r9, r3, r8
endif_3:
  CMP r23, r6
  JZ r23, else_4
  AND r4, r23, r11
  SUB r0, r5, r10
  JMP endif_5
else_4:
  LDI r8, 32
  LDI r4, 252
  LDI r3, 128
  WPIXEL
  LDI r13, 0x3FED0C
  LDI r15, 0xB1D8DF
  LDI r6, 3612
  PSETI
endif_5:
  HALT
