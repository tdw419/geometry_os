; counted animation
; initialization
  LDI r3, 0xB56D2A
  LDI r1, 117
  LDI r9, 0x433B24
  LDI r15, 0xBCF92D
loop_0:
  CMPI r5, r11, 13
  LDI r7, 1
  SUB r15, r15, r7
  JNZ r15, loop_0
  LDI r3, 30
loop_1:
  LDI r7, 0xAC2141
  LDI r5, 255
  LDI r15, 0
  LDI r23, 255
  LDI r9, 0x3952C6
  LINE r7, r5, r15, r23, r9
  LDI r14, 1
  SUB r3, r3, r14
  JNZ r3, loop_1
  LDI r4, 8
loop_2:
  DIV r8, r12, r9
  ADDI r14, r5, 114
  LDI r11, 4
  LDI r24, 3483
  LDI r23, 338
  LDI r29, 255
  LDI r13, 2048
  LINE r11, r24, r23, r29, r13
  DIV r4, r1, r13
  LDI r10, 1
  SUB r4, r4, r10
  JNZ r4, loop_2
  HALT
