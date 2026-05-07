; conditional logic
; initialization
  LDI r2, 64
  LDI r0, 10
  CMP r5, r0
  JNZ r5, else_0
  MOD r9, r14, r11
  MUL r6, r4, r10
  AND r1, r0, r15
  JMP endif_1
else_0:
  LDI r2, 2332
  LDI r4, 255
  LDI r8, 0xF44E4C
  WPIXEL
  LDI r9, 4023
  LDI r3, 64
  LDI r1, 4
  PSET r9, r3, r1
  LDI r4, 1282
  LDI r20, 128
  LDI r0, 3039
  LDI r1, 0
  LDI r5, 8
  LINE r4, r20, r0, r1, r5
  LDI r9, 256
  LDI r26, 256
  LDI r2, 4
  PSET r9, r26, r2
endif_1:
  CMP r15, r7
  JZ r15, else_2
  SUB r4, r6, r5
  MOD r6, r4, r11
  JMP endif_3
else_2:
  LDI r7, 0x98FB0C
  FILL r7
endif_3:
  CMP r6, r7
  JNZ r6, else_4
  AND r8, r10, r13
  SHL r4, r12, r14
  SHL r7, r13, r1
  ADD r24, r13, r9
  JMP endif_5
else_4:
  LDI r8, 0x0DA53A
  LDI r5, 255
  LDI r3, 2668
  WPIXEL
  LDI r7, 0
  LDI r9, 267
  LDI r7, 2315
  WPIXEL
  LDI r5, 0x47768A
  LDI r15, 3339
  LDI r2, 3041
  PSETI
  LDI r11, 0
  LDI r0, 3158
  LDI r4, 0xD66EDA
  LDI r12, 2
  LDI r7, 1823
  RECTF r11, r0, r4, r12, r7
endif_5:
  HALT
