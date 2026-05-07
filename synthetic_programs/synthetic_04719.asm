; counted animation
; initialization
  LDI r7, 0x8400C2
  LDI r5, 2836
  LDI r17, 32
  LDI r13, 5
loop_0:
  ADDI r0, r9, 51
  LDI r7, 1
  SUB r13, r13, r7
  JNZ r13, loop_0
  HALT
