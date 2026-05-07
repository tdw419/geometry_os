; drawing loop program
; initialization
  LDI r9, 682
  LDI r2, 2685
  LDI r7, 1156
  LDI r4, 0xC62F0F
  LDI r14, 2853
  LDI r10, 0x066C7B
; palette
  LDI r7, 0x2316
  LDI r3, 1
  LDI r8, 0x44FF00
  STORE r7, r8
  ADD r7, r7, r3
  LDI r8, 0xAAFF00
  STORE r7, r8
  ADD r7, r7, r3
  LDI r8, 0xAAFF00
  STORE r7, r8
  ADD r7, r7, r3
  LDI r8, 0x44FF00
  STORE r7, r8
  ADD r7, r7, r3
  LDI r8, 0x000000
  STORE r7, r8
  ADD r7, r7, r3
  LDI r8, 0xFFAA00
  STORE r7, r8
  ADD r7, r7, r3
main_0:
  SHR r15, r9, r1
  SHR r9, r26, r0
  SHLI r12, r23, 2
  SHL r15, r6, r13
  SHLI r11, r22, 1
  SHR r3, r13, r1
  SHL r14, r15, r6
  SHR r8, r15, r1
  SHLI r12, r19, 0xF9E638
  XOR r2, r29, r11
  AND r9, r29, r4
  FRAME
  JMP main_0
