; conditional logic
; initialization
  LDI r11, 1
  LDI r27, 3825
  LDI r7, 64
  CMP r6, r5
  JZ r6, else_0
  MUL r0, r12, r3
  SHL r11, r7, r3
  JMP endif_1
else_0:
  LDI r11, 128
  FILL r11
  LDI r8, 3377
  FILL r8
  LDI r4, 128
  LDI r10, 0xF6AD99
  LDI r9, 0xF20779
  LDI r7, 1812
  LDI r13, 32
  RECTF r4, r10, r9, r7, r13
endif_1:
  CMP r13, r0
  JZ r13, else_2
  AND r2, r1, r13
  SUB r12, r7, r13
  AND r6, r4, r14
  MUL r3, r19, r2
  JMP endif_3
else_2:
  LDI r14, 3246
  LDI r3, 64
  LDI r14, 0x8C1235
  PSETI
endif_3:
  HALT
