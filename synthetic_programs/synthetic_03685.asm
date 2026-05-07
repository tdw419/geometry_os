; mixed program
; initialization
  LDI r9, 618
  LDI r10, 1579
  LDI r13, 2
  LDI r8, 2316
  LDI r15, 3752
  LDI r0, 2097
  LDI r7, 3470
  LDI r4, 2591
  PUSH r4
  PUSH r13
  XOR r1, r19, r0
  OR r4, r6, r7
  MOD r0, r11, r3
  POP r13
  POP r4
  PUSH r5
  PUSH r1
  MUL r11, r15, r23
  SUB r11, r7, r5
  POP r1
  POP r5
  IKEY r3
  CMPI r3, 256
  JNZ r3, key_0
  CMP r5, r10
  CMP r10, r13
  PUSH r8
  PUSH r18
  PUSH r1
  PUSH r3
  SHR r9, r1, r12
  XOR r15, r9, r8
  MUL r3, r4, r2
  POP r3
  POP r1
  POP r18
  POP r8
main_1:
  IKEY r28
  CMPI r28, 77
  JNZ r28, key_2
  ADDI r29, r15, 16
  AND r1, r5, r6
  XOR r13, r2, r15
  AND r11, r5, r6
  SAR r7, r5, r3
  SHLI r7, r0, 256
  SHL r5, r4, r14
  SHR r6, r1, r7
  FRAME
  JMP main_1
