; counted animation
; initialization
  LDI r11, 0x84E429
  LDI r4, 1551
  LDI r15, 820
  LDI r14, 32
  LDI r13, 2
loop_0:
  AND r6, r5, r7
  ADDI r5, r12, 256
  LDI r4, 0x249DC6
  LDI r14, 3610
  LDI r9, 3165
  LDI r6, 32
  LDI r15, 424
  LINE r4, r14, r9, r6, r15
  MUL r8, r12, r14
  LDI r14, 1
  SUB r13, r13, r14
  JNZ r13, loop_0
  LDI r8, 18
loop_1:
  LDI r1, 0x4B56F1
  LDI r8, 2886
  LDI r1, 2471
  LDI r8, 0x7C1725
  LDI r9, 3260
  LINE r1, r8, r1, r8, r9
  AND r13, r0, r6
  SUBI r6, r14, 119
  LDI r9, 1
  SUB r8, r8, r9
  JNZ r8, loop_1
  HALT
