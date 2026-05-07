; mixed program
; initialization
  LDI r8, 2375
  LDI r5, 16
  CMPI r13, 0x4EE178
  CMP r9, r4
  JZ r9, else_0
  SHL r4, r12, r3
  ADD r11, r4, r5
  ADD r12, r7, r14
  ADD r13, r25, r15
  JMP endif_1
else_0:
  LDI r13, 10
  LDI r9, 4
  LDI r2, 0x73EAF1
  PSETI
  LDI r9, 32
  FILL r9
endif_1:
  PUSH r13
  PUSH r9
  PUSH r6
  SHL r3, r2, r4
  XOR r5, r7, r14
  ADD r3, r5, r4
  SHL r3, r5, r2
  POP r6
  POP r9
  POP r13
  CMP r3, r13
  JNZ r3, else_2
  OR r11, r13, r9
  SUB r5, r6, r10
  MUL r1, r0, r4
  DIV r4, r15, r3
  JMP endif_3
else_2:
  LDI r13, 4
  LDI r3, 1786
  LDI r17, 128
  PSETI
  LDI r8, 0
  LDI r11, 3525
  LDI r10, 1
  PSETI
  LDI r12, 10
  LDI r1, 0x1E1F04
  LDI r7, 0xC41137
  LDI r14, 256
  LDI r9, 1443
  RECTF r12, r1, r7, r14, r9
endif_3:
  LDI r13, 64
loop_4:
  ANDI r1, r12, 10
  XOR r9, r11, r8
  LDI r11, 0x3D8973
  LDI r4, 2975
  LDI r4, 2329
  LDI r15, 64
  LDI r12, 246
  LINE r11, r4, r4, r15, r12
  MOD r15, r2, r13
  LDI r3, 1
  SUB r13, r13, r3
  JNZ r13, loop_4
  HALT
