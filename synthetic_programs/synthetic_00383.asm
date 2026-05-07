; counted animation
; initialization
  LDI r2, 3555
  LDI r12, 32
  LDI r11, 0xCE26B2
  LDI r14, 1108
  LDI r6, 0xAA1F48
  LDI r5, 123
  LDI r21, 2733
  LDI r15, 451
  LDI r6, 28
loop_0:
  ADDI r6, r2, 8
  LDI r2, 1
  SUB r6, r6, r2
  JNZ r6, loop_0
  LDI r15, 0
loop_1:
  SHR r3, r5, r10
  CMPI r6, r1, 16
  CMPI r21, r12, 0xFC26AD
  LDI r7, 1
  SUB r15, r15, r7
  JNZ r15, loop_1
  LDI r3, 27
loop_2:
  LDI r2, 1
  LDI r10, 1300
  LDI r1, 64
  PSETI
  ADDI r2, r12, 0x11E490
  LDI r2, 32
  LDI r8, 10
  LDI r10, 0x5DD834
  PSET r2, r8, r10
  SUBI r10, r2, 154
  LDI r2, 1
  SUB r3, r3, r2
  JNZ r3, loop_2
  HALT
