; mixed program
; initialization
  LDI r6, 128
  LDI r2, 0x3A6003
  LDI r14, 0xB929A5
  LDI r13, 2007
  LDI r18, 0xC31F4B
  PSETI
  PUSH r13
  PUSH r14
  PUSH r6
  SHL r2, r6, r9
  ADD r7, r1, r12
  SHR r12, r6, r7
  XOR r9, r5, r8
  POP r6
  POP r14
  POP r13
  LDI r5, 0xE62ECB
  LDI r10, 256
  LDI r10, 0x7D6DE0
  PSET r5, r10, r10
  LDI r13, 0x77D3BB
  LDI r13, 0xA5E879
  LDI r14, 10
  TEXT r13, r13, r14, "HELLO"
  PUSH r7
  SHL r3, r1, r12
  SHR r8, r9, r10
  MOD r14, r6, r9
  ADD r0, r11, r7
  MUL r5, r3, r15
  POP r7
  AND r9, r6, r22
  HALT
