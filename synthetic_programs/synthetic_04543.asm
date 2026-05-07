; counted animation
; initialization
  LDI r10, 3173
  LDI r14, 0
  LDI r8, 0x4830CF
loop_0:
  ANDI r8, r3, 0xC8E01E
  LDI r0, 1
  SUB r8, r8, r0
  JNZ r8, loop_0
  LDI r8, 0
loop_1:
  SUBI r1, r11, 0xF6ECF5
  LDI r4, 255
  LDI r9, 1566
  LDI r0, 256
  LDI r6, 2
  LDI r11, 216
  LINE r4, r9, r0, r6, r11
  MOD r26, r15, r4
  LDI r3, 1
  SUB r8, r8, r3
  JNZ r8, loop_1
  HALT
