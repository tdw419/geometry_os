; conditional logic
; initialization
  LDI r7, 0x92ABC4
  LDI r8, 10
  LDI r15, 0xEDD34A
  LDI r9, 3722
  LDI r13, 3310
  LDI r6, 665
  LDI r14, 1542
  CMP r23, r14
  JNZ r23, else_0
  SUB r10, r11, r5
  ADD r0, r18, r4
  AND r1, r11, r9
  JMP endif_1
else_0:
  LDI r15, 0xBCDBE9
  LDI r13, 1940
  LDI r4, 2122
  WPIXEL
  LDI r10, 128
  LDI r15, 2985
  LDI r1, 255
  PSETI
endif_1:
  CMP r13, r6
  JNZ r13, else_2
  XOR r3, r10, r5
  MUL r10, r11, r6
  DIV r10, r6, r11
  ADD r12, r7, r6
  JMP endif_3
else_2:
  LDI r5, 16
  LDI r12, 0xF1B0E6
  LDI r16, 16
  LDI r11, 4
  LDI r13, 0x616D01
  RECTF r5, r12, r16, r11, r13
  LDI r4, 0x1410E2
  FILL r4
endif_3:
  CMP r12, r10
  JNZ r12, else_4
  OR r9, r6, r13
  SHR r14, r15, r5
  SHL r11, r7, r10
  JMP endif_5
else_4:
  LDI r13, 64
  FILL r13
  LDI r15, 36
  LDI r2, 0x6B0636
  LDI r16, 4
  LDI r2, 8
  CIRCLE r15, r2, r16, r2
  LDI r3, 937
  FILL r3
endif_5:
  HALT
