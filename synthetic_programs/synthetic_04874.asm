; conditional logic
; initialization
  LDI r1, 0xC22FF3
  LDI r12, 0xB4AD0D
  LDI r31, 3680
  LDI r5, 16
  LDI r9, 0
  CMP r15, r12
  JZ r15, else_0
  DIV r11, r7, r5
  JMP endif_1
else_0:
  LDI r1, 255
  FILL r1
  LDI r9, 878
  FILL r9
  LDI r14, 0x592F79
  FILL r14
  LDI r6, 2201
  LDI r15, 32
  LDI r24, 0xF7284F
  PSETI
endif_1:
  CMP r11, r10
  JZ r11, else_2
  DIV r14, r2, r12
  SHR r1, r0, r14
  JMP endif_3
else_2:
  LDI r19, 128
  LDI r6, 1039
  LDI r12, 0x4328C0
  LDI r8, 0x141CE8
  CIRCLE r19, r6, r12, r8
endif_3:
  HALT
