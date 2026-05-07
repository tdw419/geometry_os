; conditional logic
; initialization
  LDI r0, 4
  LDI r9, 0x8639E7
  LDI r14, 64
  CMP r21, r2
  JZ r21, else_0
  MUL r1, r13, r2
  SUB r9, r13, r4
  XOR r9, r7, r11
  JMP endif_1
else_0:
  LDI r6, 2486
  LDI r10, 256
  LDI r15, 1853
  PSET r6, r10, r15
  LDI r12, 0x97FC15
  LDI r14, 0x80CCF2
  LDI r5, 0x1A87D6
  PSETI
endif_1:
  CMP r3, r9
  JZ r3, else_2
  ADD r28, r0, r1
  DIV r15, r8, r5
  JMP endif_3
else_2:
  LDI r7, 2512
  LDI r8, 256
  LDI r9, 128
  LDI r5, 0
  LDI r10, 335
  LINE r7, r8, r9, r5, r10
  LDI r11, 0x2DC399
  LDI r5, 0xDBFA72
  LDI r10, 128
  LDI r10, 0x96F931
  LDI r25, 256
  LINE r11, r5, r10, r10, r25
  LDI r15, 0x4CBC25
  LDI r2, 4
  LDI r29, 64
  LDI r4, 2056
  CIRCLE r15, r2, r29, r4
endif_3:
  CMP r5, r6
  JZ r5, else_4
  OR r10, r7, r15
  XOR r15, r12, r2
  XOR r3, r6, r9
  JMP endif_5
else_4:
  LDI r1, 128
  LDI r24, 256
  LDI r10, 0x3AE43B
  LDI r3, 10
  CIRCLE r1, r24, r10, r3
  LDI r3, 64
  LDI r5, 0xC960A7
  LDI r0, 0x7A328A
  PSET r3, r5, r0
  LDI r1, 0x6C350C
  LDI r3, 2442
  LDI r5, 0xAD585C
  LDI r0, 0xDCDB01
  CIRCLE r1, r3, r5, r0
endif_5:
  HALT
