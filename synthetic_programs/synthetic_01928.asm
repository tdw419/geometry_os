; conditional logic
; initialization
  LDI r3, 0
  LDI r12, 32
  CMP r6, r9
  JZ r6, else_0
  SHL r15, r12, r3
  JMP endif_1
else_0:
  LDI r5, 32
  LDI r12, 16
  LDI r15, 330
  PSET r5, r12, r15
endif_1:
  HALT
