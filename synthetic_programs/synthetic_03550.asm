; drawing loop program
; initialization
  LDI r2, 1
  LDI r14, 2308
; palette
  LDI r8, 0x80C1
  LDI r5, 1
  LDI r0, 0x0044FF
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0xFFEE00
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0x000000
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0x00AAFF
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0x00AAFF
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0x000066
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0x0044FF
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0xFFFF00
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0x00AAFF
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0xAA00AA
  STORE r8, r0
  ADD r8, r8, r5
  LDI r0, 0xFF0000
  STORE r8, r0
  ADD r8, r8, r5
main_0:
  SHLI r13, r14, 1
  SAR r9, r10, r6
  ADDI r10, r2, 44
  AND r15, r4, r5
  AND r15, r28, r6
  OR r6, r14, r15
  OR r12, r5, r7
  SHL r15, r5, r7
  SHL r9, r1, r4
  SAR r14, r3, r1
  SHL r4, r16, r12
  IKEY r2
  CMPI r2, 60
  JNZ r2, key_1
  XOR r7, r12, r13
  XOR r1, r0, r14
  FRAME
  JMP main_0
