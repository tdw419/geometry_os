; mixed program
; initialization
  LDI r15, 64
  LDI r3, 0x481835
  LDI r7, 8
; palette
  LDI r5, 0x245F
  LDI r14, 1
  LDI r2, 0xFFFFFF
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0xAAFF00
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x00FFFF
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x0044FF
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x0000FF
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x888800
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x0000FF
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x44FF00
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0xFFAA00
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x00AAFF
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x0044FF
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x44FF00
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0xFF0000
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x550077
  STORE r5, r2
  ADD r5, r5, r14
  LDI r2, 0x0044FF
  STORE r5, r2
  ADD r5, r5, r14
  CMP r30, r12
  JZ r30, else_0
  MOD r9, r15, r30
  MUL r0, r30, r9
  SHR r0, r8, r9
  SUB r11, r9, r13
  JMP endif_1
else_0:
  LDI r5, 4033
  LDI r4, 3932
  LDI r25, 64
  PSET r5, r4, r25
endif_1:
  OR r9, r0, r15
  CMP r1, r5
  JZ r1, else_2
  OR r2, r11, r8
  DIV r1, r3, r8
  ADD r6, r0, r7
  JMP endif_3
else_2:
  LDI r14, 510
  LDI r1, 4054
  LDI r13, 2895
  LDI r3, 0x85B69E
  CIRCLE r14, r1, r13, r3
  LDI r6, 504
  LDI r14, 10
  LDI r11, 0
  PSETI
endif_3:
  SHL r7, r15, r1
  HALT
