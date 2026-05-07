; mixed program
; initialization
  LDI r4, 10
  LDI r30, 32
  LDI r11, 1
  LDI r15, 36
loop_0:
  LDI r11, 3028
  LDI r5, 256
  LDI r1, 0xA7B965
  LDI r0, 659
  LDI r11, 32
  LINE r11, r5, r1, r0, r11
  DIV r2, r20, r13
  ANDI r15, r6, 0x1BE478
  CMPI r7, r14, 207
  LDI r12, 1
  SUB r15, r15, r12
  JNZ r15, loop_0
  LDI r3, 0
  STORE r3, r6
  LOAD r9, r3
  LDI r15, 0x5048
  STORE r15, r14
  LOAD r11, r15
  LDI r14, 1129
  LDI r5, 256
  LDI r4, 0xC29DDB
  PSET r14, r5, r4
  PUSH r11
  OR r11, r3, r9
  DIV r2, r8, r10
  MUL r14, r13, r0
  POP r11
  LDI r4, 0xC22E63
  STORE r4, r0
  LOAD r14, r4
  LDI r3, 3070
  STORE r3, r3
  LOAD r7, r3
  PUSH r10
  PUSH r9
  PUSH r14
  DIV r1, r19, r12
  XOR r10, r4, r13
  MOD r9, r1, r6
  POP r14
  POP r9
  POP r10
  LDI r15, 0
loop_1:
  LDI r8, 0xA379FA
  LDI r7, 3701
  LDI r13, 2
  LDI r5, 0x62DD56
  CIRCLE r8, r7, r13, r5
  SUB r9, r8, r31
  CMPI r14, r2, 95
  ANDI r15, r4, 226
  LDI r3, 1
  SUB r15, r15, r3
  JNZ r15, loop_1
main_2:
  SUB r9, r2, r15
  SHLI r14, r1, 8
  SHR r1, r5, r3
  AND r1, r0, r14
  OR r6, r0, r5
  OR r7, r2, r11
  AND r6, r13, r1
  OR r3, r8, r10
  XOR r9, r11, r15
  CMPI r3, 121
  FRAME
  JMP main_2
