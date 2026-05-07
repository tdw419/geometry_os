; conditional logic
; initialization
  LDI r0, 0x07BC64
  LDI r13, 10
  LDI r5, 0x048B12
  LDI r3, 2590
  LDI r1, 255
  LDI r4, 0x70CC20
  LDI r11, 2956
  LDI r2, 1
  CMP r0, r3
  JZ r0, else_0
  AND r1, r3, r22
  SHR r13, r8, r14
  MUL r7, r15, r1
  SHR r4, r5, r10
  JMP endif_1
else_0:
  LDI r10, 32
  LDI r2, 64
  LDI r6, 0
  PSET r10, r2, r6
  LDI r4, 8
  LDI r15, 255
  LDI r4, 3930
  LDI r11, 0xF42D98
  LDI r15, 0x37E97E
  LINE r4, r15, r4, r11, r15
  LDI r11, 0x329036
  LDI r15, 0
  LDI r3, 3237
  LDI r1, 10
  CIRCLE r11, r15, r3, r1
endif_1:
  CMP r8, r15
  JNZ r8, else_2
  DIV r9, r1, r8
  MOD r12, r11, r8
  JMP endif_3
else_2:
  LDI r2, 0
  LDI r11, 1461
  LDI r4, 256
  PSETI
endif_3:
  CMP r7, r5
  JNZ r7, else_4
  MOD r6, r2, r9
  SUB r0, r15, r5
  XOR r13, r6, r0
  MUL r1, r5, r15
  JMP endif_5
else_4:
  LDI r4, 4034
  LDI r14, 800
  LDI r11, 0x240680
  LDI r11, 255
  LDI r14, 1441
  LINE r4, r14, r11, r11, r14
  LDI r5, 0x4D58E5
  FILL r5
  LDI r6, 0x46CE57
  LDI r12, 2016
  LDI r3, 2
  LDI r5, 16
  LDI r14, 1426
  LINE r6, r12, r3, r5, r14
endif_5:
  HALT
