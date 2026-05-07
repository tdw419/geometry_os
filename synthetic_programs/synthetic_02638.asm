; conditional logic
; initialization
  LDI r8, 0x68D241
  LDI r12, 0xA7ED60
  LDI r3, 32
  LDI r0, 472
  LDI r14, 1
  LDI r10, 64
  CMP r7, r3
  JZ r7, else_0
  DIV r2, r14, r1
  JMP endif_1
else_0:
  LDI r14, 128
  LDI r12, 64
  LDI r13, 0x74468B
  PSETI
  LDI r13, 0x0F4662
  LDI r11, 1
  LDI r15, 2984
  LDI r2, 0x8FEE68
  LDI r10, 8
  LINE r13, r11, r15, r2, r10
  LDI r1, 0xF9881C
  LDI r15, 0
  LDI r15, 0
  LDI r5, 479
  LDI r14, 0xA81007
  LINE r1, r15, r15, r5, r14
endif_1:
  HALT
