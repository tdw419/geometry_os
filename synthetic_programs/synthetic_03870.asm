; counted animation
; initialization
  LDI r18, 0
  LDI r15, 0
  LDI r2, 0xF88265
  LDI r6, 0xA9602E
  LDI r2, 0xFF6377
loop_0:
  SUBI r14, r27, 192
  LDI r9, 1
  SUB r2, r2, r9
  JNZ r2, loop_0
  LDI r8, 17
loop_1:
  LDI r14, 1542
  LDI r9, 10
  LDI r10, 0x2CB712
  PSETI
  LDI r2, 0x11FBCF
  LDI r14, 2442
  LDI r12, 2714
  LDI r15, 0
  CIRCLE r2, r14, r12, r15
  LDI r15, 1
  SUB r8, r8, r15
  JNZ r8, loop_1
  LDI r13, 1
loop_2:
  ADDI r8, r27, 0x7509A1
  CMPI r11, r1, 255
  LDI r8, 2833
  LDI r10, 2802
  LDI r8, 2049
  PSETI
  LDI r5, 1
  SUB r13, r13, r5
  JNZ r13, loop_2
  HALT
