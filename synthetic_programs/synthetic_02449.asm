; counted animation
; initialization
  LDI r3, 1750
  LDI r12, 0x5E3BD4
  LDI r9, 2413
  LDI r13, 255
  LDI r12, 39
loop_0:
  LDI r14, 0xECF63A
  LDI r10, 10
  LDI r8, 1330
  LDI r4, 64
  LDI r8, 2507
  RECTF r14, r10, r8, r4, r8
  LDI r13, 1
  SUB r12, r12, r13
  JNZ r12, loop_0
  LDI r11, 0x153BC8
loop_1:
  ANDI r0, r8, 245
  MUL r0, r7, r13
  MOD r20, r11, r15
  LDI r4, 1176
  LDI r4, 32
  LDI r12, 746
  PSET r4, r4, r12
  LDI r2, 1
  SUB r11, r11, r2
  JNZ r11, loop_1
  HALT
