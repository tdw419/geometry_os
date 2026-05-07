; mixed program
; initialization
  LDI r7, 3669
  LDI r5, 0xF21E97
  LDI r12, 10
  LDI r14, 0x04CA30
  LDI r0, 0xF9DA76
  LDI r29, 128
  CMP r4, r8
  JZ r4, else_0
  ADD r5, r15, r30
  OR r13, r3, r25
  AND r1, r13, r15
  XOR r9, r2, r11
  JMP endif_1
else_0:
  LDI r12, 0x76B89D
  LDI r4, 10
  LDI r1, 3390
  LDI r0, 32
  LDI r2, 367
  RECTF r12, r4, r1, r0, r2
  LDI r14, 3943
  LDI r14, 187
  LDI r10, 2051
  PSETI
  LDI r13, 0x9F9B18
  LDI r14, 2877
  LDI r2, 10
  PSET r13, r14, r2
endif_1:
  LDI r4, 256
  LDI r6, 1515
  LDI r13, 3648
  DRAWTEXT r4, r6, r13, "WORLD"
  MOD r0, r5, r27
  LDI r12, 1343
  LDI r12, 2
  LDI r6, 0x3EDF62
  TEXT r12, r12, r6, "HELLO"
  PUSH r15
  ADD r11, r5, r15
  SHL r5, r1, r10
  AND r7, r0, r14
  POP r15
  IKEY r0
  CMPI r0, 220
  JNZ r0, key_2
  HALT
