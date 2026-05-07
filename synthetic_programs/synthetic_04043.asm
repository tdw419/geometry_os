; mixed program
; initialization
  LDI r11, 2799
  LDI r4, 0xD433E7
  CMP r0, r10
  JZ r0, else_0
  XOR r14, r5, r4
  DIV r7, r5, r3
  JMP endif_1
else_0:
  LDI r2, 32
  LDI r1, 0x91A5A6
  LDI r4, 64
  LDI r11, 0x22D902
  LDI r3, 0x29D908
  LINE r2, r1, r4, r11, r3
  LDI r11, 3613
  LDI r15, 774
  LDI r11, 2840
  LDI r7, 2128
  LDI r4, 0xE0E6FE
  RECTF r11, r15, r11, r7, r4
endif_1:
  AND r3, r4, r9
  OR r2, r15, r5
  LDI r0, 2593
  STORE r0, r16
  LOAD r12, r0
  LDI r0, 3651
  STORE r0, r11
  LOAD r9, r0
  LDI r0, 16
  STORE r0, r12
  LOAD r3, r0
  LDI r21, 2281
  STORE r21, r2
  LOAD r22, r21
  PUSH r9
  ADD r6, r12, r1
  DIV r1, r15, r10
  MOD r13, r7, r15
  SHL r1, r7, r6
  AND r3, r4, r13
  POP r9
  LDI r8, 2241
  LDI r15, 3724
  LDI r0, 0xBE53F1
  LDI r29, 503
  LDI r9, 128
  LINE r8, r15, r0, r29, r9
  IKEY r13
  CMPI r13, 7
  JNZ r13, key_2
  SHR r9, r15, r8
  SHR r10, r0, r15
  SHLI r15, r12, 10
  LDI r11, 255
  LDI r12, 0xEE207B
  LDI r11, 0
  DRAWTEXT r11, r12, r11, "WORLD"
  HALT
