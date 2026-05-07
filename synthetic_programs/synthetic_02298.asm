; conditional logic
; initialization
  LDI r2, 16
  LDI r19, 3568
  LDI r8, 0xC0C159
  LDI r1, 32
  CMP r1, r8
  JZ r1, else_0
  XOR r14, r12, r4
  SUB r9, r11, r6
  MUL r7, r12, r9
  XOR r14, r2, r6
  JMP endif_1
else_0:
  LDI r2, 99
  LDI r8, 0x902729
  LDI r28, 2
  PSETI
  LDI r11, 2745
  LDI r8, 3470
  LDI r11, 3850
  LDI r9, 0x085736
  LDI r0, 0x9FE425
  LINE r11, r8, r11, r9, r0
endif_1:
  HALT
