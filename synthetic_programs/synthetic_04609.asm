; mixed program
; initialization
  LDI r6, 255
  LDI r9, 255
  LDI r5, 1259
  LDI r8, 0x3C1414
  LDI r21, 256
  LDI r4, 0x3449CD
  LDI r0, 0xBB4C26
loop_0:
  SUB r13, r3, r14
  SHL r9, r0, r6
  LDI r14, 1349
  LDI r8, 0x6B4023
  LDI r13, 0xEDB1D2
  LDI r2, 64
  CIRCLE r14, r8, r13, r2
  LDI r2, 1
  SUB r0, r0, r2
  JNZ r0, loop_0
  CMPI r7, 0xD9D885
  CALL func_1
func_1:
  MOD r4, r2, r14
  SHR r5, r12, r13
  MUL r13, r3, r6
  DIV r3, r1, r12
  SHL r14, r4, r13
  ADD r5, r14, r6
  RET
  IKEY r10
  CMPI r10, 16
  JNZ r10, key_2
  CMP r15, r9
  JZ r15, else_3
  MOD r3, r4, r6
  DIV r6, r10, r27
  OR r2, r8, r3
  MOD r1, r14, r11
  JMP endif_4
else_3:
  LDI r4, 4
  LDI r8, 1488
  LDI r12, 0x89DAE2
  LDI r4, 256
  LDI r1, 0x90C6AE
  RECTF r4, r8, r12, r4, r1
  LDI r13, 3360
  LDI r7, 370
  LDI r25, 32
  PSET r13, r7, r25
endif_4:
  PUSH r8
  PUSH r15
  PUSH r21
  PUSH r15
  AND r4, r9, r12
  MUL r6, r5, r3
  POP r15
  POP r21
  POP r15
  POP r8
  PUSH r22
  PUSH r0
  SHL r1, r8, r9
  MUL r4, r28, r15
  SHR r6, r14, r3
  SHR r9, r12, r4
  XOR r3, r8, r7
  POP r0
  POP r22
  LDI r8, 28
loop_5:
  LDI r10, 2127
  LDI r2, 255
  LDI r14, 2910
  PSETI
  SUB r5, r7, r15
  OR r9, r6, r15
  ADDI r9, r2, 0
  LDI r0, 1
  SUB r8, r8, r0
  JNZ r8, loop_5
main_6:
  SUB r7, r15, r9
  CMP r13, r2
  SHLI r3, r17, 8
  SHR r2, r20, r15
  SHR r4, r11, r0
  XOR r12, r0, r10
  AND r15, r4, r12
  AND r11, r5, r8
  XOR r1, r10, r13
  XOR r0, r15, r1
  FRAME
  JMP main_6
