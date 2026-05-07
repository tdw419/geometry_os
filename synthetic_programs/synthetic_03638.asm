; mixed program
; initialization
  LDI r5, 4
  LDI r9, 0x8EF3C4
  LDI r0, 3603
  LDI r6, 1
  LDI r14, 1520
  LDI r16, 64
  LDI r7, 4
  LDI r4, 3336
  CMP r7, r5
  JZ r7, else_0
  ADD r1, r9, r11
  MOD r8, r29, r14
  MUL r7, r4, r8
  OR r15, r14, r9
  JMP endif_1
else_0:
  LDI r0, 255
  LDI r13, 0xA58594
  LDI r9, 2695
  LDI r4, 0xF033DE
  CIRCLE r0, r13, r9, r4
  LDI r4, 64
  LDI r13, 1034
  LDI r10, 4
  LDI r10, 8
  CIRCLE r4, r13, r10, r10
endif_1:
  LDI r7, 2265
  LDI r9, 98
  LDI r3, 0x948525
  DRAWTEXT r7, r9, r3, "WORLD"
  AND r13, r2, r8
  XOR r3, r15, r10
  OR r4, r11, r1
  AND r6, r14, r4
  CMP r7, r11
  JNZ r7, else_2
  SUB r5, r10, r9
  XOR r9, r4, r8
  JMP endif_3
else_2:
  LDI r30, 1
  LDI r5, 0x975A2F
  LDI r3, 1
  LDI r13, 698
  LDI r10, 2
  RECTF r30, r5, r3, r13, r10
  LDI r7, 2601
  LDI r0, 0xF18393
  LDI r2, 0xC8F721
  WPIXEL
  LDI r9, 16
  FILL r9
  LDI r4, 255
  LDI r6, 2296
  LDI r1, 3762
  PSET r4, r6, r1
endif_3:
  CMP r8, r0
  JZ r8, else_4
  MUL r1, r10, r2
  XOR r4, r14, r8
  SHR r27, r6, r8
  SHR r3, r8, r11
  JMP endif_5
else_4:
  LDI r24, 867
  LDI r10, 3335
  LDI r9, 0x898679
  LDI r14, 0
  CIRCLE r24, r10, r9, r14
  LDI r6, 671
  FILL r6
endif_5:
  LDI r3, 0x4B6250
  LDI r15, 0
  LDI r3, 2340
  TEXT r3, r15, r3, "HELLO"
  LDI r15, 64
  LDI r8, 255
  LDI r13, 0xDA8368
  WPIXEL
  LDI r15, 1683
  LDI r2, 959
  LDI r14, 2342
  TEXT r15, r2, r14, "HELLO"
  HALT
