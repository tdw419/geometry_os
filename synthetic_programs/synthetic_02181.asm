; counted animation
; initialization
  LDI r12, 1
  LDI r5, 3557
  LDI r6, 32
  LDI r13, 0x7760DE
  LDI r8, 3735
  LDI r3, 0x24EB0C
  LDI r9, 2922
  LDI r11, 1966
  LDI r8, 0x95C420
loop_0:
  SUBI r9, r5, 136
  LDI r14, 0xF7F799
  LDI r12, 0
  LDI r1, 8
  LDI r0, 0xC8C12C
  LDI r7, 4
  RECTF r14, r12, r1, r0, r7
  LDI r11, 1
  SUB r8, r8, r11
  JNZ r8, loop_0
  LDI r10, 32
loop_1:
  AND r7, r13, r19
  LDI r10, 2635
  LDI r1, 2747
  LDI r3, 0xAC626A
  LDI r14, 0x4F2C6E
  LDI r4, 3892
  LINE r10, r1, r3, r14, r4
  ADDI r9, r11, 10
  SUB r5, r14, r3
  LDI r6, 1
  SUB r10, r10, r6
  JNZ r10, loop_1
  HALT
