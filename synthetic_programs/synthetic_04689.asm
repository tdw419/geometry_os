; counted animation
; initialization
  LDI r13, 64
  LDI r0, 2097
  LDI r3, 763
  LDI r1, 2906
  LDI r15, 10
  LDI r5, 0xF4BB12
  LDI r6, 3030
  LDI r2, 1636
  LDI r5, 0
loop_0:
  ANDI r4, r3, 0xDC7C5D
  LDI r11, 0x34A041
  LDI r5, 255
  LDI r15, 0xC413F0
  PSETI
  LDI r15, 1
  SUB r5, r5, r15
  JNZ r5, loop_0
  LDI r7, 32
loop_1:
  SUBI r0, r13, 83
  ADDI r10, r0, 105
  LDI r12, 1
  SUB r7, r7, r12
  JNZ r7, loop_1
  HALT
