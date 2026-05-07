; counted animation
; initialization
  LDI r12, 16
  LDI r27, 2817
  LDI r15, 32
  LDI r3, 64
  LDI r2, 19
loop_0:
  MOD r2, r15, r1
  LDI r2, 3802
  LDI r9, 0xB4D9C4
  LDI r6, 8
  PSETI
  LDI r14, 1
  SUB r2, r2, r14
  JNZ r2, loop_0
  LDI r14, 8
loop_1:
  ADD r10, r3, r15
  LDI r1, 1130
  LDI r2, 3459
  LDI r4, 0x661119
  LDI r1, 0xF21C82
  LDI r5, 2133
  RECTF r1, r2, r4, r1, r5
  LDI r1, 1
  SUB r14, r14, r1
  JNZ r14, loop_1
  HALT
