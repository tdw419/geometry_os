; conditional logic
; initialization
  LDI r4, 16
  LDI r18, 815
  CMP r6, r4
  JZ r6, else_0
  MUL r15, r5, r14
  JMP endif_1
else_0:
  LDI r7, 0x566A09
  LDI r5, 16
  LDI r15, 107
  LDI r9, 0
  CIRCLE r7, r5, r15, r9
  LDI r9, 0xCFC45A
  LDI r28, 1967
  LDI r6, 1
  PSET r9, r28, r6
  LDI r3, 0x8B99DF
  LDI r22, 0x8CF7F4
  LDI r12, 255
  LDI r13, 0x1B9C63
  LDI r10, 0x588677
  LINE r3, r22, r12, r13, r10
endif_1:
  HALT
