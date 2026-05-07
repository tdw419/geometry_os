; counted animation
; initialization
  LDI r11, 255
  LDI r1, 0xAC0F77
  LDI r15, 4
  LDI r10, 32
  LDI r9, 1185
  LDI r12, 0x333D0F
  LDI r5, 50
loop_0:
  LDI r9, 2951
  LDI r6, 3609
  LDI r4, 0x9E9B01
  PSET r9, r6, r4
  LDI r5, 2334
  LDI r9, 32
  LDI r3, 16
  PSETI
  LDI r13, 1
  SUB r5, r5, r13
  JNZ r5, loop_0
  LDI r0, 7
loop_1:
  MUL r3, r5, r7
  LDI r3, 2569
  LDI r17, 0x5166CF
  LDI r14, 2181
  LDI r5, 0x5E1A4B
  LDI r1, 3053
  LINE r3, r17, r14, r5, r1
  ANDI r3, r9, 0x4742DE
  LDI r17, 1
  SUB r0, r0, r17
  JNZ r0, loop_1
  LDI r2, 16
loop_2:
  ADDI r12, r10, 64
  CMPI r8, r11, 0
  ANDI r13, r8, 23
  AND r14, r4, r8
  LDI r4, 1
  SUB r2, r2, r4
  JNZ r2, loop_2
  HALT
