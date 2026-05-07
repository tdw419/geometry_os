; conditional logic
; initialization
  LDI r3, 0x850C80
  LDI r21, 0
  LDI r0, 1749
  LDI r14, 3236
  LDI r2, 3613
  LDI r9, 0x5837ED
  LDI r5, 128
  CMP r14, r5
  JZ r14, else_0
  SHL r4, r15, r1
  OR r6, r14, r1
  JMP endif_1
else_0:
  LDI r4, 3374
  LDI r4, 128
  LDI r6, 256
  LDI r9, 0xD1A878
  LDI r9, 0xDF16D6
  RECTF r4, r4, r6, r9, r9
endif_1:
  CMP r10, r7
  JNZ r10, else_2
  MUL r10, r9, r15
  SUB r10, r5, r7
  JMP endif_3
else_2:
  LDI r8, 3974
  LDI r14, 256
  LDI r10, 2119
  LDI r12, 0xA2E91B
  LDI r8, 16
  LINE r8, r14, r10, r12, r8
  LDI r20, 3203
  LDI r2, 8
  LDI r7, 64
  WPIXEL
endif_3:
  CMP r10, r15
  JNZ r10, else_4
  SUB r12, r7, r5
  MOD r2, r10, r1
  JMP endif_5
else_4:
  LDI r5, 0xE73D7D
  LDI r15, 1403
  LDI r14, 2626
  LDI r2, 0
  LDI r12, 2825
  LINE r5, r15, r14, r2, r12
  LDI r18, 10
  LDI r3, 0xEBC4CB
  LDI r3, 2967
  LDI r7, 3346
  CIRCLE r18, r3, r3, r7
  LDI r7, 273
  LDI r6, 0xA848D4
  LDI r2, 8
  LDI r8, 2356
  LDI r7, 0xFBC199
  RECTF r7, r6, r2, r8, r7
  LDI r15, 255
  LDI r3, 473
  LDI r11, 256
  LDI r12, 4
  LDI r7, 1
  RECTF r15, r3, r11, r12, r7
endif_5:
  HALT
