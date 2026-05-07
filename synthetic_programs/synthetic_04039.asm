; conditional logic
; initialization
  LDI r7, 8
  LDI r13, 0x678A6C
  LDI r15, 0x263C30
  LDI r6, 3343
  LDI r1, 255
  CMP r2, r11
  JNZ r2, else_0
  DIV r6, r1, r8
  OR r0, r9, r3
  SUB r0, r15, r14
  XOR r3, r9, r15
  JMP endif_1
else_0:
  LDI r1, 0xB20EA1
  LDI r9, 1142
  LDI r4, 1060
  WPIXEL
  LDI r0, 4
  LDI r6, 154
  LDI r8, 1414
  LDI r7, 1396
  CIRCLE r0, r6, r8, r7
endif_1:
  CMP r15, r25
  JNZ r15, else_2
  OR r7, r25, r13
  MOD r7, r14, r4
  XOR r8, r12, r7
  ADD r8, r13, r2
  JMP endif_3
else_2:
  LDI r3, 0x05B5F5
  LDI r3, 0xEE3DD5
  LDI r8, 256
  PSETI
  LDI r8, 0x212E0E
  LDI r9, 64
  LDI r9, 32
  WPIXEL
  LDI r21, 256
  LDI r1, 4
  LDI r0, 986
  PSETI
  LDI r11, 1172
  LDI r5, 1498
  LDI r5, 4051
  LDI r6, 249
  CIRCLE r11, r5, r5, r6
endif_3:
  CMP r1, r11
  JNZ r1, else_4
  MOD r0, r8, r9
  SHL r2, r7, r1
  JMP endif_5
else_4:
  LDI r0, 256
  LDI r8, 1332
  LDI r13, 128
  LDI r7, 0x372FBA
  LDI r19, 0x2C48AA
  LINE r0, r8, r13, r7, r19
  LDI r9, 0x95C244
  LDI r1, 465
  LDI r9, 255
  WPIXEL
  LDI r18, 0x90D524
  LDI r23, 3247
  LDI r5, 3396
  LDI r3, 3698
  LDI r13, 255
  LINE r18, r23, r5, r3, r13
  LDI r12, 32
  LDI r12, 2255
  LDI r8, 808
  LDI r13, 2
  CIRCLE r12, r12, r8, r13
endif_5:
  HALT
