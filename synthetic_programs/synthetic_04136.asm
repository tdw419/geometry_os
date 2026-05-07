; mixed program
; initialization
  LDI r0, 3797
  LDI r4, 2819
  LDI r25, 2399
  LDI r7, 0xAB2699
  LDI r13, 0x41685C
  LDI r9, 64
  LDI r8, 4
  LDI r5, 1
  LDI r3, 2067
  STORE r3, r0
  LOAD r9, r3
  LDI r1, 124
  STORE r1, r0
  LOAD r7, r1
  LDI r15, 2548
  LDI r8, 823
  LDI r0, 128
  PSET r15, r8, r0
  SHL r0, r5, r14
  SAR r8, r11, r5
  SAR r3, r12, r2
  SHL r2, r12, r9
  LDI r0, 831
  STORE r0, r10
  LOAD r4, r0
  LDI r0x60AC4, 0x5D0A00x60AC
  STORE r14, r3
  LOAD r9, r14
  LDI r7, 0x5E7E7C
  STORE r7, r4
  LOAD r6, r7
  LDI r1, 0x2B2315
  STORE r1, r2
  LOAD r7, r1
main_0:
  LDI r0, 0x69BE5D
  LDI r5, 0x828F3C
  LDI r7, 0x6EB176
  TEXT r0, r5, r7, "HELLO"
  SHLI r9, r14, 0xB5310E
  SAR r9, r0, r2
  CMP r1, r13
  FRAME
  JMP main_0
