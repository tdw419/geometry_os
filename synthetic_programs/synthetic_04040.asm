; counted animation
; initialization
  LDI r2, 203
  LDI r11, 0x3DDA94
  LDI r8, 2
  LDI r0, 0x4A60C4
loop_0:
  LDI r0, 0x3289B3
  LDI r7, 627
  LDI r14, 3149
  PSET r0, r7, r14
  ANDI r5, r9, 8
  ANDI r15, r11, 4
  LDI r4, 1
  SUB r0, r0, r4
  JNZ r0, loop_0
  LDI r5, 64
loop_1:
  ADDI r15, r7, 0
  ANDI r9, r6, 0x6536F1
  CMPI r3, r2, 0x254C09
  SUBI r1, r14, 128
  LDI r10, 1
  SUB r5, r5, r10
  JNZ r5, loop_1
  HALT
