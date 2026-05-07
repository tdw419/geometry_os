; conditional logic
; initialization
  LDI r14, 32
  LDI r11, 0xADB54B
  LDI r15, 1425
  LDI r0, 2972
  LDI r8, 2491
  LDI r9, 3478
  LDI r13, 1748
  CMP r15, r12
  JNZ r15, else_0
  MUL r12, r1, r10
  XOR r13, r1, r3
  MUL r0, r6, r4
  SHL r10, r13, r7
  JMP endif_1
else_0:
  LDI r6, 3010
  LDI r13, 3603
  LDI r7, 10
  LDI r3, 16
  LDI r5, 10
  LINE r6, r13, r7, r3, r5
  LDI r3, 1147
  LDI r0, 10
  LDI r15, 0xD13CA8
  LDI r3, 2486
  LDI r13, 0x382847
  RECTF r3, r0, r15, r3, r13
  LDI r3, 0x179317
  FILL r3
  LDI r8, 1
  FILL r8
endif_1:
  CMP r4, r0
  JZ r4, else_2
  XOR r6, r14, r4
  MUL r15, r12, r2
  OR r0, r8, r6
  JMP endif_3
else_2:
  LDI r8, 2849
  LDI r8, 0x22CCF8
  LDI r7, 0xE083EC
  PSETI
endif_3:
  HALT
