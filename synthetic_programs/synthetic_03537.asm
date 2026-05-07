; counted animation
; initialization
  LDI r9, 0x7DD0EA
  LDI r14, 0x5322DC
  LDI r8, 0xA86823
loop_0:
  SHR r9, r4, r10
  LDI r0, 0x7B7A38
  LDI r11, 454
  LDI r3, 3132
  PSET r0, r11, r3
  ADD r13, r5, r27
  LDI r13, 0
  FILL r13
  LDI r9, 1
  SUB r8, r8, r9
  JNZ r8, loop_0
  LDI r0, 32
loop_1:
  SUBI r11, r19, 0x86AFE0
  LDI r12, 1
  SUB r0, r0, r12
  JNZ r0, loop_1
  LDI r7, 2
loop_2:
  ANDI r5, r2, 15
  LDI r4, 769
  LDI r13, 0xA5776D
  LDI r1, 3239
  LDI r13, 3099
  LDI r26, 0xFADF39
  LINE r4, r13, r1, r13, r26
  ADDI r7, r15, 64
  LDI r5, 1
  SUB r7, r7, r5
  JNZ r7, loop_2
  HALT
