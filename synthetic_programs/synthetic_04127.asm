; mixed program
; initialization
  LDI r15, 0x480C6B
  LDI r8, 16
  LDI r6, 1931
  LDI r2, 64
  LDI r2, 0
  LDI r4, 3997
  LDI r23, 10
  PSETI
  LDI r10, 1
loop_0:
  LDI r0, 2
  LDI r14, 3029
  LDI r6, 0x017D4E
  LDI r12, 1844
  LDI r10, 0
  RECTF r0, r14, r6, r12, r10
  MOD r8, r1, r14
  SHL r26, r9, r1
  LDI r14, 1
  SUB r10, r10, r14
  JNZ r10, loop_0
  OR r9, r2, r28
  OR r7, r12, r15
  OR r1, r10, r8
  LDI r2, 2
loop_1:
  ADD r9, r12, r10
  ADDI r7, r0, 0xA295E7
  SHR r8, r7, r9
  LDI r13, 1
  SUB r2, r2, r13
  JNZ r2, loop_1
  AND r14, r12, r10
  AND r6, r10, r5
  HALT
