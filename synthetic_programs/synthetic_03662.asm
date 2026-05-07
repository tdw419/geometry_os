; mixed program
; initialization
  LDI r8, 0x0A0518
  LDI r2, 32
  LDI r3, 0
  LDI r14, 32
  CMP r7, r14
  JZ r7, else_0
  AND r3, r11, r5
  SHL r14, r3, r26
  DIV r8, r4, r11
  JMP endif_1
else_0:
  LDI r13, 3373
  LDI r10, 3818
  LDI r7, 0xA72B1E
  LDI r1, 1
  CIRCLE r13, r10, r7, r1
  LDI r3, 256
  LDI r9, 0x1A81C7
  LDI r7, 1763
  PSETI
  LDI r15, 0x418F25
  LDI r9, 10
  LDI r2, 2271
  LDI r15, 2753
  CIRCLE r15, r9, r2, r15
endif_1:
  AND r13, r1, r22
  XOR r14, r15, r10
  PUSH r3
  PUSH r14
  SUB r13, r3, r1
  DIV r12, r15, r14
  XOR r8, r7, r2
  POP r14
  POP r3
  PUSH r1
  PUSH r11
  SHR r0, r7, r2
  MUL r3, r2, r11
  ADD r9, r16, r5
  DIV r9, r15, r6
  OR r3, r0, r11
  POP r11
  POP r1
  SAR r5, r12, r6
  SHLI r3, r10, 3
main_2:
  LDI r13, 0xEE321A
  LDI r0, 0x28E2FE
  LDI r6, 0
  TEXT r13, r0, r6, "HELLO"
  IKEY r12
  CMPI r12, 201
  JNZ r12, key_3
  LDI r4, 1495
  LDI r15, 256
  LDI r7, 0x96ED59
  TEXT r4, r15, r7, "HELLO"
  CMP r6, r1
  LDI r15, 255
  LDI r6, 128
  LDI r15, 0xA15FEA
  TEXT r15, r6, r15, "HELLO"
  OR r15, r2, r4
  OR r12, r4, r7
  AND r9, r11, r1
  XOR r13, r11, r12
  FRAME
  JMP main_2
