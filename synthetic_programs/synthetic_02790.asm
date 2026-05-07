; counted animation
; initialization
  LDI r13, 128
  LDI r4, 0xE91778
  LDI r3, 0
  LDI r12, 2314
  LDI r8, 0
  LDI r2, 3140
  LDI r1, 1712
  LDI r14, 0xCAE6B9
loop_0:
  SUBI r4, r8, 0x280CCF
  SUBI r15, r13, 112
  LDI r2, 1
  SUB r14, r14, r2
  JNZ r14, loop_0
  LDI r1, 47
loop_1:
  AND r9, r23, r11
  LDI r7, 1
  SUB r1, r1, r7
  JNZ r1, loop_1
  LDI r24, 0x1D0ADB
loop_2:
  LDI r8, 1015
  LDI r14, 0x7BEDDB
  LDI r2, 0x9DD1EB
  PSET r8, r14, r2
  LDI r7, 1
  SUB r24, r24, r7
  JNZ r24, loop_2
  HALT
