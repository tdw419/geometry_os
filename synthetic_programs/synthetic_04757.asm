; conditional logic
; initialization
  LDI r2, 2223
  LDI r15, 0
  LDI r0, 2010
  LDI r7, 1577
  LDI r9, 0x6BB44E
  LDI r11, 2105
  CMP r3, r14
  JZ r3, else_0
  SHR r3, r2, r13
  DIV r1, r3, r2
  JMP endif_1
else_0:
  LDI r6, 0x7754E4
  FILL r6
endif_1:
  CMP r3, r10
  JZ r3, else_2
  ADD r14, r11, r3
  AND r5, r10, r8
  OR r0, r9, r11
  JMP endif_3
else_2:
  LDI r15, 0x72BB47
  FILL r15
  LDI r15, 1126
  LDI r19, 128
  LDI r11, 419
  PSETI
  LDI r13, 0x6DF300
  LDI r2, 2
  LDI r6, 0x942DF9
  LDI r8, 0xB3BE49
  LDI r1, 64
  LINE r13, r2, r6, r8, r1
  LDI r6, 0x4F6CF1
  LDI r6, 2951
  LDI r15, 4
  WPIXEL
endif_3:
  CMP r9, r8
  JNZ r9, else_4
  AND r13, r4, r15
  ADD r5, r6, r3
  MUL r2, r14, r7
  SUB r2, r14, r11
  JMP endif_5
else_4:
  LDI r4, 0x62956D
  LDI r3, 256
  LDI r14, 0
  LDI r5, 8
  LDI r13, 2465
  LINE r4, r3, r14, r5, r13
  LDI r1, 0xD307EC
  LDI r11, 0xD976CB
  LDI r9, 0xD083C3
  WPIXEL
  LDI r1, 595
  LDI r6, 2711
  LDI r14, 165
  LDI r11, 0x5E62DC
  CIRCLE r1, r6, r14, r11
endif_5:
  HALT
