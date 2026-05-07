; counted animation
; initialization
  LDI r15, 256
  LDI r9, 0x0F6198
  LDI r10, 0x565E7B
  LDI r14, 29
loop_0:
  DIV r10, r13, r7
  ANDI r8, r13, 32
  LDI r3, 1
  SUB r14, r14, r3
  JNZ r14, loop_0
  LDI r0, 2
loop_1:
  ADDI r7, r4, 0x3D12B7
  LDI r14, 1
  SUB r0, r0, r14
  JNZ r0, loop_1
  LDI r15, 40
loop_2:
  ADD r15, r4, r14
  LDI r7, 3044
  LDI r0, 0x69AF0E
  LDI r12, 0xCEB884
  LDI r14, 16
  LDI r4, 1
  RECTF r7, r0, r12, r14, r4
  LDI r1, 1
  SUB r15, r15, r1
  JNZ r15, loop_2
  HALT
