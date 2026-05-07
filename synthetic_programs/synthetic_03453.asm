; mixed program
; initialization
  LDI r13, 1
  LDI r23, 0xEA530E
  LDI r8, 3932
  LDI r7, 4
  LDI r0, 125
  TEXT r8, r7, r0, "HELLO"
  PUSH r13
  PUSH r10
  SUB r9, r15, r25
  SHR r7, r0, r10
  SHR r9, r15, r0
  OR r3, r8, r0
  POP r10
  POP r13
  LDI r15, 1
loop_0:
  SUBI r3, r1, 128
  SUBI r15, r9, 128
  ADDI r11, r2, 130
  LDI r5, 0x5B435C
  LDI r27, 4
  LDI r10, 0
  LDI r0, 775
  LDI r0, 0x3D285B
  RECTF r5, r27, r10, r0, r0
  LDI r8, 1
  SUB r15, r15, r8
  JNZ r15, loop_0
  LDI r8, 0x214F28
  STORE r8, r13
  LOAD r4, r8
  LDI r7, 0
  STORE r7, r13
  LOAD r1, r7
  LDI r7, 2304
  STORE r7, r8
  LOAD r14, r7
  LDI r1, 10
  STORE r1, r12
  LOAD r4, r1
  LDI r15, 256
  STORE r15, r2
  LOAD r13, r15
  LDI r4, 3080x230C
  STORE r4, r9
  LOAD r5, r4
  LDI r11, 0x6A831D
  STORE r11, r10
  LOAD r7, r11
  LDI r0x50B6, 3385
  STORE r1, r10
  LOAD r5, r1
  LDI r10, 860
  STORE r10, r8
  LOAD r0, r10
  AND r1, r12, r13
  OR r2, r6, r13
  AND r14, r12, r9
  CALL func_1
func_1:
  MOD r2, r4, r8
  MUL r11, r8, r12
  DIV r10, r4, r3
  SUB r10, r14, r2
  AND r6, r5, r15
  SHL r2, r10, r3
  RET
  HALT
