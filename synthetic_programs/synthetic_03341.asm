; mixed program
; initialization
  LDI r9, 0x092D96
  LDI r11, 1
  LDI r1, 127
  LDI r5, 2431
  LDI r7, 16
  LDI r8, 0xFDC48E
  LDI r13, 2
  LDI r1, 32
  LDI r13, 0x65189C
  LDI r9, 0x944006
  PSET r1, r13, r9
  MUL r6, r4, r14
  LDI r5, 2624
  STORE r5, r8
  LOAD r1, r5
  LDI r12, 244
  STORE r12, r2
  LOAD r15, r12
  LDI r1, 2711
  STORE r1, r7
  LOAD r4, r1
  LDI r13, 4069
  STORE r13, r10
  LOAD r5, r13
  XOR r1, r9, r12
  OR r12, r2, r11
  OR r1, r2, r10
  SUB r3, r14, r9
  CALL func_0
func_0:
  SHL r9, r12, r15
  SHR r15, r13, r1
  SHR r2, r4, r14
  RET
  PUSH r27
  MOD r12, r10, r7
  DIV r11, r17, r4
  SHL r13, r7, r2
  AND r11, r8, r13
  SHL r11, r10, r0
  POP r27
  HALT
