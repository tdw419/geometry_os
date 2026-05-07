; counted animation
; initialization
  LDI r10, 0xEAC3A8
  LDI r4, 1
  LDI r17, 0
  LDI r1, 2001
  LDI r9, 1097
  LDI r5, 0x29A9F0
  LDI r2, 2
  LDI r8, 87
  LDI r7, 128
loop_0:
  LDI r7, 0xA23992
  FILL r7
  MOD r6, r13, r1
  LDI r4, 1
  SUB r7, r7, r4
  JNZ r7, loop_0
  LDI r14, 0x92F15D
loop_1:
  LDI r3, 162
  LDI r3, 2172
  LDI r2, 64
  LDI r20, 128
  LDI r2, 4
  LINE r3, r3, r2, r20, r2
  LDI r3, 1
  SUB r14, r14, r3
  JNZ r14, loop_1
  HALT
