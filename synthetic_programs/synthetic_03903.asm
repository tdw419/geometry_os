; conditional logic
; initialization
  LDI r5, 32
  LDI r9, 0x38D9D5
  LDI r8, 1682
  LDI r13, 2544
  LDI r12, 3220
  LDI r7, 255
  LDI r15, 0x4A408A
  CMP r15, r0
  JZ r15, else_0
  MUL r7, r8, r2
  OR r15, r13, r12
  DIV r15, r3, r14
  AND r14, r3, r4
  JMP endif_1
else_0:
  LDI r11, 4
  LDI r5, 3293
  LDI r13, 0x576FD3
  LDI r8, 10
  LDI r20, 16
  LINE r11, r5, r13, r8, r20
  LDI r15, 3431
  LDI r5, 8
  LDI r4, 2826
  LDI r8, 956
  CIRCLE r15, r5, r4, r8
endif_1:
  CMP r2, r14
  JZ r2, else_2
  OR r5, r8, r13
  XOR r14, r8, r7
  XOR r11, r1, r12
  JMP endif_3
else_2:
  LDI r16, 8
  LDI r8, 8
  LDI r13, 3952
  LDI r3, 64
  LDI r14, 0x114834
  LINE r16, r8, r13, r3, r14
  LDI r12, 0x6A7D69
  LDI r1, 0x9C53D6
  LDI r12, 0x3EA201
  LDI r18, 0x3854D8
  LDI r13, 256
  LINE r12, r1, r12, r18, r13
  LDI r10, 1441
  LDI r2, 0xBEE17E
  LDI r14, 10
  LDI r5, 2
  LDI r2, 1787
  RECTF r10, r2, r14, r5, r2
endif_3:
  CMP r4, r11
  JNZ r4, else_4
  DIV r6, r9, r11
  MOD r5, r11, r31
  AND r11, r2, r15
  JMP endif_5
else_4:
  LDI r9, 3313
  FILL r9
  LDI r0, 0x99E2DF
  LDI r15, 32
  LDI r5, 1865
  LDI r15, 8
  LDI r8, 0xBDE322
  LINE r0, r15, r5, r15, r8
  LDI r0, 0x98F0C4
  LDI r7, 0xE9F80B
  LDI r10, 8
  WPIXEL
endif_5:
  HALT
