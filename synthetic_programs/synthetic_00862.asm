; mixed program
; initialization
  LDI r4, 249
  LDI r24, 2384
  LDI r1, 1318
  LDI r12, 10
  LDI r7, 0
  LDI r2, 3842
  LDI r14, 0xDC0569
  STORE r14, r4
  LOAD r15, r14
  LDI r1, 0x158AB0
  STORE r1, r9
  LOAD r10, r1
  PUSH r14
  PUSH r4
  DIV r15, r7, r6
  SHL r8, r31, r10
  SHL r6, r12, r11
  MOD r10, r2, r9
  XOR r11, r12, r1
  POP r4
  POP r14
  CMP r12, r8
  SHR r14, r10, r9
  SAR r12, r4, r8
  IKEY r2
  CMPI r2, 64
  JNZ r2, key_0
  AND r9, r3, r4
main_1:
  ADDI r11, r8, 128
  LDI r8, 2392
  LDI r7, 0
  LDI r13, 1
  TEXT r8, r7, r13, "HELLO"
  AND r5, r15, r14
  OR r12, r2, r4
  XOR r2, r13, r10
  OR r12, r0, r7
  FRAME
  JMP main_1
