; conditional logic
; initialization
  LDI r12, 0
  LDI r13, 0x76850D
  LDI r4, 32
  LDI r1, 0xF83036
  CMP r13, r2
  JZ r13, else_0
  DIV r5, r15, r10
  DIV r9, r14, r0
  JMP endif_1
else_0:
  LDI r4, 0xC33694
  LDI r11, 32
  LDI r1, 0x9EC751
  WPIXEL
  LDI r5, 32
  FILL r5
endif_1:
  HALT
