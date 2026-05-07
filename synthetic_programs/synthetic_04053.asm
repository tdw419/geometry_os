; counted animation
; initialization
  LDI r12, 3025
  LDI r2, 0x6C1B13
  LDI r5, 1872
  LDI r13, 2953
  LDI r0, 2680
  LDI r22, 2
loop_0:
  DIV r3, r5, r7
  XOR r12, r13, r7
  AND r15, r0, r5
  LDI r13, 0x0383C0
  FILL r13
  LDI r8, 1
  SUB r22, r22, r8
  JNZ r22, loop_0
  LDI r3, 46
loop_1:
  MOD r11, r9, r1
  LDI r3, 0x16DA2B
  LDI r4, 1
  LDI r2, 0
  LDI r4, 0xD99858
  LDI r4, 1369
  RECTF r3, r4, r2, r4, r4
  SHL r3, r12, r15
  SUB r5, r4, r11
  LDI r9, 1
  SUB r3, r3, r9
  JNZ r3, loop_1
  LDI r11, 0x12746B
loop_2:
  ANDI r7, r4, 0x16E96B
  AND r12, r14, r10
  LDI r21, 1
  SUB r11, r11, r21
  JNZ r11, loop_2
  HALT
