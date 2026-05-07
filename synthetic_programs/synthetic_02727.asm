; conditional logic
; initialization
  LDI r17, 3500
  LDI r11, 16
  LDI r9, 0
  CMP r0, r3
  JZ r0, else_0
  MUL r2, r25, r0
  MOD r15, r4, r14
  OR r7, r11, r4
  JMP endif_1
else_0:
  LDI r0, 0x7E1972
  LDI r9, 8
  LDI r3, 3299
  LDI r9, 1994
  CIRCLE r0, r9, r3, r9
endif_1:
  HALT
