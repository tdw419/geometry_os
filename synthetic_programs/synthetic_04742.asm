; counted animation
; initialization
  LDI r5, 0x3D2F26
  LDI r2, 1531
  LDI r1, 0x4AEFF9
  LDI r10, 2262
  LDI r15, 3564
  LDI r10, 28
loop_0:
  LDI r1, 0x6CDCF7
  LDI r8, 255
  LDI r12, 0x225178
  LDI r5, 0xE6106A
  CIRCLE r1, r8, r12, r5
  LDI r8, 1
  SUB r10, r10, r8
  JNZ r10, loop_0
  LDI r1, 32
loop_1:
  LDI r9, 128
  LDI r5, 3083
  LDI r9, 8
  LDI r15, 8
  LDI r15, 10
  RECTF r9, r5, r9, r15, r15
  LDI r4, 0xE31634
  LDI r9, 372
  LDI r4, 2176
  LDI r8, 0xBA69A7
  LDI r14, 0x597421
  RECTF r4, r9, r4, r8, r14
  LDI r8, 0x0078CC
  FILL r8
  LDI r12, 1
  SUB r1, r1, r12
  JNZ r1, loop_1
  LDI r28, 32
loop_2:
  ADDI r14, r29, 8
  LDI r7, 256
  FILL r7
  LDI r5, 1
  SUB r28, r28, r5
  JNZ r28, loop_2
  HALT
