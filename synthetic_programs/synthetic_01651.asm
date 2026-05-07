; counted animation
; initialization
  LDI r11, 0x809E78
  LDI r1, 4
  LDI r10, 0x0F24AA
loop_0:
  ADDI r9, r14, 10
  ANDI r4, r8, 0x19E2E2
  LDI r10, 0x413126
  LDI r12, 2
  LDI r13, 1336
  WPIXEL
  LDI r11, 1
  SUB r10, r10, r11
  JNZ r10, loop_0
  LDI r6, 0x83AFEA
loop_1:
  LDI r9, 64
  LDI r3, 64
  LDI r1, 0x912FAF
  PSET r9, r3, r1
  LDI r6, 1
  LDI r29, 0x18DB99
  LDI r13, 4
  PSET r6, r29, r13
  LDI r3, 1
  SUB r6, r6, r3
  JNZ r6, loop_1
  LDI r11, 30
loop_2:
  ANDI r9, r6, 16
  XOR r15, r4, r8
  LDI r14, 1
  SUB r11, r11, r14
  JNZ r11, loop_2
  HALT
