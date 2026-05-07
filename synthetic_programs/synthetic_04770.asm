; mixed program
; initialization
  LDI r2, 64
  LDI r13, 10
  LDI r12, 3936
  LDI r4, 3307
  LDI r9, 0x726EAB
  LDI r10, 128
  LDI r1, 8
  LDI r0, 323
  CMP r0, r8
  LDI r7, 0xCBCC18
  LDI r8, 2111
  LDI r7, 726
  LDI r7, 0x80C494
  LDI r1, 0
  RECTF r7, r8, r7, r7, r1
  SAR r7, r10, r2
  SHLI r1, r0, 0xF1C959
  IKEY r5
  CMPI r5, 0x9CC773
  JNZ r5, key_0
  PUSH r15
  PUSH r12
  PUSH r15
  MOD r14, r5, r15
  ADD r6, r7, r23
  SHL r8, r4, r3
  XOR r8, r13, r11
  SUB r2, r6, r7
  POP r15
  POP r12
  POP r15
  HALT
