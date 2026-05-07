; conditional logic
; initialization
  LDI r12, 2102
  LDI r8, 740
  LDI r10, 2430
  LDI r1, 3360
  LDI r11, 4009
  CMP r3, r13
  JNZ r3, else_0
  AND r11, r29, r4
  JMP endif_1
else_0:
  LDI r13, 2231
  LDI r1, 64
  LDI r11, 64
  PSETI
  LDI r2, 1353
  LDI r1, 1
  LDI r5, 274
  WPIXEL
  LDI r14, 10
  LDI r5, 1
  LDI r6, 4
  LDI r15, 3337
  CIRCLE r14, r5, r6, r15
endif_1:
  CMP r6, r13
  JZ r6, else_2
  XOR r5, r6, r12
  DIV r15, r10, r8
  DIV r13, r15, r6
  JMP endif_3
else_2:
  LDI r9, 2675
  LDI r3, 0x4029EE
  LDI r13, 16
  PSETI
  LDI r13, 0x49756A
  LDI r4, 2784
  LDI r15, 3514
  LDI r1, 32
  LDI r15, 0xC5672B
  LINE r13, r4, r15, r1, r15
  LDI r15, 0xE8C7DE
  LDI r3, 3427
  LDI r4, 10
  LDI r6, 0
  CIRCLE r15, r3, r4, r6
  LDI r2, 0x00A801
  LDI r7, 128
  LDI r12, 0x70356A
  WPIXEL
endif_3:
  CMP r22, r11
  JZ r22, else_4
  SUB r13, r5, r0
  JMP endif_5
else_4:
  LDI r10, 2
  LDI r3, 3353
  LDI r7, 255
  LDI r0, 8
  LDI r7, 0x4E091F
  RECTF r10, r3, r7, r0, r7
  LDI r4, 1594
  LDI r2, 4
  LDI r3, 0x7D99B5
  LDI r2, 255
  LDI r7, 10
  RECTF r4, r2, r3, r2, r7
  LDI r7, 0xCB286F
  LDI r3, 8
  LDI r9, 4
  WPIXEL
  LDI r6, 1598
  LDI r6, 64
  LDI r1, 256
  PSETI
endif_5:
  HALT
