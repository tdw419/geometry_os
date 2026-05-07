; conditional logic
; initialization
  LDI r13, 256
  LDI r5, 1520
  LDI r0, 4
  LDI r11, 0xDFA2E2
  LDI r10, 3460
  LDI r12, 0x7007FA
  LDI r8, 3890
  CMP r7, r6
  JZ r7, else_0
  SHL r10, r5, r15
  MOD r14, r18, r9
  OR r5, r10, r3
  XOR r13, r7, r10
  JMP endif_1
else_0:
  LDI r13, 16
  LDI r13, 0x041039
  LDI r1, 256
  WPIXEL
endif_1:
  CMP r5, r3
  JZ r5, else_2
  ADD r10, r4, r8
  MUL r8, r6, r5
  JMP endif_3
else_2:
  LDI r1, 2081
  LDI r1, 275
  LDI r6, 0x999B2F
  LDI r2, 4
  CIRCLE r1, r1, r6, r2
  LDI r11, 3278
  LDI r31, 0xB11C7F
  LDI r8, 4
  LDI r12, 0xDFF54F
  CIRCLE r11, r31, r8, r12
  LDI r12, 2
  LDI r10, 256
  LDI r9, 128
  LDI r11, 1257
  CIRCLE r12, r10, r9, r11
  LDI r1, 0x2BC584
  LDI r11, 1781
  LDI r0, 10
  WPIXEL
endif_3:
  HALT
