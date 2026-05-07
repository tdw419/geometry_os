; conditional logic
; initialization
  LDI r3, 32
  LDI r11, 0xE2ED6B
  LDI r14, 2643
  LDI r1, 1
  CMP r10, r18
  JZ r10, else_0
  SHL r0, r5, r14
  MOD r11, r26, r8
  ADD r7, r8, r3
  AND r12, r13, r7
  JMP endif_1
else_0:
  LDI r2, 1496
  LDI r1, 2567
  LDI r1, 128
  LDI r8, 10
  CIRCLE r2, r1, r1, r8
  LDI r4, 255
  LDI r13, 2
  LDI r6, 0x9EF40C
  PSET r4, r13, r6
  LDI r2, 16
  LDI r0, 3117
  LDI r10, 925
  LDI r5, 64
  LDI r5, 0xE57346
  LINE r2, r0, r10, r5, r5
  LDI r1, 2
  LDI r11, 0x227AB9
  LDI r0, 0x8B3D7F
  LDI r0, 3100
  LDI r10, 0xB0FF9B
  RECTF r1, r11, r0, r0, r10
endif_1:
  CMP r9, r7
  JZ r9, else_2
  OR r9, r15, r2
  MOD r4, r5, r12
  DIV r11, r0, r2
  JMP endif_3
else_2:
  LDI r5, 3792
  LDI r9, 3583
  LDI r17, 8
  LDI r11, 255
  CIRCLE r5, r9, r17, r11
  LDI r8, 0
  LDI r14, 997
  LDI r14, 0xCB1AB5
  WPIXEL
  LDI r11, 0x91BE80
  LDI r12, 255
  LDI r15, 2
  LDI r15, 0x858126
  LDI r8, 0xDC3216
  RECTF r11, r12, r15, r15, r8
endif_3:
  HALT
