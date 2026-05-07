; conditional logic
; initialization
  LDI r0, 2291
  LDI r10, 0x79B87B
  LDI r13, 0x481409
  LDI r7, 0xAAAAC3
  LDI r9, 64
  CMP r5, r8
  JNZ r5, else_0
  DIV r1, r11, r9
  SUB r14, r3, r0
  MUL r10, r11, r14
  JMP endif_1
else_0:
  LDI r12, 256
  LDI r3, 64
  LDI r3, 64
  LDI r0, 0xDA0722
  LDI r1, 256
  LINE r12, r3, r3, r0, r1
  LDI r15, 8
  LDI r7, 4094
  LDI r14, 10
  LDI r2, 16
  LDI r9, 32
  RECTF r15, r7, r14, r2, r9
  LDI r10, 1111
  LDI r6, 0xCF488A
  LDI r4, 4049
  LDI r15, 128
  LDI r9, 2969
  RECTF r10, r6, r4, r15, r9
  LDI r10, 3039
  LDI r10, 3862
  LDI r6, 676
  LDI r3, 8
  LDI r8, 2
  LINE r10, r10, r6, r3, r8
endif_1:
  CMP r2, r6
  JZ r2, else_2
  SHL r6, r12, r4
  JMP endif_3
else_2:
  LDI r4, 8
  LDI r3, 0x74F5AD
  LDI r9, 32
  PSET r4, r3, r9
endif_3:
  HALT
