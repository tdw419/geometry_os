; mixed program
; initialization
  LDI r5, 1978
  LDI r12, 3507
  LDI r14, 0xB3A5E2
  LDI r4, 0x50F9E4
  LDI r6, 255
  PUSH r12
  PUSH r1
  PUSH r15
  PUSH r6
  XOR r10, r1, r4
  SHL r10, r1, r15
  POP r6
  POP r15
  POP r1
  POP r12
  CMP r13, r7
  JZ r13, else_0
  XOR r9, r3, r5
  DIV r13, r3, r5
  SUB r2, r12, r22
  SHR r3, r7, r2
  JMP endif_1
else_0:
  LDI r8, 3028
  LDI r12, 0x5B9BA2
  LDI r5, 3180
  LDI r12, 0x0CD4A6
  CIRCLE r8, r12, r5, r12
  LDI r4, 0x3A723E
  LDI r14, 128
  LDI r13, 448
  PSETI
  LDI r2, 1680
  LDI r29, 1893
  LDI r8, 0x2AE46C
  LDI r9, 1074
  CIRCLE r2, r29, r8, r9
endif_1:
  IKEY r6
  CMPI r6, 0x5455C9
  JNZ r6, key_2
  LDI r7, 8
  STORE r7, r0
  LOAD r6, r7
  LDI r5, 0xF3D089
  STORE r5, r3
  LOAD r13, r5
  LDI r2, 8
  LDI r9, 0x0F80B3
  LDI r24, 0xCEBAAB
  PSETI
  LDI r0, 30
loop_3:
  ADDI r14, r10, 1
  MUL r15, r0, r10
  LDI r1, 865
  LDI r9, 1570
  LDI r13, 0x59EB73
  PSETI
  CMPI r5, r7, 0x5069FB
  LDI r13, 1
  SUB r0, r0, r13
  JNZ r0, loop_3
  CMP r1, r2
main_4:
  LDI r7, 0xB22F86
  LDI r9, 2645
  LDI r14, 251
  TEXT r7, r9, r14, "HELLO"
  DIV r1, r12, r6
  ADDI r4, r5, 0x11A601
  ANDI r14, r5, 4
  OR r13, r3, r2
  LDI r4, 2
  LDI r12, 0x689548
  LDI r14, 2177
  TEXT r4, r12, r14, "HELLO"
  FRAME
  JMP main_4
