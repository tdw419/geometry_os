; counted animation
; initialization
  LDI r11, 3590
  LDI r3, 16
  LDI r1, 4
  LDI r8, 64
  LDI r4, 0x5919E5
loop_0:
  SUBI r10, r9, 0x638A75
  LDI r11, 1
  SUB r4, r4, r11
  JNZ r4, loop_0
  LDI r4, 0xF16AD9
loop_1:
  ANDI r14, r10, 8
  LDI r15, 2
  LDI r9, 0xA9ED97
  LDI r6, 1
  LDI r13, 0xE03E0C
  LDI r13, 64
  LINE r15, r9, r6, r13, r13
  OR r11, r14, r10
  LDI r15, 1
  SUB r4, r4, r15
  JNZ r4, loop_1
  LDI r30, 24
loop_2:
  LDI r9, 255
  LDI r6, 0x48198E
  LDI r4, 0x99E8BF
  LDI r7, 4
  LDI r4, 3641
  LINE r9, r6, r4, r7, r4
  SHL r9, r8, r1
  SHL r4, r13, r14
  ADDI r12, r7, 10
  LDI r1, 1
  SUB r30, r30, r1
  JNZ r30, loop_2
  HALT
