; mixed program
; initialization
  LDI r24, 0xE69291
  LDI r0, 2118
  LDI r14, 256
  LDI r15, 1594
  PUSH r4
  PUSH r12
  PUSH r1
  MUL r14, r1, r15
  SHL r1, r15, r12
  POP r1
  POP r12
  POP r4
  LDI r4, 0
loop_0:
  ANDI r1, r14, 0x563D36
  LDI r10, 4
  LDI r2, 16
  LDI r5, 8
  LDI r8, 2
  CIRCLE r10, r2, r5, r8
  SUBI r1, r3, 0xF9869C
  LDI r10, 1
  SUB r4, r4, r10
  JNZ r4, loop_0
  LDI r14, 0x0DA1F5
  STORE r14, r4
  LOAD r23, r14
  LDI r2, 2965
  STORE r2, r14
  LOAD r12, r2
  LDI r14, 1443
  STORE r14, r9
  LOAD r4, r14
  LDI r9, 254
  STORE r9, r13
  LOAD r8, r9
  LDI r7, 0x191E65
  STORE r7, r7
  LOAD r3, r7
  LDI r10, 1411
  STORE r10, r4
  LOAD r0, r10
  LDI r5, 0x996AFB
loop_1:
  ANDI r12, r1, 30
  SUB r4, r13, r15
  LDI r0, 1
  SUB r5, r5, r0
  JNZ r5, loop_1
  IKEY r3
  CMPI r3, 0x414A88
  JNZ r3, key_2
  IKEY r28
  CMPI r28, 0x9F94C8
  JNZ r28, key_3
  HALT
