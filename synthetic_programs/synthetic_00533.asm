; conditional logic
; initialization
  LDI r12, 64
  LDI r5, 1
  LDI r10, 2684
  CMP r6, r5
  JZ r6, else_0
  MUL r5, r8, r14
  JMP endif_1
else_0:
  LDI r9, 1
  LDI r11, 1575
  LDI r8, 0x6E3646
  PSETI
endif_1:
  HALT
