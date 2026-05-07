; mixed program
; initialization
  LDI r0, 4
  LDI r12, 0xDD25A9
  LDI r7, 1412
  LDI r1, 865
  LDI r10, 256
  LDI r6, 64
  LDI r3, 0x7BB281
  LDI r15, 8
  PUSH r6
  PUSH r5
  SHR r6, r30, r1
  SUB r5, r12, r10
  SUB r6, r13, r2
  MUL r9, r10, r2
  ADD r0, r1, r9
  POP r5
  POP r6
  PUSH r6
  PUSH r23
  ADD r6, r5, r13
  SUB r14, r12, r8
  XOR r8, r14, r11
  SUB r8, r9, r12
  XOR r7, r10, r13
  POP r23
  POP r6
  CMP r9, r1
  HALT
