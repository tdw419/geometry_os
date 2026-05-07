; counted animation
; initialization
  LDI r11, 1659
  LDI r7, 0
  LDI r12, 256
  LDI r7, 31
loop_0:
  XOR r0, r3, r4
  CMPI r8, r15, 0x061626
  DIV r5, r12, r7
  MOD r9, r6, r7
  LDI r8, 1
  SUB r7, r7, r8
  JNZ r7, loop_0
  LDI r15, 43
loop_1:
  SUBI r7, r13, 85
  ADD r14, r3, r2
  SUB r13, r15, r11
  LDI r5, 1
  SUB r15, r15, r5
  JNZ r15, loop_1
  HALT
