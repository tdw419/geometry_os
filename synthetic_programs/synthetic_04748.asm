; counted animation
; initialization
  LDI r13, 3623
  LDI r8, 833
  LDI r5, 64
  LDI r1, 64
loop_0:
  ADD r11, r6, r12
  LDI r9, 1
  SUB r1, r1, r9
  JNZ r1, loop_0
  LDI r10, 4
loop_1:
  LDI r12, 3906
  LDI r12, 64
  LDI r14, 1686
  LDI r12, 2969
  LDI r0, 0x7B693E
  RECTF r12, r12, r14, r12, r0
  ADD r7, r2, r12
  CMPI r11, r5, 2
  LDI r4, 1
  SUB r10, r10, r4
  JNZ r10, loop_1
  HALT
