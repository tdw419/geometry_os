; conditional logic
; initialization
  LDI r7, 2527
  LDI r5, 903
  CMP r4, r0
  JNZ r4, else_0
  SHR r10, r2, r6
  JMP endif_1
else_0:
  LDI r5, 256
  LDI r5, 4
  LDI r7, 0
  LDI r3, 346
  LDI r9, 0x7E9F40
  LINE r5, r5, r7, r3, r9
  LDI r3, 16
  FILL r3
  LDI r8, 64
  LDI r13, 0x4DBEF6
  LDI r12, 0x9FD754
  LDI r13, 8
  LDI r3, 0xF15B63
  RECTF r8, r13, r12, r13, r3
endif_1:
  CMP r13, r15
  JZ r13, else_2
  SHR r15, r11, r3
  AND r0, r7, r15
  JMP endif_3
else_2:
  LDI r4, 781
  LDI r6, 4
  LDI r12, 256
  PSETI
endif_3:
  CMP r7, r15
  JZ r7, else_4
  SHL r1, r13, r8
  DIV r15, r10, r23
  SHL r15, r2, r13
  JMP endif_5
else_4:
  LDI r0, 0x3E3252
  LDI r14, 16
  LDI r15, 0xD61768
  LDI r9, 0x96A47B
  CIRCLE r0, r14, r15, r9
endif_5:
  HALT
