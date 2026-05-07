; mixed program
; initialization
  LDI r9, 128
  LDI r6, 1
  LDI r2, 0xB0x20FCBC66
  STORE r2, r3
  LOAD r12, r2
  LDI r12, 64
  STORE r12, r14
  LOAD r2, r12
  PUSH r6
  PUSH r11
  MUL r8, r12, r2
  SUB r15, r0, r7
  SHL r12, r4, r2
  XOR r9, r2, r0
  MUL r5, r3, r15
  POP r11
  POP r6
  CMP r14, r4
  JZ r14, else_0
  DIV r6, r1, r8
  DIV r18, r2, r8
  JMP endif_1
else_0:
  LDI r2, 3164
  LDI r14, 4054
  LDI r6, 2465
  LDI r11, 1
  LDI r3, 0x95A8E3
  RECTF r2, r14, r6, r11, r3
  LDI r15, 0x34E7AB
  LDI r0, 0
  LDI r13, 0xF730C1
  LDI r12, 2211
  CIRCLE r15, r0, r13, r12
  LDI r3, 0x97560A
  LDI r7, 255
  LDI r14, 3609
  LDI r8, 64
  LDI r9, 0x43AA8A
  RECTF r3, r7, r14, r8, r9
  LDI r15, 1061
  LDI r1, 32
  LDI r5, 256
  LDI r9, 0x8AC102
  LDI r3, 3322
  RECTF r15, r1, r5, r9, r3
endif_1:
  OR r2, r0, r6
  AND r8, r15, r14
  XOR r24, r7, r8
  CALL func_2
func_2:
  MUL r29, r6, r10
  DIV r5, r21, r14
  MOD r0, r8, r3
  DIV r0, r15, r4
  MUL r2, r5, r17
  RET
  MOD r4, r8, r1
main_3:
  LDI r9, 1721
  LDI r1, 10
  LDI r13, 0x658327
  TEXT r9, r1, r13, "HELLO"
  ANDI r6, r10, 155
  XOR r10, r3, r9
  SAR r5, r15, r9
  SHR r2, r12, r13
  SHLI r9, r1, 8
  SHR r9, r14, r11
  SHL r8, r13, r28
  SAR r5, r13, r8
  SHL r7, r6, r8
  SAR r6, r10, r4
  FRAME
  JMP main_3
