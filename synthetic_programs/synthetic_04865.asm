; mixed program
; initialization
  LDI r8, 2598
  LDI r13, 0xDA1ED2
  LDI r1, 3409
  LDI r11, 8
  LDI r9, 1167
  LDI r6, 0x9BF172
  IKEY r9
  CMPI r9, 4
  JNZ r9, key_0
  SHL r7, r13, r28
  LDI r12, 15
loop_1:
  LDI r12, 0x9DB760
  LDI r12, 2
  LDI r4, 8
  PSETI
  LDI r0, 0xC5228F
  LDI r13, 3061
  LDI r2, 3376
  LDI r10, 1070
  CIRCLE r0, r13, r2, r10
  LDI r13, 64
  LDI r5, 16
  LDI r15, 0xF79E73
  PSET r13, r5, r15
  LDI r8, 1
  SUB r12, r12, r8
  JNZ r12, loop_1
  LDI r4, 0x32442F
loop_2:
  SHR r2, r8, r4
  LDI r6, 0x5C0A77
  LDI r9, 128
  LDI r8, 10
  LDI r10, 2
  LDI r1, 16
  RECTF r6, r9, r8, r10, r1
  LDI r12, 1
  SUB r4, r4, r12
  JNZ r4, loop_2
  LDI r3, 2
  LDI r8, 917
  LDI r10, 0x4811BE
  PSETI
  IKEY r14
  CMPI r14, 188
  JNZ r14, key_3
main_4:
  SAR r2, r3, r6
  SHR r5, r1, r7
  SHL r14, r9, r10
  SUBI r13, r1, 1
  LDI r8, 4
  LDI r7, 0x583F5F
  LDI r1, 0x286526
  DRAWTEXT r8, r7, r1, "WORLD"
  ANDI r13, r8, 0xB4B832
  SUBI r1, r6, 0xF0348B
  CMPI r12, 10
  FRAME
  JMP main_4
