; mixed program
; initialization
  LDI r3, 128
  LDI r15, 1
; palette
  LDI r4, 0x60C1
  LDI r12, 1
  LDI r13, 0x888800
  STORE r4, r13
  ADD r4, r4, r12
  LDI r13, 0xAAAAAA
  STORE r4, r13
  ADD r4, r4, r12
  LDI r13, 0x888800
  STORE r4, r13
  ADD r4, r4, r12
  LDI r13, 0xAA00AA
  STORE r4, r13
  ADD r4, r4, r12
  LDI r13, 0x444444
  STORE r4, r13
  ADD r4, r4, r12
  LDI r13, 0xDD0044
  STORE r4, r13
  ADD r4, r4, r12
  LDI r13, 0xFF00FF
  STORE r4, r13
  ADD r4, r4, r12
  LDI r13, 0x444444
  STORE r4, r13
  ADD r4, r4, r12
  LDI r13, 0x00FF44
  STORE r4, r13
  ADD r4, r4, r12
  LDI r13, 0x00FF44
  STORE r4, r13
  ADD r4, r4, r12
  AND r4, r2, r21
  OR r19, r1, r8
  XOR r5, r14, r0
  LDI r0, 873
  LDI r9, 0x754624
  LDI r7, 0xD67CA3
  TEXT r0, r9, r7, "HELLO"
  PUSH r15
  PUSH r3
  PUSH r9
  AND r8, r15, r12
  AND r13, r1, r10
  POP r9
  POP r3
  POP r15
  LDI r7, 3004
  LDI r4, 0
  LDI r13, 319
  LDI r7, 2
  CIRCLE r7, r4, r13, r7
  IKEY r2
  CMPI r2, 9
  JNZ r2, key_0
  PUSH r4
  PUSH r5
  PUSH r1
  PUSH r15
  SHL r8, r5, r27
  SHR r21, r10, r1
  POP r15
  POP r1
  POP r5
  POP r4
  SHLI r8, r10, 5
  SAR r12, r27, r10
  SHR r10, r3, r13
  SAR r8, r12, r9
  SHLI r5, r8, 0x704832
  SHR r0, r2, r8
  SHR r11, r9, r8
main_1:
  IKEY r28
  CMPI r28, 0x831E54
  JNZ r28, key_2
  CMP r8, r13
  IKEY r8
  CMPI r8, 0x813C1C
  JNZ r8, key_3
  MOD r15, r9, r4
  XOR r11, r12, r8
  AND r0, r1, r23
  FRAME
  JMP main_1
