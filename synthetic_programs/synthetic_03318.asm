; counted animation
; initialization
  LDI r8, 1664
  LDI r13, 190
  LDI r6, 16
  LDI r12, 2
  LDI r4, 0x11CB89
  LDI r8, 22
loop_0:
  MUL r7, r3, r13
  SHR r21, r15, r10
  ADDI r15, r7, 141
  SHL r2, r14, r5
  LDI r9, 1
  SUB r8, r8, r9
  JNZ r8, loop_0
  LDI r15, 0x9DCCB9
loop_1:
  SUBI r7, r11, 102
  ANDI r4, r5, 3
  LDI r11, 1
  SUB r15, r15, r11
  JNZ r15, loop_1
  LDI r14, 1
loop_2:
  LDI r9, 1999
  FILL r9
  LDI r9, 1
  SUB r14, r14, r9
  JNZ r14, loop_2
  HALT
