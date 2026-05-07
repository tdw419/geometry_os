; counted animation
; initialization
  LDI r6, 2280
  LDI r14, 0x4FF76B
  LDI r1, 0x276308
  LDI r4, 0x5B95CC
  LDI r2, 255
  LDI r15, 4
  LDI r26, 0x00312C
loop_0:
  SUBI r0, r15, 81
  LDI r10, 3454
  LDI r8, 64
  LDI r7, 128
  LDI r5, 0x47177F
  LDI r12, 4
  RECTF r10, r8, r7, r5, r12
  CMPI r10, r5, 0x1364E6
  LDI r14, 1
  SUB r26, r26, r14
  JNZ r26, loop_0
  LDI r9, 17
loop_1:
  ADDI r12, r13, 0x5CE81D
  LDI r1, 1
  SUB r9, r9, r1
  JNZ r9, loop_1
  LDI r28, 41
loop_2:
  LDI r12, 64
  LDI r12, 675
  LDI r1, 0x027247
  LDI r4, 1422
  LDI r9, 32
  LINE r12, r12, r1, r4, r9
  ADDI r8, r4, 0x3D59FC
  SUBI r14, r3, 33
  ADD r14, r17, r3
  LDI r10, 1
  SUB r28, r28, r10
  JNZ r28, loop_2
  HALT
