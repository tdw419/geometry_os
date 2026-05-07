; mixed program
; initialization
  LDI r12, 0xD24B87
  LDI r15, 0x329428
  LDI r5, 894
  LDI r4, 0x38D0F7
  CMP r0, r14
  PUSH r10
  PUSH r3
  MOD r12, r1, r0
  DIV r15, r0, r5
  OR r6, r13, r10
  XOR r10, r7, r1
  POP r3
  POP r10
  MOD r14, r9, r5
  LDI r28, 2
  STORE r28, r1
  LOAD r6, r28
  LDI r14, 2545
  STORE r14, r0
  LOAD r16, r14
  LDI r15, 1
  STORE r15, r7
  LOAD r5, r15
  LDI r12, 3785
  STORE r12, r10
  LOAD r0, r12
main_0:
  LDI r10, 32
  LDI r9, 0x335AB7
  LDI r29, 32
  PSETI
  XOR r3, r20, r10
  AND r2, r11, r13
  LDI r11, 255
  LDI r9, 897
  LDI r5, 2080
  DRAWTEXT r11, r9, r5, "WORLD"
  LDI r13, 0
  LDI r8, 4
  LDI r7, 0
  TEXT r13, r8, r7, "HELLO"
  AND r15, r11, r8
  XOR r12, r1, r6
  FRAME
  JMP main_0
