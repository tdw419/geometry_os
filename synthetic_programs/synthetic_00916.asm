; counted animation
; initialization
  LDI r20, 2
  LDI r9, 256
  LDI r9, 32
loop_0:
  CMPI r8, r3, 219
  ADDI r6, r5, 256
  LDI r7, 1
  SUB r9, r9, r7
  JNZ r9, loop_0
  LDI r8, 0x709C8E
loop_1:
  LDI r1, 3848
  LDI r7, 0x0865A5
  LDI r7, 1
  LDI r0, 137
  LDI r1, 1
  RECTF r1, r7, r7, r0, r1
  DIV r4, r11, r3
  ADDI r6, r12, 16
  LDI r12, 1
  SUB r8, r8, r12
  JNZ r8, loop_1
  HALT
