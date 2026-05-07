; mixed program
; initialization
  LDI r9, 1856
  LDI r5, 2459
  LDI r12, 1422
  LDI r15, 0x442177
  LDI r25, 1555
  LDI r4, 0xEF775A
  LDI r14, 0xEC5093
  SAR r2, r10, r4
  SAR r11, r15, r0
  SHL r14, r3, r13
  PUSH r13
  PUSH r9
  PUSH r12
  PUSH r10
  DIV r11, r13, r2
  MOD r6, r14, r10
  SHR r6, r4, r8
  ADD r28, r14, r12
  POP r10
  POP r12
  POP r9
  POP r13
  LDI r15, 0
  LDI r9, 3011
  LDI r1, 0xA6DE88
  LDI r5, 141
  CIRCLE r15, r9, r1, r5
  LDI r4, 701
  STORE r4, r14
  LOAD r6, r4
  LDI r15, 32
  STORE r15, r0
  LOAD r2, r15
  LDI r9, 2816
  STORE r9, r4
  LOAD r26, r9
  CMP r5, r14
  JNZ r5, else_0
  SUB r15, r6, r14
  JMP endif_1
else_0:
  LDI r9, 2180
  LDI r9, 1837
  LDI r9, 0xCB4938
  WPIXEL
  LDI r6, 0xF5C1AC
  LDI r3, 0x4911DA
  LDI r1, 625
  LDI r2, 0xC71C40
  LDI r14, 987
  LINE r6, r3, r1, r2, r14
  LDI r11, 2
  LDI r8, 0x974472
  LDI r24, 55
  LDI r22, 0xBDEFDE
  CIRCLE r11, r8, r24, r22
  LDI r9, 16
  FILL r9
endif_1:
  LDI r11, 0x0C5D22
  LDI r2, 0xD39DD4
  LDI r2, 255
  LDI r13, 2217
  LDI r15, 4
  RECTF r11, r2, r2, r13, r15
  CMP r18, r11
  HALT
