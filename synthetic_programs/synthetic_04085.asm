; counted animation
; initialization
  LDI r7, 128
  LDI r5, 0xF67498
  LDI r13, 0x71678F
  LDI r11, 0x459404
  LDI r15, 2
  LDI r3, 323
  LDI r14, 27
loop_0:
  LDI r6, 0x6A93D2
  FILL r6
  LDI r6, 1
  SUB r14, r14, r6
  JNZ r14, loop_0
  LDI r15, 25
loop_1:
  LDI r5, 1
  LDI r8, 4
  LDI r15, 1948
  PSET r5, r8, r15
  CMPI r1, r0, 32
  MUL r28, r8, r7
  LDI r9, 775
  FILL r9
  LDI r7, 1
  SUB r15, r15, r7
  JNZ r15, loop_1
  LDI r10, 1
loop_2:
  LDI r15, 64
  LDI r4, 0xD2D4A9
  LDI r6, 145
  LDI r5, 0x6CB9E7
  LDI r10, 0x996F5C
  LINE r15, r4, r6, r5, r10
  SUBI r12, r10, 0x3BE971
  ADDI r15, r2, 56
  LDI r8, 1
  SUB r10, r10, r8
  JNZ r10, loop_2
  HALT
