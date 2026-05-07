; drawing loop program
; initialization
  LDI r6, 0x0F0778
  LDI r25, 1
  LDI r12, 256
  LDI r15, 0xCD47EA
; palette
  LDI r6, 0x6045
  LDI r9, 1
  LDI r5, 0x0000FF
  STORE r6, r5
  ADD r6, r6, r9
  LDI r5, 0x0000CC
  STORE r6, r5
  ADD r6, r6, r9
  LDI r5, 0x008888
  STORE r6, r5
  ADD r6, r6, r9
  LDI r5, 0xFFEE00
  STORE r6, r5
  ADD r6, r6, r9
  LDI r5, 0xFF00FF
  STORE r6, r5
  ADD r6, r6, r9
  LDI r5, 0x550077
  STORE r6, r5
  ADD r6, r6, r9
  LDI r5, 0x8800FF
  STORE r6, r5
  ADD r6, r6, r9
main_0:
  AND r14, r6, r13
  OR r30, r7, r23
  OR r15, r12, r13
  OR r6, r2, r1
  CMP r22, r14
  AND r4, r0, r24
  XOR r3, r11, r12
  IKEY r13
  CMPI r13, 2
  JNZ r13, key_1
  MUL r12, r8, r9
  IKEY r13
  CMPI r13, 246
  JNZ r13, key_2
  FRAME
  JMP main_0
