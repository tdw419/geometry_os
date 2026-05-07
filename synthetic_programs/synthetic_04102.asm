; mixed program
; initialization
  LDI r0, 10
  LDI r2, 2
  LDI r1, 132
  LDI r8, 0x29DBFC
  LDI r4, 3487
  LDI r13, 0xCB2536
  LDI r11, 128
  PUSH r2
  PUSH r2
  PUSH r10
  PUSH r5
  SUB r3, r0, r4
  MOD r14, r11, r3
  ADD r7, r3, r0
  ADD r1, r4, r17
  POP r5
  POP r10
  POP r2
  POP r2
  LDI r12, 0xA9A4AA
  LDI r7, 0x5F33B2
  LDI r1, 0x86EA33
  TEXT r12, r7, r1, "HELLO"
  CMP r14, r6
  JZ r14, else_0
  SUB r7, r8, r9
  MOD r2, r10, r4
  JMP endif_1
else_0:
  LDI r0, 128
  FILL r0
endif_1:
  DIV r8, r6, r4
  CALL func_2
func_2:
  DIV r13, r4, r8
  AND r0, r2, r9
  DIV r4, r9, r2
  SHL r9, r0, r25
  SUB r2, r12, r11
  RET
  CMPI r11, 238
  LDI r4, 0x8485B1
  LDI r12, 828
  LDI r4, 32
  TEXT r4, r12, r4, "HELLO"
  HALT
