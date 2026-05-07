; counted animation
; initialization
  LDI r5, 2113
  LDI r23, 256
  LDI r8, 8
  LDI r14, 0x410975
  LDI r19, 3655
  LDI r7, 1754
  LDI r12, 1
  LDI r28, 718
  LDI r4, 255
loop_0:
  MUL r10, r15, r6
  LDI r4, 32
  LDI r9, 4
  LDI r3, 16
  PSET r4, r9, r3
  ADDI r4, r1, 0x72AD11
  LDI r0, 1
  SUB r4, r4, r0
  JNZ r4, loop_0
  LDI r6, 17
loop_1:
  MUL r0, r15, r7
  LDI r7, 0xBFB410
  LDI r15, 0x611791
  LDI r4, 8
  LDI r8, 785
  LDI r8, 8
  LINE r7, r15, r4, r8, r8
  LDI r11, 1
  SUB r6, r6, r11
  JNZ r6, loop_1
  LDI r11, 0
loop_2:
  LDI r2, 255
  LDI r7, 3264
  LDI r13, 64
  LDI r12, 0xB882C3
  LDI r5, 0x69F8FB
  RECTF r2, r7, r13, r12, r5
  SHL r0, r3, r2
  ADD r19, r3, r15
  LDI r1, 1
  SUB r11, r11, r1
  JNZ r11, loop_2
  HALT
