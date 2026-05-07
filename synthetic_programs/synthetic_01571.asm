; conditional logic
; initialization
  LDI r3, 1
  LDI r4, 0xEC4266
  LDI r13, 0x5C3EF1
  LDI r1, 128
  LDI r9, 265
  LDI r5, 255
  LDI r12, 16
  CMP r15, r2
  JNZ r15, else_0
  SUB r9, r11, r5
  MUL r5, r1, r13
  JMP endif_1
else_0:
  LDI r14, 0x72DA41
  LDI r13, 10
  LDI r1, 0
  LDI r14, 0xE2AA49
  LDI r12, 490
  LINE r14, r13, r1, r14, r12
  LDI r18, 3729
  LDI r7, 0xE0A931
  LDI r7, 16
  PSETI
endif_1:
  HALT
