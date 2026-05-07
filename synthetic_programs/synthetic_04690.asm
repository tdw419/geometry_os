; mixed program
; initialization
  LDI r2, 2749
  LDI r20, 52
  LDI r13, 1548
; palette
  LDI r15, 0x206E
  LDI r1, 1
  LDI r2, 0x880088
  STORE r15, r2
  ADD r15, r15, r1
  LDI r2, 0x0000CC
  STORE r15, r2
  ADD r15, r15, r1
  LDI r2, 0xFF0000
  STORE r15, r2
  ADD r15, r15, r1
  LDI r2, 0xFF8800
  STORE r15, r2
  ADD r15, r15, r1
  LDI r2, 0x008888
  STORE r15, r2
  ADD r15, r15, r1
  LDI r2, 0x00FFAA
  STORE r15, r2
  ADD r15, r15, r1
  LDI r2, 0xFF8800
  STORE r15, r2
  ADD r15, r15, r1
  LDI r2, 0x888800
  STORE r15, r2
  ADD r15, r15, r1
  LDI r2, 0xFF4400
  STORE r15, r2
  ADD r15, r15, r1
  IKEY r13
  CMPI r13, 2
  JNZ r13, key_0
  LDI r6, 128
  LDI r12, 0
  LDI r5, 0xF44805
  LDI r10, 256
  CIRCLE r6, r12, r5, r10
  CMPI r2, 64
  AND r13, r6, r1
  XOR r7, r12, r4
  AND r3, r11, r6
  LDI r14, 0x6E6E99
  STORE r14, r8
  LOAD r11, r14
  LDI r8, 1803
  STORE r8, r11
  LOAD r4, r8
  LDI r4, 215
  STORE r4, r5
  LOAD r18, r4
  LDI r5, 1
  STORE r5, r9
  LOAD r2, r5
  HALT
