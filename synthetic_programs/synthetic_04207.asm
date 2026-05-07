; counted animation
; initialization
  LDI r2, 119
  LDI r7, 0xD18104
  LDI r3, 256
  LDI r5, 0x08E9E4
  LDI r15, 0x8A14FD
  LDI r13, 0xCF6DE1
  LDI r4, 8
  LDI r9, 255
  LDI r5, 16
loop_0:
  ADDI r3, r12, 194
  LDI r27, 4
  LDI r6, 0xB08082
  LDI r7, 0xE9864A
  LDI r9, 864
  LDI r5, 0xE92A73
  RECTF r27, r6, r7, r9, r5
  LDI r6, 238
  LDI r12, 255
  LDI r8, 0x37FE34
  LDI r4, 8
  LDI r11, 4
  LINE r6, r12, r8, r4, r11
  ANDI r15, r1, 53
  LDI r15, 1
  SUB r5, r5, r15
  JNZ r5, loop_0
  HALT
