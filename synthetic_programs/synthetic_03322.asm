; conditional logic
; initialization
  LDI r13, 128
  LDI r5, 2
  CMP r27, r2
  JNZ r27, else_0
  SHL r9, r2, r23
  DIV r0, r14, r2
  JMP endif_1
else_0:
  LDI r9, 0xC8885B
  LDI r4, 255
  LDI r9, 3315
  PSETI
  LDI r4, 0
  LDI r12, 1337
  LDI r10, 0xD80145
  LDI r12, 32
  LDI r13, 1
  LINE r4, r12, r10, r12, r13
  LDI r9, 0x5D4264
  LDI r1, 0x3FB857
  LDI r9, 128
  PSETI
  LDI r14, 157
  LDI r5, 0xF20938
  LDI r10, 0xB5C1BD
  LDI r4, 255
  LDI r2, 616
  LINE r14, r5, r10, r4, r2
endif_1:
  HALT
