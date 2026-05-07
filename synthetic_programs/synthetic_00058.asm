; conditional logic
; initialization
  LDI r13, 2
  LDI r4, 16
  LDI r10, 2003
  LDI r6, 2
  CMP r8, r15
  JZ r8, else_0
  AND r2, r12, r11
  JMP endif_1
else_0:
  LDI r10, 3959
  LDI r15, 299
  LDI r6, 4
  LDI r12, 3064
  LDI r2, 0x2B05BC
  LINE r10, r15, r6, r12, r2
  LDI r11, 0x1510AF
  LDI r10, 16
  LDI r15, 2
  PSET r11, r10, r15
  LDI r2, 64
  LDI r2, 806
  LDI r11, 0x668E96
  LDI r10, 0x8C869E
  CIRCLE r2, r2, r11, r10
  LDI r4, 2139
  LDI r9, 0xB179CB
  LDI r12, 97
  LDI r4, 256
  LDI r15, 0xEFFE78
  RECTF r4, r9, r12, r4, r15
endif_1:
  CMP r14, r2
  JZ r14, else_2
  SHR r13, r14, r0
  SHL r4, r0, r11
  JMP endif_3
else_2:
  LDI r12, 2454
  LDI r0, 2
  LDI r10, 3202
  LDI r22, 16
  LDI r3, 2495
  RECTF r12, r0, r10, r22, r3
  LDI r5, 0xFA2B86
  FILL r5
  LDI r2, 4
  FILL r2
endif_3:
  HALT
