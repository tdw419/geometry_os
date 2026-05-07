; mixed program
; initialization
  LDI r4, 0x002C95
  LDI r2, 10
  LDI r10, 0x9D6D27
  LDI r0, 0x5D763A
  LDI r5, 2747
  LDI r12, 3827
  LDI r13, 64
  LDI r6, 0
  LDI r9, 1212
  LDI r8, 256
  LDI r6, 4
  TEXT r9, r8, r6, "HELLO"
  LDI r14, 0x33441A
  LDI r3, 0xC0DE6E
  LDI r10, 0x3CFC7D
  LDI r11, 2
  LDI r10, 797
  LINE r14, r3, r10, r11, r10
  CMP r11, r4
  JZ r11, else_0
  SUB r7, r2, r1
  ADD r6, r16, r14
  SUB r10, r9, r12
  JMP endif_1
else_0:
  LDI r1, 0xEAA602
  LDI r9, 0
  LDI r11, 951
  PSET r1, r9, r11
  LDI r15, 735
  LDI r3, 4
  LDI r10, 2
  LDI r0, 3605
  CIRCLE r15, r3, r10, r0
endif_1:
  DIV r1, r3, r0
  CMP r9, r2
  JZ r9, else_2
  SHL r14, r13, r11
  OR r0, r3, r13
  DIV r26, r2, r10
  JMP endif_3
else_2:
  LDI r4, 32
  FILL r4
endif_3:
  LDI r9, 0x2790A1
  LDI r14, 3354
  LDI r9, 0
  LDI r1, 10
  LDI r4, 68
  RECTF r9, r14, r9, r1, r4
main_4:
  AND r7, r3, r2
  OR r1, r8, r13
  OR r13, r6, r4
  OR r13, r1, r16
  SHLI r4, r7, 0x31E209
  SHR r6, r11, r7
  FRAME
  JMP main_4
