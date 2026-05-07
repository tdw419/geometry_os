; mixed program
; initialization
  LDI r2, 0x1B2FF0
  LDI r9, 2
  LDI r6, 1741
  XOR r9, r6, r4
  OR r6, r9, r5
  AND r7, r10, r4
  DIV r14, r7, r15
  SHL r10, r15, r3
  CMP r7, r12
  LDI r1, 0x266B2F
loop_0:
  OR r8, r2, r3
  MOD r5, r0, r1
  LDI r3, 1
  SUB r1, r1, r3
  JNZ r1, loop_0
  PUSH r7
  PUSH r8
  PUSH r15
  PUSH r7
  OR r15, r8, r0
  XOR r18, r5, r6
  AND r9, r1, r5
  OR r4, r1, r11
  MUL r6, r10, r11
  POP r7
  POP r15
  POP r8
  POP r7
  LDI r1, 43
loop_1:
  LDI r3, 1
  LDI r12, 32
  LDI r0, 1489
  WPIXEL
  LDI r15, 4079
  LDI r10, 0x2F1078
  LDI r11, 4
  PSETI
  LDI r2, 1
  SUB r1, r1, r2
  JNZ r1, loop_1
  MUL r8, r5, r11
main_2:
  LDI r13, 0
  LDI r11, 0
  LDI r13, 0xA0FCDD
  DRAWTEXT r13, r11, r13, "WORLD"
  OR r5, r9, r11
  AND r11, r12, r2
  AND r5, r12, r6
  OR r13, r4, r2
  OR r14, r1, r9
  XOR r2, r3, r0
  AND r14, r10, r9
  SUB r7, r14, r0
  FRAME
  JMP main_2
