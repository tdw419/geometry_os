; mixed program
; initialization
  LDI r7, 4
  LDI r4, 0x783BB1
  LDI r11, 0x99ED7E
  LDI r15, 1
  LDI r0, 3285
  LDI r2, 2026
  LDI r13, 0x9E0F94
  LDI r5, 2
; palette
  LDI r4, 0x401E
  LDI r7, 1
  LDI r0, 0x000000
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x0000FF
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x00FFFF
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0xFFFFFF
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x44FF00
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0xFFEE00
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x880088
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0xFF4400
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0xAA00AA
  STORE r4, r0
  ADD r4, r4, r7
  IKEY r20
  CMPI r20, 117
  JNZ r20, key_0
  CMP r13, r8
  JZ r13, else_1
  SHR r3, r13, r10
  SUB r14, r0, r10
  JMP endif_2
else_1:
  LDI r0, 0x3500C7
  LDI r1, 16
  LDI r23, 2008
  LDI r5, 0xAD83BA
  CIRCLE r0, r1, r23, r5
  LDI r9, 128
  LDI r0, 128
  LDI r6, 0xFAD3BB
  LDI r4, 64
  CIRCLE r9, r0, r6, r4
  LDI r3, 1504
  LDI r1, 2150
  LDI r22, 4
  PSETI
  LDI r4, 1
  LDI r10, 0
  LDI r14, 3538
  PSET r4, r10, r14
endif_2:
  LDI r12, 0x9EF357
  STORE r12, r21
  LOAD r7, r12
  LDI r0x30F00, 0x0x30F05230x30F0C
  STORE r10, r25
  LOAD r4, r10
  CALL func_3
func_3:
  SHR r7, r4, r6
  SUB r13, r5, r1
  ADD r15, r7, r20
  RET
  CMP r13, r12
  JZ r13, else_4
  DIV r14, r7, r15
  MUL r1, r10, r6
  MUL r8, r0, r7
  JMP endif_5
else_4:
  LDI r0, 10
  LDI r5, 0x1EF3AD
  LDI r13, 413
  PSET r0, r5, r13
  LDI r11, 0xE66C80
  LDI r3, 330
  LDI r6, 350
  LDI r0, 1
  LDI r3, 2612
  RECTF r11, r3, r6, r0, r3
endif_5:
  PUSH r14
  ADD r5, r10, r7
  MOD r7, r9, r5
  ADD r11, r10, r3
  MUL r8, r13, r2
  SHR r10, r11, r0
  POP r14
  CMP r10, r4
  XOR r5, r9, r11
  AND r11, r1, r6
  HALT
