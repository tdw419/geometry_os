; conditional logic
; initialization
  LDI r14, 0x795DF4
  LDI r7, 10
  LDI r0, 128
  LDI r4, 0x635273
  LDI r5, 255
  CMP r6, r22
  JNZ r6, else_0
  SHR r5, r4, r1
  XOR r9, r0, r11
  XOR r7, r1, r4
  JMP endif_1
else_0:
  LDI r14, 1561
  FILL r14
endif_1:
  CMP r14, r27
  JNZ r14, else_2
  OR r15, r3, r4
  AND r11, r4, r7
  JMP endif_3
else_2:
  LDI r9, 1302
  LDI r6, 255
  LDI r0, 64
  LDI r10, 474
  CIRCLE r9, r6, r0, r10
endif_3:
  CMP r14, r2
  JNZ r14, else_4
  AND r1, r10, r0
  DIV r8, r4, r12
  MUL r12, r2, r16
  AND r30, r4, r1
  JMP endif_5
else_4:
  LDI r7, 0
  LDI r5, 64
  LDI r1, 461
  PSET r7, r5, r1
endif_5:
  HALT
