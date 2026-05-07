; mixed program
; initialization
  LDI r0, 0x0E62EC
  LDI r5, 128
  LDI r13, 0xBC99B7
  LDI r11, 0xB1D6E0
  LDI r6, 0xD55BED
  LDI r9, 2791
  LDI r3, 128
  PUSH r6
  MUL r14, r11, r7
  AND r14, r25, r7
  MOD r12, r3, r2
  POP r6
  SHR r2, r7, r9
  SAR r5, r3, r13
  SHLI r6, r13, 16
  CMP r6, r12
  JZ r6, else_0
  DIV r11, r3, r12
  SHL r2, r0, r15
  SHL r12, r3, r6
  JMP endif_1
else_0:
  LDI r11, 10
  LDI r10, 0xE48609
  LDI r6, 0x1D998F
  PSETI
  LDI r14, 2
  FILL r14
endif_1:
  LDI r9, 738
  STORE r9, r1
  LOAD r13, r9
  LDI r3, 0x7CEAA5
  STORE r3, r12
  LOAD r1, r3
  LDI r10, 53
  STORE r10, r3
  LOAD r4, r10
  SAR r13, r5, r3
  SHLI r14, r0, 0x049977
  SHR r2, r7, r9
  SAR r6, r5, r9
  HALT
