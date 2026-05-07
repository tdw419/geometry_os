; mixed program
; initialization
  LDI r14, 0x87DC49
  LDI r15, 255
  LDI r1, 965
  LDI r31, 0x717AC1
  LDI r8, 8
  LDI r6, 128
  MOD r7, r14, r3
  PUSH r10
  PUSH r3
  AND r7, r31, r13
  MOD r0, r2, r4
  AND r9, r4, r7
  POP r3
  POP r10
  SHR r14, r1, r13
  SHL r5, r2, r7
  SAR r3, r11, r14
  SHR r24, r15, r0
  SHR r15, r9, r1
  IKEY r10
  CMPI r10, 9
  JNZ r10, key_0
  PUSH r2
  PUSH r1
  SHL r12, r14, r15
  ADD r26, r11, r10
  POP r1
  POP r2
  HALT
