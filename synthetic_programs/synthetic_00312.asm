; conditional logic
; initialization
  LDI r8, 10
  LDI r1, 64
  CMP r9, r5
  JNZ r9, else_0
  SHL r14, r6, r13
  MUL r11, r14, r12
  JMP endif_1
else_0:
  LDI r11, 1113
  LDI r6, 3348
  LDI r27, 10
  LDI r4, 0
  LDI r22, 2339
  LINE r11, r6, r27, r4, r22
endif_1:
  HALT
