; conditional logic
; initialization
  LDI r30, 256
  LDI r7, 0x97DF6A
  LDI r2, 0x1D37CF
  LDI r3, 0x5B31FB
  LDI r5, 0x87F063
  LDI r10, 10
  LDI r9, 0x8BDD9B
  LDI r19, 64
  CMP r15, r16
  JZ r15, else_0
  DIV r3, r0, r1
  SHL r7, r6, r12
  MUL r11, r12, r9
  JMP endif_1
else_0:
  LDI r15, 0x72736E
  LDI r13, 2397
  LDI r4, 4
  LDI r13, 64
  CIRCLE r15, r13, r4, r13
endif_1:
  CMP r8, r14
  JNZ r8, else_2
  SHL r4, r2, r0
  JMP endif_3
else_2:
  LDI r12, 3451
  LDI r5, 3450
  LDI r11, 2543
  LDI r1, 0x8FEAA7
  LDI r12, 4
  LINE r12, r5, r11, r1, r12
  LDI r7, 0
  LDI r1, 0xCF6176
  LDI r15, 0x018406
  PSETI
  LDI r3, 1069
  LDI r5, 903
  LDI r2, 0x7E80EE
  WPIXEL
  LDI r10, 0xB69D7D
  LDI r11, 10
  LDI r0, 0xA87164
  LDI r9, 3956
  LDI r8, 16
  LINE r10, r11, r0, r9, r8
endif_3:
  CMP r6, r5
  JNZ r6, else_4
  MUL r7, r15, r6
  JMP endif_5
else_4:
  LDI r17, 246
  LDI r4, 256
  LDI r11, 0xE405F6
  PSETI
  LDI r0, 0
  LDI r15, 2
  LDI r2, 0xB55891
  PSET r0, r15, r2
  LDI r15, 0x10F624
  LDI r0, 2554
  LDI r7, 0x7A807A
  LDI r8, 651
  CIRCLE r15, r0, r7, r8
  LDI r8, 1154
  LDI r0, 128
  LDI r1, 0
  LDI r21, 0xBE2975
  CIRCLE r8, r0, r1, r21
endif_5:
  HALT
