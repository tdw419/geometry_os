; mixed program
; initialization
  LDI r10, 0
  LDI r4, 1653
  LDI r6, 0x0DA919
  CMP r8, r3
  LDI r1, 2
loop_0:
  LDI r11, 0xC1F7BD
  LDI r4, 2042
  LDI r9, 256
  LDI r14, 1
  LDI r7, 1280
  RECTF r11, r4, r9, r14, r7
  LDI r30, 0x9A44C3
  LDI r11, 0x79A11D
  LDI r15, 0xAB62DE
  LDI r14, 0x978CAA
  LDI r15, 2835
  LINE r30, r11, r15, r14, r15
  LDI r3, 0x2B98FD
  LDI r1, 863
  LDI r1, 0x9757BA
  PSETI
  LDI r12, 0x6881C2
  LDI r7, 950
  LDI r12, 0xDA47D4
  PSETI
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_0
  LDI r0, 0x2E9824
  STORE r0, r8
  LOAD r10, r0
  LDI r11, 10
  STORE r11, r7
  LOAD r9, r11
  LDI r13, 2885
  STORE r13, r6
  LOAD r0, r13
  LDI r8, 2913
  STORE r8, r7
  LOAD r0, r8
  LDI r7, 3388
  LDI r6, 2865
  LDI r15, 64
  TEXT r7, r6, r15, "HELLO"
  PUSH r13
  PUSH r13
  PUSH r10
  OR r9, r3, r10
  ADD r14, r9, r11
  MUL r2, r14, r1
  AND r3, r12, r13
  POP r10
  POP r13
  POP r13
  DIV r15, r14, r9
  SAR r3, r4, r9
  SHR r4, r3, r0
  SAR r8, r0, r1
  HALT
