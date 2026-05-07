; conditional logic
; initialization
  LDI r13, 885
  LDI r10, 2657
  CMP r28, r7
  JZ r28, else_0
  MUL r6, r15, r5
  SUB r8, r3, r9
  JMP endif_1
else_0:
  LDI r10, 711
  LDI r7, 0x556F64
  LDI r0, 1251
  LDI r10, 0x5B7B38
  LDI r30, 1161
  LINE r10, r7, r0, r10, r30
  LDI r11, 64
  LDI r3, 2453
  LDI r4, 1144
  PSET r11, r3, r4
  LDI r5, 3928
  LDI r3, 10
  LDI r4, 256
  LDI r1, 64
  CIRCLE r5, r3, r4, r1
  LDI r13, 256
  LDI r10, 1135
  LDI r13, 372
  PSETI
endif_1:
  HALT
