; counted animation
; initialization
  LDI r14, 0x599C8D
  LDI r13, 1268
  LDI r3, 2
loop_0:
  CMPI r9, r8, 0
  AND r12, r13, r5
  LDI r10, 0xBE8606
  LDI r2, 0
  LDI r9, 3932
  PSETI
  LDI r12, 1
  SUB r3, r3, r12
  JNZ r3, loop_0
  LDI r1, 0x5D5B6F
loop_1:
  AND r1, r15, r0
  LDI r9, 2147
  LDI r12, 4001
  LDI r14, 3467
  LDI r5, 0xC08F2B
  LDI r13, 0x276091
  RECTF r9, r12, r14, r5, r13
  LDI r12, 128
  LDI r6, 32
  LDI r3, 64
  WPIXEL
  LDI r12, 1
  SUB r1, r1, r12
  JNZ r1, loop_1
  HALT
