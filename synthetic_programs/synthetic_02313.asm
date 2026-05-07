; conditional logic
; initialization
  LDI r8, 4
  LDI r3, 0x5D6C12
  LDI r10, 916
  CMP r11, r4
  JNZ r11, else_0
  XOR r9, r15, r12
  ADD r3, r11, r14
  SHL r13, r15, r2
  DIV r2, r12, r24
  JMP endif_1
else_0:
  LDI r4, 2157
  LDI r13, 1019
  LDI r4, 2558
  LDI r9, 16
  LDI r11, 0xB4F28F
  LINE r4, r13, r4, r9, r11
  LDI r6, 256
  LDI r11, 1736
  LDI r13, 256
  PSETI
endif_1:
  HALT
