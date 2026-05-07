; mixed program
; initialization
  LDI r8, 0x69C95F
  LDI r2, 64
  LDI r15, 8
  LDI r31, 128
  LDI r11, 3008
  LDI r5, 0x5CAA2D
  LDI r9, 2756
  CMP r15, r6
  JZ r15, else_0
  SHL r4, r1, r14
  AND r4, r9, r19
  JMP endif_1
else_0:
  LDI r5, 1
  LDI r0, 255
  LDI r11, 0x65E705
  WPIXEL
  LDI r14, 0xF44A2A
  FILL r14
  LDI r12, 1095
  FILL r12
  LDI r10, 64
  LDI r8, 1045
  LDI r3, 3336
  LDI r7, 10
  CIRCLE r10, r8, r3, r7
endif_1:
  LDI r29, 0x9F8C2F
  LDI r12, 2009
  LDI r4, 0x837102
  PSETI
  PUSH r13
  PUSH r9
  PUSH r0
  PUSH r0
  SHR r10, r5, r3
  XOR r7, r9, r5
  DIV r3, r14, r28
  MOD r10, r9, r12
  POP r0
  POP r0
  POP r9
  POP r13
  IKEY r7
  CMPI r7, 8
  JNZ r7, key_2
main_3:
  LDI r1, 4
  LDI r13, 0x31BC02
  LDI r8, 3821
  TEXT r1, r13, r8, "HELLO"
  LDI r2, 3343
  LDI r0, 1663
  LDI r7, 0xCA32BB
  TEXT r2, r0, r7, "HELLO"
  FRAME
  JMP main_3
