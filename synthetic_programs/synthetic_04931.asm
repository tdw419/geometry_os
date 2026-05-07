; counted animation
; initialization
  LDI r10, 0xDCD1F7
  LDI r12, 3409
  LDI r7, 10
loop_0:
  CMPI r2, r15, 64
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_0
  LDI r0, 0xCB3F5D
loop_1:
  LDI r18, 0xB53169
  LDI r24, 4
  LDI r30, 3503
  LDI r29, 82
  LDI r11, 2485
  LINE r18, r24, r30, r29, r11
  SUBI r4, r6, 8
  LDI r1, 1
  SUB r0, r0, r1
  JNZ r0, loop_1
  HALT
