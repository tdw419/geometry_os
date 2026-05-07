; counted animation
; initialization
  LDI r0, 8
  LDI r9, 8
  LDI r8, 3606
  LDI r1, 3864
  LDI r27, 0x43EDAB
  LDI r3, 4
  LDI r7, 1165
  LDI r11, 0x588F2F
loop_0:
  SUBI r12, r13, 32
  LDI r4, 32
  LDI r12, 4069
  LDI r8, 0x16FF7F
  PSET r4, r12, r8
  LDI r9, 1
  LDI r1, 0xFB88C0
  LDI r5, 1387
  PSET r9, r1, r5
  ADDI r9, r8, 16
  LDI r15, 1
  SUB r11, r11, r15
  JNZ r11, loop_0
  LDI r14, 10
loop_1:
  SUB r6, r3, r11
  CMPI r14, r15, 0xF6403A
  LDI r0, 10
  LDI r4, 2775
  LDI r7, 3936
  PSET r0, r4, r7
  LDI r0, 1
  SUB r14, r14, r0
  JNZ r14, loop_1
  LDI r0, 256
loop_2:
  SHL r2, r11, r13
  ANDI r7, r3, 10
  SUBI r12, r13, 0xB90FAB
  ADDI r14, r9, 215
  LDI r9, 1
  SUB r0, r0, r9
  JNZ r0, loop_2
  HALT
