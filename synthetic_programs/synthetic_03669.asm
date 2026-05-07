; mixed program
; initialization
  LDI r9, 10
  LDI r4, 2871
  LDI r19, 0xA3786D
  LDI r12, 0xA147F8
  LDI r3, 2404
  LDI r10, 0x5ACD02
  LDI r7, 64
  LDI r13, 0xC5C957
  CMPI r3, 0
  LDI r1, 0xE7E6FA
  LDI r0, 1
  LDI r9, 683
  LDI r11, 141
  CIRCLE r1, r0, r9, r11
  SAR r14, r5, r13
  SHL r8, r14, r6
  PUSH r12
  PUSH r5
  PUSH r8
  MOD r2, r15, r9
  DIV r15, r14, r5
  OR r3, r1, r5
  MUL r5, r7, r11
  POP r8
  POP r5
  POP r12
  SAR r21, r1, r5
  SAR r6, r11, r7
  LDI r14, 3022
  STORE r14, r5
  LOAD r15, r14
  LDI r3, 0x9FF300
  STORE r3, r14
  LOAD r7, r3
  LDI r0, 0x4054
  STORE r0, r14
  LOAD r1, r0
  LDI r5, 64
  STORE r5, r13
  LOAD r8, r5
  LDI r7, 445
  STORE r7, r0
  LOAD r26, r7
  LDI r0, 64
  STORE r0, r14
  LOAD r15, r0
  LDI r6, 2829
  STORE r6, r8
  LOAD r12, r6
main_0:
  SHL r1, r12, r14
  SAR r0, r7, r9
  LDI r5, 2803
  LDI r0, 2250
  LDI r3, 10
  DRAWTEXT r5, r0, r3, "WORLD"
  SHR r10, r8, r5
  SHR r7, r5, r8
  SHLI r1, r13, 7
  SHL r7, r3, r14
  FRAME
  JMP main_0
