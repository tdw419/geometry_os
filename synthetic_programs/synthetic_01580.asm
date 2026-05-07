; conditional logic
; initialization
  LDI r7, 0xD8CDA1
  LDI r0, 0x9E6694
  LDI r13, 0x6E2826
  CMP r2, r13
  JNZ r2, else_0
  MUL r13, r14, r3
  JMP endif_1
else_0:
  LDI r14, 1432
  FILL r14
  LDI r2, 359
  LDI r14, 0xA432F5
  LDI r30, 8
  LDI r13, 16
  LDI r14, 0
  RECTF r2, r14, r30, r13, r14
endif_1:
  HALT
