; mixed program
; initialization
  LDI r4, 0x8AEAD3
  LDI r1, 256
  LDI r3, 3100
  LDI r6, 3362
  LDI r12, 0xCEB9CD
  LDI r5, 4
  LDI r11, 2374
  LDI r8, 0
; palette
  LDI r7, 0x505C
  LDI r13, 1
  LDI r1, 0x444444
  STORE r7, r1
  ADD r7, r7, r13
  LDI r1, 0x0000CC
  STORE r7, r1
  ADD r7, r7, r13
  LDI r1, 0xAAFF00
  STORE r7, r1
  ADD r7, r7, r13
  LDI r1, 0xAAFF00
  STORE r7, r1
  ADD r7, r7, r13
  LDI r1, 0xFFAA00
  STORE r7, r1
  ADD r7, r7, r13
  LDI r1, 0xFFEE00
  STORE r7, r1
  ADD r7, r7, r13
  LDI r1, 0xFF4400
  STORE r7, r1
  ADD r7, r7, r13
  LDI r1, 0xFF4400
  STORE r7, r1
  ADD r7, r7, r13
  LDI r1, 0x0044FF
  STORE r7, r1
  ADD r7, r7, r13
  LDI r1, 0xFF0000
  STORE r7, r1
  ADD r7, r7, r13
  CMPI r4, 10
  AND r14, r11, r0
  AND r4, r1, r3
  AND r5, r14, r13
  OR r3, r5, r13
  LDI r6, 1678
  STORE r6, r1
  LOAD r11, r6
  LDI r12, 0x803072
  STORE r12, r2
  LOAD r4, r12
  LDI r13, 3970
  STORE r13, r5
  LOAD r2, r13
  PUSH r5
  PUSH r15
  DIV r2, r13, r1
  SUB r3, r8, r9
  SUB r5, r26, r6
  OR r2, r11, r5
  POP r15
  POP r5
  CMP r3, r10
  CMP r6, r5
main_0:
  IKEY r8
  CMPI r8, 0x0E37F5
  JNZ r8, key_1
  LDI r3, 0xE71320
  LDI r10, 0x590657
  LDI r5, 0x9969E5
  TEXT r3, r10, r5, "HELLO"
  FRAME
  JMP main_0
