; counted animation
; initialization
  LDI r8, 4
  LDI r11, 1857
  LDI r2, 0x659589
  LDI r4, 0
  LDI r8, 11
loop_0:
  MUL r31, r5, r3
  LDI r14, 0x76B361
  LDI r9, 8
  LDI r5, 0x440835
  LDI r0, 1459
  CIRCLE r14, r9, r5, r0
  LDI r13, 32
  FILL r13
  LDI r2, 1
  SUB r8, r8, r2
  JNZ r8, loop_0
  LDI r0, 49
loop_1:
  ADDI r9, r4, 255
  SUBI r11, r4, 5
  LDI r6, 1
  SUB r0, r0, r6
  JNZ r0, loop_1
  HALT
