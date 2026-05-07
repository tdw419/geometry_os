; mixed program
; initialization
  LDI r28, 0x34C9A6
  LDI r13, 0x3A9E93
; palette
  LDI r3, 0x7059
  LDI r2, 1
  LDI r0, 0x00FF44
  STORE r3, r0
  ADD r3, r3, r2
  LDI r0, 0x0000CC
  STORE r3, r0
  ADD r3, r3, r2
  LDI r0, 0xFFAA00
  STORE r3, r0
  ADD r3, r3, r2
  LDI r0, 0x550077
  STORE r3, r0
  ADD r3, r3, r2
  LDI r0, 0xAAAAAA
  STORE r3, r0
  ADD r3, r3, r2
  LDI r0, 0x44FF00
  STORE r3, r0
  ADD r3, r3, r2
  LDI r0, 0xAA00AA
  STORE r3, r0
  ADD r3, r3, r2
  LDI r0, 0x8800FF
  STORE r3, r0
  ADD r3, r3, r2
  LDI r0, 0x00FFAA
  STORE r3, r0
  ADD r3, r3, r2
  LDI r3, 0
loop_0:
  MOD r3, r2, r15
  LDI r7, 2803
  LDI r12, 256
  LDI r7, 2902
  PSETI
  LDI r6, 1
  SUB r3, r3, r6
  JNZ r3, loop_0
  IKEY r12
  CMPI r12, 2
  JNZ r12, key_1
  IKEY r1
  CMPI r1, 32
  JNZ r1, key_2
  LDI r1, 4084
  STORE r1, r9
  LOAD r5, r1
  LDI r14, 4
  STORE r14, r15
  LOAD r1, r14
  LDI r13, 0x4B92A9
  STORE r13, r13
  LOAD r9, r13
  LDI r10, 1
  STORE r10, r6
  LOAD r8, r10
  LDI r9, 0x76EFC1
  STORE r9, r10
  LOAD r28, r9
  PUSH r10
  PUSH r4
  DIV r0, r10, r4
  SUB r7, r29, r1
  OR r1, r0, r9
  POP r4
  POP r10
  LDI r12, 1194
  STORE r12, r0
  LOAD r13, r12
  LDI r9, 1
  STORE r9, r10
  LOAD r15, r9
  LDI r2, 64
  STORE r2, r2
  LOAD r24, r2
  LDI r10, 0xF2D59B
  STORE r10, r15
  LOAD r18, r10
  SAR r0, r9, r14
  SHR r13, r12, r14
  HALT
