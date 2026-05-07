; counted animation
; initialization
  LDI r5, 1
  LDI r10, 0xB32E91
  LDI r4, 0x19D2A6
  LDI r6, 2
  LDI r11, 3470
  LDI r4, 7
loop_0:
  LDI r8, 64
  LDI r11, 3241
  LDI r6, 1639
  PSET r8, r11, r6
  LDI r0, 1
  SUB r4, r4, r0
  JNZ r4, loop_0
  LDI r30, 0x082AD5
loop_1:
  ADDI r9, r1, 0x57C7C5
  ANDI r6, r5, 8
  LDI r6, 0xB50724
  LDI r9, 0
  LDI r21, 3699
  LDI r17, 4
  LDI r7, 16
  RECTF r6, r9, r21, r17, r7
  LDI r11, 1
  SUB r30, r30, r11
  JNZ r30, loop_1
  LDI r0, 256
loop_2:
  MOD r0, r13, r4
  CMPI r1, r8, 109
  ADDI r15, r12, 157
  SHL r7, r14, r21
  LDI r21, 1
  SUB r0, r0, r21
  JNZ r0, loop_2
  HALT
