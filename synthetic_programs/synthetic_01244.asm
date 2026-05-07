; counted animation
; initialization
  LDI r9, 255
  LDI r4, 3975
  LDI r17, 399
  LDI r1, 4
  LDI r12, 6
loop_0:
  SHR r6, r9, r23
  LDI r8, 1
  SUB r12, r12, r8
  JNZ r12, loop_0
  LDI r11, 33
loop_1:
  ADDI r15, r26, 4
  LDI r15, 1
  SUB r11, r11, r15
  JNZ r11, loop_1
  LDI r8, 10
loop_2:
  LDI r10, 3101
  LDI r8, 0
  LDI r24, 2670
  PSET r10, r8, r24
  ADDI r12, r8, 64
  LDI r7, 0xB7ECF8
  LDI r14, 0x0C99EC
  LDI r1, 128
  PSET r7, r14, r1
  SUBI r15, r8, 250
  LDI r4, 1
  SUB r8, r8, r4
  JNZ r8, loop_2
  HALT
