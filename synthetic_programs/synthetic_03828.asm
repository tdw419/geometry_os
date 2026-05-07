; conditional logic
; initialization
  LDI r12, 1071
  LDI r4, 0
  LDI r1, 4
  LDI r11, 0
  LDI r8, 0xD6A484
  LDI r9, 0x61E474
  LDI r15, 128
  CMP r1, r15
  JZ r1, else_0
  DIV r1, r14, r9
  SUB r15, r0, r8
  JMP endif_1
else_0:
  LDI r6, 10
  FILL r6
  LDI r15, 0xB05C12
  LDI r11, 8
  LDI r12, 0xC5B85A
  LDI r3, 10
  LDI r8, 0x8FC1F3
  LINE r15, r11, r12, r3, r8
  LDI r9, 256
  LDI r4, 32
  LDI r14, 0x62CA01
  PSET r9, r4, r14
  LDI r2, 3747
  FILL r2
endif_1:
  CMP r6, r13
  JNZ r6, else_2
  MUL r9, r4, r10
  MUL r0, r8, r14
  MUL r6, r5, r0
  JMP endif_3
else_2:
  LDI r12, 32
  LDI r13, 10
  LDI r7, 0x8C4B78
  PSETI
  LDI r10, 559
  LDI r3, 2085
  LDI r7, 2526
  PSETI
  LDI r0, 0x5CA28B
  LDI r5, 10
  LDI r11, 3409
  LDI r25, 10
  LDI r11, 1871
  LINE r0, r5, r11, r25, r11
endif_3:
  HALT
