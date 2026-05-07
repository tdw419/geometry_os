; conditional logic
; initialization
  LDI r1, 8
  LDI r4, 128
  LDI r11, 0xF01E06
  LDI r15, 0xD33AAE
  LDI r25, 0x99D425
  LDI r3, 0x753C51
  LDI r5, 10
  CMP r11, r9
  JZ r11, else_0
  MUL r12, r4, r3
  XOR r4, r15, r13
  JMP endif_1
else_0:
  LDI r6, 0xA673EA
  LDI r1, 0
  LDI r1, 1934
  LDI r21, 4
  LDI r3, 50
  LINE r6, r1, r1, r21, r3
endif_1:
  HALT
