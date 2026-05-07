; counted animation
; initialization
  LDI r0, 588
  LDI r7, 0xC1E13A
  LDI r5, 155
  LDI r6, 43
loop_0:
  SUBI r15, r8, 1
  LDI r3, 1
  SUB r6, r6, r3
  JNZ r6, loop_0
  LDI r8, 41
loop_1:
  ADDI r22, r15, 8
  CMPI r3, r14, 0xB5E1A8
  LDI r5, 1
  SUB r8, r8, r5
  JNZ r8, loop_1
  LDI r5, 0xFE5288
loop_2:
  SUBI r7, r1, 0x057045
  SUB r3, r12, r11
  LDI r7, 0
  LDI r3, 0x90521F
  LDI r25, 10
  PSET r7, r3, r25
  LDI r11, 1
  SUB r5, r5, r11
  JNZ r5, loop_2
  HALT
