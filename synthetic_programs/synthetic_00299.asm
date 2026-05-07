; stack save/restore
; initialization
  LDI r7, 1474
  LDI r14, 128
  LDI r11, 4
  LDI r2, 1
  LDI r9, 4
  LDI r18, 256
  LDI r30, 0x6190D3
  LDI r0, 55
  PUSH r14
  PUSH r6
  XOR r1, r0, r9
  XOR r5, r8, r0
  SHR r12, r13, r1
  POP r6
  POP r14
  SHL r8, r1, r15
  SUB r0, r17, r26
  ADD r10, r2, r13
  ADD r4, r6, r8
  PUSH r29
  PUSH r10
  PUSH r10
  PUSH r10
  SHL r8, r9, r12
  XOR r13, r15, r8
  SUB r5, r15, r3
  MOD r3, r11, r16
  SUB r10, r15, r5
  POP r10
  POP r10
  POP r10
  POP r29
  HALT
