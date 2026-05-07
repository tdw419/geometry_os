; counted animation
; initialization
  LDI r15, 1559
  LDI r4, 2800
  LDI r1, 0xE3F157
  LDI r5, 948
  LDI r12, 2407
  LDI r7, 1565
  LDI r2, 4
  LDI r4, 128
loop_0:
  CMPI r13, r9, 236
  LDI r9, 2071
  LDI r2, 0x59E306
  LDI r1, 128
  PSET r9, r2, r1
  SUBI r2, r7, 10
  DIV r3, r10, r11
  LDI r1, 1
  SUB r4, r4, r1
  JNZ r4, loop_0
  LDI r1, 255
loop_1:
  XOR r0, r1, r9
  SUBI r0, r14, 24
  CMPI r14, r15, 0x8CBF62
  SHR r14, r13, r8
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_1
  LDI r14, 32
loop_2:
  XOR r15, r10, r12
  SHR r0, r24, r15
  LDI r15, 1
  LDI r11, 3099
  LDI r15, 6
  LDI r11, 3720
  CIRCLE r15, r11, r15, r11
  LDI r5, 2
  LDI r11, 1
  LDI r5, 0xABEF40
  WPIXEL
  LDI r3, 1
  SUB r14, r14, r3
  JNZ r14, loop_2
  HALT
