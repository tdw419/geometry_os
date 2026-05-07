; counted animation
; initialization
  LDI r15, 3843
  LDI r13, 3943
  LDI r0, 1674
  LDI r5, 2
  LDI r14, 2
loop_0:
  MUL r7, r13, r9
  LDI r3, 2696
  LDI r6, 0x606E0D
  LDI r12, 0x09ADD8
  LDI r0, 10
  LDI r6, 340
  RECTF r3, r6, r12, r0, r6
  LDI r3, 1346
  LDI r7, 0x07C2FE
  LDI r10, 8
  WPIXEL
  OR r14, r7, r3
  LDI r9, 1
  SUB r14, r14, r9
  JNZ r14, loop_0
  LDI r4, 1
loop_1:
  DIV r13, r6, r8
  LDI r25, 10
  LDI r2, 0x6859E0
  LDI r11, 0xED9203
  LDI r7, 10
  LDI r11, 255
  RECTF r25, r2, r11, r7, r11
  LDI r3, 3866
  LDI r7, 1
  LDI r6, 255
  PSET r3, r7, r6
  LDI r12, 0x0574D9
  LDI r9, 822
  LDI r6, 10
  PSET r12, r9, r6
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_1
  LDI r0, 1
loop_2:
  ANDI r7, r8, 64
  SUBI r4, r13, 34
  SHR r2, r8, r3
  LDI r8, 1
  SUB r0, r0, r8
  JNZ r0, loop_2
  HALT
