; counted animation
; initialization
  LDI r3, 0xFCC1F2
  LDI r14, 2399
  LDI r1, 16
  LDI r2, 9
loop_0:
  LDI r13, 10
  LDI r3, 3274
  LDI r3, 0x235F43
  PSETI
  LDI r7, 1
  SUB r2, r2, r7
  JNZ r2, loop_0
  HALT
