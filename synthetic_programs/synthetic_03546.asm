; mixed program
; initialization
  LDI r2, 256
  LDI r4, 0
  LDI r6, 2
  LDI r3, 128
  LDI r5, 1
; palette
  LDI r13, 0x7064
  LDI r9, 1
  LDI r6, 0x0000FF
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0x00FFFF
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0x000000
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0x550077
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0x444444
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0xAAAAAA
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0x000066
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0x0000CC
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0x444444
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0xAAFF00
  STORE r13, r6
  ADD r13, r13, r9
  LDI r6, 0xFF0000
  STORE r13, r6
  ADD r13, r13, r9
  CALL func_0
func_0:
  AND r1, r11, r0
  MUL r6, r14, r4
  XOR r7, r4, r0
  MUL r1, r4, r3
  DIV r2, r25, r0
  MUL r9, r8, r7
  RET
  LDI r9, 0x240F160
  STORE r9, r6
  LOAD r30, r9
  LDI r15, 1
  STORE r15, r11
  LOAD r12, r15
  LDI r3, 64
  STORE r3, r9
  LOAD r15, r3
  SAR r15, r0, r4
  SHL r2, r15, r8
  SHL r12, r3, r1
  SHL r10, r11, r0
  CALL func_1
func_1:
  MUL r11, r12, r3
  SHL r11, r7, r10
  RET
  CMP r13, r0
  JZ r13, else_2
  XOR r10, r28, r6
  MUL r17, r2, r9
  OR r12, r10, r29
  JMP endif_3
else_2:
  LDI r13, 10
  LDI r6, 2424
  LDI r13, 2328
  PSET r13, r6, r13
  LDI r7, 0
  LDI r10, 0xB510CF
  LDI r10, 255
  PSET r7, r10, r10
  LDI r2, 2090
  FILL r2
endif_3:
  HALT
