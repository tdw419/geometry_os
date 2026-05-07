; mixed program
; initialization
  LDI r8, 10
  LDI r11, 1
  LDI r22, 64
; palette
  LDI r4, 0x2065
  LDI r9, 1
  LDI r30, 0x0000FF
  STORE r4, r30
  ADD r4, r4, r9
  LDI r30, 0x44FF00
  STORE r4, r30
  ADD r4, r4, r9
  LDI r30, 0xFFFFFF
  STORE r4, r30
  ADD r4, r4, r9
  LDI r30, 0x880088
  STORE r4, r30
  ADD r4, r4, r9
  AND r6, r5, r2
  CMPI r10, 128
  CMP r14, r4
  JNZ r14, else_0
  SHR r0, r15, r1
  MOD r4, r7, r11
  MOD r22, r3, r11
  OR r6, r13, r14
  JMP endif_1
else_0:
  LDI r14, 2103
  LDI r1, 256
  LDI r4, 0
  PSETI
  LDI r11, 0x922D9F
  LDI r13, 379
  LDI r11, 1974
  LDI r11, 1
  LDI r0, 1
  RECTF r11, r13, r11, r11, r0
endif_1:
  PUSH r12
  PUSH r3
  PUSH r11
  DIV r14, r11, r16
  SUB r13, r15, r2
  POP r11
  POP r3
  POP r12
  OR r9, r13, r15
  XOR r8, r12, r3
  AND r13, r6, r2
  AND r13, r10, r4
  LDI r2, 128
  LDI r4, 0xED2498
  LDI r7, 10
  DRAWTEXT r2, r4, r7, "WORLD"
  HALT
