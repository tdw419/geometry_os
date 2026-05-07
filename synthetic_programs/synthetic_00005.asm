; counted animation
; initialization
  LDI r6, 1516
  LDI r15, 0x90E534
  LDI r22, 0xB8C567
  LDI r0, 0
  LDI r4, 6
loop_0:
  AND r10, r1, r15
  LDI r2, 1
  SUB r4, r4, r2
  JNZ r4, loop_0
  HALT
