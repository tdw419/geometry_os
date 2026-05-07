; counted animation
; initialization
  LDI r15, 128
  LDI r7, 4
  LDI r0, 10
  LDI r8, 0x64392A
  LDI r23, 800
  LDI r10, 1073
  LDI r12, 0x592D90
  LDI r2, 2
  LDI r4, 9
loop_0:
  SUBI r9, r13, 0xD39310
  AND r11, r12, r5
  LDI r11, 1
  SUB r4, r4, r11
  JNZ r4, loop_0
  LDI r17, 0x6FD125
loop_1:
  LDI r8, 0x3C9FCF
  LDI r12, 16
  LDI r11, 2428
  LDI r6, 2145
  LDI r30, 0xA4D527
  LINE r8, r12, r11, r6, r30
  LDI r4, 3181
  LDI r4, 256
  LDI r8, 128
  LDI r2, 0
  LDI r3, 1
  RECTF r4, r4, r8, r2, r3
  LDI r15, 1
  SUB r17, r17, r15
  JNZ r17, loop_1
  LDI r12, 2
loop_2:
  LDI r13, 64
  LDI r7, 0
  LDI r3, 0x8514DF
  PSETI
  CMPI r3, r0, 0x8401A2
  LDI r16, 1
  SUB r12, r12, r16
  JNZ r12, loop_2
  HALT
