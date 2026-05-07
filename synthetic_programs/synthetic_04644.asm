; conditional logic
; initialization
  LDI r10, 0xC75387
  LDI r3, 0xA18E83
  LDI r5, 128
  LDI r11, 3083
  LDI r6, 1641
  LDI r8, 4
  CMP r14, r5
  JNZ r14, else_0
  SHL r7, r11, r13
  AND r14, r0, r15
  AND r2, r8, r16
  OR r28, r1, r7
  JMP endif_1
else_0:
  LDI r5, 2
  LDI r13, 10
  LDI r9, 795
  LDI r8, 0x66EB1C
  LDI r8, 32
  LINE r5, r13, r9, r8, r8
  LDI r8, 0
  LDI r0, 2908
  LDI r1, 0x81EB35
  PSETI
endif_1:
  CMP r8, r7
  JNZ r8, else_2
  AND r7, r9, r14
  MUL r12, r7, r11
  SUB r14, r10, r15
  JMP endif_3
else_2:
  LDI r1, 1
  FILL r1
  LDI r11, 0x3AD17A
  FILL r11
  LDI r5, 0xB3148E
  FILL r5
  LDI r8, 3364
  LDI r12, 128
  LDI r3, 8
  LDI r4, 10
  LDI r9, 583
  LINE r8, r12, r3, r4, r9
endif_3:
  HALT
