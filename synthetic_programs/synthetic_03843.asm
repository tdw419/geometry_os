; counted animation
; initialization
  LDI r1, 0xD36843
  LDI r9, 0x1CBF91
  LDI r4, 881
  LDI r8, 1172
  LDI r6, 2284
  LDI r29, 13
loop_0:
  SUBI r1, r5, 32
  XOR r1, r5, r7
  LDI r5, 10
  LDI r3, 255
  LDI r3, 0x28A600
  PSETI
  ANDI r12, r5, 167
  LDI r9, 1
  SUB r29, r29, r9
  JNZ r29, loop_0
  LDI r9, 22
loop_1:
  CMPI r9, r14, 256
  CMPI r4, r1, 120
  ADDI r11, r5, 199
  CMPI r1, r12, 32
  LDI r3, 1
  SUB r9, r9, r3
  JNZ r9, loop_1
  LDI r12, 0x23D37B
loop_2:
  DIV r4, r5, r13
  LDI r13, 1
  SUB r12, r12, r13
  JNZ r12, loop_2
  HALT
