; mixed program
; initialization
  LDI r15, 2446
  LDI r12, 455
  LDI r0, 8
  LDI r13, 0xAFD965
  PUSH r11
  PUSH r7
  PUSH r2
  ADD r7, r4, r10
  SHL r15, r3, r12
  POP r2
  POP r7
  POP r11
  LDI r11, 4055
  LDI r14, 724
  LDI r10, 16
  LDI r1, 8
  LDI r3, 3397
  RECTF r11, r14, r10, r1, r3
  LDI r15, 0x239Cx9E90x239CA2
  STORE r15, r11
  LOAD r5, r15
  LDI r9, 255
  STORE r9, r9
  LOAD r4, r9
  XOR r9, r10, r1
  AND r9, r5, r12
  PUSH r5
  PUSH r7
  PUSH r5
  ADD r15, r24, r13
  SUB r8, r21, r9
  ADD r14, r12, r15
  POP r5
  POP r7
  POP r5
  CMP r14, r9
  OR r15, r1, r9
  OR r11, r8, r15
  OR r12, r1, r5
  OR r15, r10, r13
  HALT
