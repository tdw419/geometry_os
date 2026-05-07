; counted animation
; initialization
  LDI r21, 2837
  LDI r4, 2370
  LDI r12, 4
  LDI r9, 0
loop_0:
  ADDI r9, r15, 0xB636BE
  LDI r4, 239
  LDI r3, 0x6FD86B
  LDI r28, 3393
  LDI r11, 0x0A8118
  LDI r26, 3154
  RECTF r4, r3, r28, r11, r26
  CMPI r12, r5, 156
  MOD r3, r2, r6
  LDI r13, 1
  SUB r9, r9, r13
  JNZ r9, loop_0
  LDI r7, 4
loop_1:
  CMPI r8, r0, 255
  LDI r5, 256
  LDI r7, 3165
  LDI r9, 10
  PSETI
  ANDI r14, r11, 0x8A1590
  SUBI r2, r10, 0x2D9F9E
  LDI r4, 1
  SUB r7, r7, r4
  JNZ r7, loop_1
  LDI r1, 2
loop_2:
  ADDI r5, r3, 32
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_2
  HALT
