; conditional logic
; initialization
  LDI r5, 0x56C2E5
  LDI r1, 10
  LDI r31, 255
  LDI r10, 3504
  LDI r4, 10
  LDI r7, 0xB00E90
  LDI r22, 1861
  CMP r3, r13
  JZ r3, else_0
  ADD r12, r3, r2
  SUB r11, r6, r14
  JMP endif_1
else_0:
  LDI r5, 256
  LDI r22, 0x69C54A
  LDI r2, 3316
  LDI r7, 0x6E5FF4
  LDI r7, 0
  RECTF r5, r22, r2, r7, r7
  LDI r21, 2791
  LDI r10, 8
  LDI r13, 8
  LDI r13, 1243
  LDI r0, 2388
  LINE r21, r10, r13, r13, r0
  LDI r13, 64
  LDI r8, 0x590A5E
  LDI r24, 256
  LDI r15, 64
  LDI r2, 128
  RECTF r13, r8, r24, r15, r2
  LDI r8, 0x9312E3
  LDI r10, 0x589827
  LDI r6, 214
  LDI r5, 0
  CIRCLE r8, r10, r6, r5
endif_1:
  CMP r4, r12
  JNZ r4, else_2
  MOD r13, r3, r14
  MOD r10, r2, r3
  DIV r11, r12, r8
  AND r1, r9, r0
  JMP endif_3
else_2:
  LDI r15, 0xABD01B
  LDI r3, 2189
  LDI r3, 32
  LDI r9, 32
  CIRCLE r15, r3, r3, r9
  LDI r8, 2698
  LDI r14, 2654
  LDI r14, 639
  PSET r8, r14, r14
endif_3:
  HALT
