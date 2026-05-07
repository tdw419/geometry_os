; counted animation
; initialization
  LDI r14, 93
  LDI r13, 4
  LDI r6, 0xEF1ACB
  LDI r1, 1
  LDI r5, 216
  LDI r2, 128
  LDI r12, 16
  LDI r3, 0x3C0F32
loop_0:
  SUBI r4, r10, 250
  LDI r9, 1
  SUB r3, r3, r9
  JNZ r3, loop_0
  LDI r6, 8
loop_1:
  ANDI r6, r0, 93
  LDI r2, 1
  SUB r6, r6, r2
  JNZ r6, loop_1
  LDI r8, 1
loop_2:
  ADDI r7, r4, 0x8A0BEC
  LDI r7, 1
  SUB r8, r8, r7
  JNZ r8, loop_2
  HALT
