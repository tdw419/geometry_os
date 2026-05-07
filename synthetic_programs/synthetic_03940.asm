; counted animation
; initialization
  LDI r2, 0x29F5FF
  LDI r14, 10
  LDI r0, 2373
  LDI r7, 28
loop_0:
  LDI r15, 745
  LDI r7, 0xDA8FAB
  LDI r6, 3962
  PSET r15, r7, r6
  SHR r10, r14, r5
  ADDI r2, r5, 0x6FB205
  ANDI r24, r3, 1
  LDI r10, 1
  SUB r7, r7, r10
  JNZ r7, loop_0
  HALT
