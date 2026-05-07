; counted animation
; initialization
  LDI r12, 1
  LDI r8, 0x147C2B
  LDI r3, 0xF1FFF8
  LDI r7, 1379
  LDI r9, 0x7ADA8C
  LDI r2, 64
loop_0:
  SUBI r13, r1, 10
  LDI r9, 1
  SUB r2, r2, r9
  JNZ r2, loop_0
  LDI r13, 0x6E501B
loop_1:
  LDI r0, 0xEF14DE
  LDI r14, 10
  LDI r9, 4
  WPIXEL
  ADDI r9, r10, 128
  LDI r9, 1
  SUB r13, r13, r9
  JNZ r13, loop_1
  HALT
