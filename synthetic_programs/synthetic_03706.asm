; mixed program
; initialization
  LDI r12, 558
  LDI r15, 16
  LDI r5, 613
  LDI r6, 16
  LDI r4, 0x761A6D
  LDI r0, 0xF0B671
; palette
  LDI r1, 0x80C5
  LDI r5, 1
  LDI r6, 0x00AAFF
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x00FF00
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x0000CC
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x00FFFF
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x00FF44
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x00FFFF
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x880088
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0xDD0044
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x888800
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x00FFFF
  STORE r1, r6
  ADD r1, r1, r5
  PUSH r4
  XOR r2, r6, r7
  MOD r8, r20, r11
  POP r4
  CMP r13, r2
  JZ r13, else_0
  XOR r15, r4, r1
  DIV r10, r6, r14
  MUL r2, r5, r9
  JMP endif_1
else_0:
  LDI r10, 4
  LDI r3, 0x02757D
  LDI r12, 0xDA1532
  LDI r0, 817
  LDI r15, 255
  LINE r10, r3, r12, r0, r15
  LDI r9, 0xCB41E0
  LDI r4, 166
  LDI r5, 2
  LDI r1, 0xC240A8
  CIRCLE r9, r4, r5, r1
  LDI r13, 0xD8DF64
  FILL r13
  LDI r31, 0xD498DE
  FILL r31
endif_1:
  LDI r10, 0x42423D
  FILL r10
  CALL func_2
func_2:
  ADD r8, r12, r9
  SHR r1, r11, r0
  XOR r11, r2, r4
  AND r9, r11, r12
  RET
  CMP r9, r13
  JZ r9, else_3
  ADD r2, r0, r11
  JMP endif_4
else_3:
  LDI r15, 3099
  LDI r8, 502
  LDI r19, 0xD45277
  WPIXEL
endif_4:
  LDI r7, 0
loop_5:
  CMPI r17, r0, 120
  SHR r7, r11, r0
  LDI r12, 1451
  LDI r0, 16
  LDI r7, 3617
  PSETI
  LDI r4, 1
  SUB r7, r7, r4
  JNZ r7, loop_5
  CALL func_6
func_6:
  DIV r9, r6, r7
  XOR r26, r8, r11
  MOD r11, r4, r12
  RET
  CMP r6, r12
  JZ r6, else_7
  AND r13, r2, r9
  ADD r0, r9, r8
  JMP endif_8
else_7:
  LDI r14, 3846
  FILL r14
  LDI r12, 3674
  LDI r8, 851
  LDI r12, 0x64C8FC
  LDI r13, 0x31B042
  LDI r8, 0x5B91A2
  RECTF r12, r8, r12, r13, r8
  LDI r5, 0xA773B0
  LDI r9, 0x101190
  LDI r2, 2393
  LDI r14, 1
  CIRCLE r5, r9, r2, r14
endif_8:
  HALT
