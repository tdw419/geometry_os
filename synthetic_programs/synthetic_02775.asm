; counted animation
; initialization
  LDI r5, 3610
  LDI r6, 2982
  LDI r14, 0
  LDI r9, 0x3AD210
  LDI r4, 16
  LDI r13, 256
  LDI r15, 2044
  LDI r14, 10
loop_0:
  SUBI r25, r0, 243
  LDI r12, 1
  SUB r14, r14, r12
  JNZ r14, loop_0
  LDI r1, 0xE2CC81
loop_1:
  AND r6, r4, r9
  DIV r5, r9, r14
  LDI r12, 1
  SUB r1, r1, r12
  JNZ r1, loop_1
  LDI r12, 12
loop_2:
  CMPI r13, r4, 0x8BBD27
  ADDI r8, r12, 107
  SUBI r1, r5, 4
  LDI r3, 0x715004
  LDI r11, 1091
  LDI r4, 4040
  LDI r10, 8
  LDI r13, 128
  RECTF r3, r11, r4, r10, r13
  LDI r10, 1
  SUB r12, r12, r10
  JNZ r12, loop_2
  HALT
