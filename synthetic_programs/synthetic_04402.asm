; conditional logic
; initialization
  LDI r10, 879
  LDI r0, 957
  LDI r29, 351
  LDI r11, 1205
  LDI r12, 497
  CMP r8, r14
  JNZ r8, else_0
  XOR r8, r1, r2
  ADD r15, r20, r1
  JMP endif_1
else_0:
  LDI r12, 0
  FILL r12
  LDI r9, 0x54BEDA
  LDI r18, 0x223697
  LDI r13, 2786
  PSET r9, r18, r13
  LDI r13, 0x0F2F39
  LDI r1, 0x710588
  LDI r3, 1
  LDI r10, 16
  LDI r2, 1
  LINE r13, r1, r3, r10, r2
  LDI r14, 10
  LDI r13, 1545
  LDI r12, 583
  PSET r14, r13, r12
endif_1:
  HALT
