; mixed program
; initialization
  LDI r10, 1
  LDI r1, 0x21084A
  LDI r6, 255
  LDI r4, 3325
  LDI r4, 2854
  LDI r13, 0xDFAA8F
  LDI r9, 1585
  DRAWTEXT r4, r13, r9, "WORLD"
  CMP r3, r2
  JNZ r3, else_0
  OR r13, r11, r1
  DIV r3, r15, r5
  AND r1, r12, r5
  MUL r6, r5, r3
  JMP endif_1
else_0:
  LDI r22, 0xD2F71E
  LDI r12, 1068
  LDI r23, 0x69B6B5
  LDI r14, 0xFF7AB8
  LDI r5, 32
  RECTF r22, r12, r23, r14, r5
  LDI r14, 10
  LDI r3, 64
  LDI r12, 646
  LDI r4, 3951
  LDI r12, 2
  LINE r14, r3, r12, r4, r12
  LDI r9, 1322
  LDI r12, 0xB623E0
  LDI r31, 0x61B32E
  WPIXEL
  LDI r3, 0x88D227
  FILL r3
endif_1:
  LDI r15, 0
  LDI r7, 3994
  LDI r7, 3506
  TEXT r15, r7, r7, "HELLO"
  LDI r5, 256
  STORE r5, r5
  LOAD r19, r5
  LDI r6, 0xA1F223
  STORE r6, r5
  LOAD r4, r6
  LDI r3, 8
  STORE r3, r7
  LOAD r9, r3
  XOR r4, r11, r14
  PUSH r13
  SHL r0, r7, r15
  MUL r0, r6, r4
  MOD r2, r1, r12
  AND r7, r0, r5
  SHL r3, r7, r10
  POP r13
  HALT
