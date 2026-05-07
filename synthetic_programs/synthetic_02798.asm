; mixed program
; initialization
  LDI r6, 0x7524C1
  LDI r4, 0x79378B
  SHLI r0, r4, 4
  SHLI r14, r9, 7
  CMP r12, r7
  JZ r12, else_0
  MUL r14, r11, r10
  SHL r0, r7, r4
  JMP endif_1
else_0:
  LDI r1, 0x03678C
  LDI r11, 0
  LDI r8, 0xD657DE
  LDI r12, 8
  LDI r20, 190
  LINE r1, r11, r8, r12, r20
endif_1:
  XOR r8, r24, r4
  XOR r2, r6, r11
  OR r0, r3, r14
  PUSH r0
  PUSH r7
  PUSH r2
  AND r9, r1, r2
  XOR r12, r6, r5
  MUL r0, r2, r10
  POP r2
  POP r7
  POP r0
  HALT
