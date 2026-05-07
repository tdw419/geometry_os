; conditional logic
; initialization
  LDI r5, 2
  LDI r0, 2033
  LDI r1, 2
  LDI r14, 3448
  CMP r2, r14
  JNZ r2, else_0
  DIV r3, r13, r2
  SHR r8, r5, r10
  SHL r4, r11, r10
  MOD r6, r14, r1
  JMP endif_1
else_0:
  LDI r0, 4
  LDI r12, 1088
  LDI r1, 2880
  WPIXEL
endif_1:
  CMP r0, r14
  JZ r0, else_2
  MOD r1, r12, r27
  MOD r11, r9, r13
  JMP endif_3
else_2:
  LDI r10, 0x649167
  LDI r6, 3495
  LDI r3, 0xB0E832
  PSET r10, r6, r3
  LDI r0, 255
  LDI r11, 0x3F803D
  LDI r12, 0
  LDI r4, 0x03C046
  LDI r1, 16
  RECTF r0, r11, r12, r4, r1
  LDI r10, 0
  FILL r10
endif_3:
  CMP r11, r4
  JNZ r11, else_4
  XOR r2, r0, r15
  JMP endif_5
else_4:
  LDI r3, 673
  LDI r12, 0xA84CE8
  LDI r6, 2321
  WPIXEL
  LDI r13, 0x787031
  FILL r13
  LDI r2, 0xD67E67
  FILL r2
endif_5:
  HALT
