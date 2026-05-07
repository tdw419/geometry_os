; counted animation
; initialization
  LDI r7, 3783
  LDI r12, 0x97195F
  LDI r1, 1
loop_0:
  ADDI r8, r2, 32
  ADDI r9, r5, 32
  LDI r7, 1
  SUB r1, r1, r7
  JNZ r1, loop_0
  LDI r3, 33
loop_1:
  LDI r7, 3023
  LDI r9, 0xB40496
  LDI r7, 255
  LDI r4, 10
  CIRCLE r7, r9, r7, r4
  SHL r2, r3, r11
  LDI r13, 1
  SUB r3, r3, r13
  JNZ r3, loop_1
  LDI r0, 0
loop_2:
  LDI r2, 0x573365
  LDI r15, 0x61161A
  LDI r9, 4
  LDI r15, 0
  CIRCLE r2, r15, r9, r15
  LDI r11, 1
  SUB r0, r0, r11
  JNZ r0, loop_2
  HALT
