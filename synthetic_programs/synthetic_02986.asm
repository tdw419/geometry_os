; conditional logic
; initialization
  LDI r14, 310
  LDI r10, 32
  LDI r11, 1500
  LDI r7, 0x8E8911
  CMP r15, r10
  JZ r15, else_0
  AND r6, r9, r7
  SHL r8, r15, r4
  MUL r4, r0, r15
  JMP endif_1
else_0:
  LDI r6, 0xEFF49B
  LDI r9, 10
  LDI r10, 16
  PSETI
  LDI r3, 10
  LDI r10, 10
  LDI r14, 3055
  LDI r0, 16
  LDI r10, 1
  LINE r3, r10, r14, r0, r10
endif_1:
  CMP r7, r10
  JNZ r7, else_2
  AND r7, r14, r0
  MOD r0, r15, r5
  DIV r6, r15, r5
  JMP endif_3
else_2:
  LDI r8, 3939
  LDI r9, 0x77711C
  LDI r0, 3378
  LDI r11, 0xBCAB46
  LDI r4, 974
  RECTF r8, r9, r0, r11, r4
  LDI r10, 0xA4E15C
  LDI r4, 128
  LDI r6, 2629
  WPIXEL
  LDI r3, 4058
  FILL r3
endif_3:
  CMP r11, r7
  JZ r11, else_4
  XOR r9, r2, r6
  SHR r15, r11, r7
  DIV r1, r6, r10
  JMP endif_5
else_4:
  LDI r1, 0xDC9CCE
  LDI r7, 0xD650BA
  LDI r31, 2338
  PSETI
  LDI r4, 0xAE272A
  LDI r2, 255
  LDI r4, 0x14B210
  WPIXEL
  LDI r12, 16
  LDI r0, 0x59EE9C
  LDI r1, 3117
  PSETI
endif_5:
  HALT
