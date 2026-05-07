; mixed program
; initialization
  LDI r14, 0xFCB87D
  LDI r2, 8
  LDI r10, 1596
  LDI r7, 0x799F69
  LDI r6, 1244
  LDI r1, 0xFC8E77
  LDI r3, 0x3441A5
  DIV r5, r13, r1
  LDI r7, 0
loop_0:
  CMPI r12, r13, 16
  ANDI r0, r4, 0x8B0C1E
  ADDI r8, r2, 0x4A0533
  CMPI r1, r0, 66
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_0
  LDI r14, 0x73199A
loop_1:
  ADDI r3, r0, 45
  LDI r30, 1
  SUB r14, r14, r30
  JNZ r14, loop_1
  CMP r13, r15
  JZ r13, else_2
  DIV r0, r4, r8
  JMP endif_3
else_2:
  LDI r0, 2043
  LDI r2, 0xCA7913
  LDI r10, 0xAF2B01
  WPIXEL
  LDI r10, 0
  LDI r2, 32
  LDI r8, 1095
  WPIXEL
  LDI r8, 0xFB5D8F
  LDI r13, 0x57A5C4
  LDI r0, 0x1DF993
  PSETI
endif_3:
  CMP r4, r7
  HALT
