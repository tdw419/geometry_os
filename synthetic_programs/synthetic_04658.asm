; counted animation
; initialization
  LDI r30, 0xC49426
  LDI r8, 444
  LDI r5, 1
  LDI r2, 1105
  LDI r3, 0x948514
  LDI r15, 318
  LDI r10, 0xED5756
  LDI r11, 2750
  LDI r13, 1
loop_0:
  LDI r5, 3961
  LDI r2, 2254
  LDI r15, 256
  LDI r12, 2124
  LDI r3, 0x6B0F6B
  RECTF r5, r2, r15, r12, r3
  LDI r15, 1
  SUB r13, r13, r15
  JNZ r13, loop_0
  LDI r6, 2
loop_1:
  ANDI r0, r11, 0x7B9A45
  ADDI r9, r11, 64
  ANDI r5, r15, 237
  LDI r14, 1
  SUB r6, r6, r14
  JNZ r6, loop_1
  LDI r13, 10
loop_2:
  LDI r5, 2828
  LDI r2, 25
  LDI r6, 752
  PSETI
  OR r0, r13, r12
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_2
  HALT
