; counted animation
; initialization
  LDI r14, 3285
  LDI r8, 221
  LDI r9, 3874
  LDI r5, 0x1AFC74
  LDI r3, 0x3B2344
  LDI r6, 1
loop_0:
  OR r4, r1, r9
  LDI r2, 0x9C04B7
  FILL r2
  ADDI r7, r12, 0x9482FB
  LDI r3, 1888
  LDI r9, 64
  LDI r14, 0x3863BF
  PSETI
  LDI r9, 1
  SUB r6, r6, r9
  JNZ r6, loop_0
  LDI r5, 17
loop_1:
  ANDI r6, r9, 199
  LDI r14, 1
  SUB r5, r5, r14
  JNZ r5, loop_1
  LDI r10, 0x6D4BAA
loop_2:
  SUBI r14, r11, 0xFBAA8B
  OR r11, r9, r7
  LDI r15, 1
  SUB r10, r10, r15
  JNZ r10, loop_2
  HALT
