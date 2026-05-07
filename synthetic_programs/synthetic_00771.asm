; mixed program
; initialization
  LDI r9, 0xAB45C3
  LDI r3, 0x93CD16
  LDI r5, 3451
  LDI r10, 0xDB47AE
  LDI r8, 0xB914D3
; palette
  LDI r7, 0x60E2
  LDI r10, 1
  LDI r5, 0xFF4400
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x00AAFF
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x0000FF
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x00FF44
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0xFF4400
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x000066
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x00FFFF
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0xFF4400
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x000000
  STORE r7, r5
  ADD r7, r7, r10
  PUSH r20
  PUSH r1
  PUSH r2
  DIV r8, r1, r7
  XOR r2, r10, r1
  POP r2
  POP r1
  POP r20
  IKEY r9
  CMPI r9, 0xFAE969
  JNZ r9, key_0
  IKEY r10
  CMPI r10, 124
  JNZ r10, key_1
  PUSH r14
  PUSH r1
  PUSH r11
  SUB r12, r14, r8
  DIV r9, r7, r21
  SHL r0, r6, r14
  SUB r10, r15, r12
  DIV r1, r15, r0
  POP r11
  POP r1
  POP r14
  LDI r13, 2
loop_2:
  LDI r6, 533
  LDI r11, 0x1551E5
  LDI r15, 3136
  PSET r6, r11, r15
  LDI r5, 2862
  LDI r30, 0xA2B6A1
  LDI r28, 128
  LDI r4, 517
  LDI r1, 0x00FE98
  RECTF r5, r30, r28, r4, r1
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_2
  SAR r4, r3, r6
  SHR r0, r8, r1
  CMPI r15, 4
  LDI r11, 0xEC2806
  LDI r12, 0
  LDI r2, 1528
  PSET r11, r12, r2
  HALT
