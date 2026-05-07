; counted animation
; initialization
  LDI r12, 0x18747D
  LDI r24, 3414
  LDI r9, 4068
  LDI r22, 949
  LDI r10, 0x668818
  LDI r13, 0x7DBECC
  LDI r0, 0x8431E6
  LDI r5, 2365
  LDI r18, 0x4FA6B0
loop_0:
  ADDI r18, r8, 32
  LDI r14, 1
  SUB r18, r18, r14
  JNZ r18, loop_0
  LDI r15, 1
loop_1:
  ANDI r6, r8, 44
  SUBI r5, r6, 179
  LDI r13, 0xCE0F28
  LDI r6, 128
  LDI r2, 4049
  WPIXEL
  LDI r14, 1
  SUB r15, r15, r14
  JNZ r15, loop_1
  HALT
