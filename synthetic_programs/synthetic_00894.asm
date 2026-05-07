; mixed program
; initialization
  LDI r11, 0x44A475
  LDI r6, 10
; palette
  LDI r3, 0x8016
  LDI r7, 1
  LDI r5, 0xAAAAAA
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0xFF00FF
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0x000000
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0x550077
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0x0000CC
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0x888800
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0xFFFF00
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0xFFFF00
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0xFF0000
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0x444444
  STORE r3, r5
  ADD r3, r3, r7
  LDI r5, 0xDD0044
  STORE r3, r5
  ADD r3, r3, r7
  IKEY r8
  CMPI r8, 230
  JNZ r8, key_0
  OR r10, r13, r0
  OR r22, r15, r5
  OR r11, r8, r0
  AND r12, r8, r3
  LDI r1, 0xDF863D
  STORE r1, r15
  LOAD r13, r1
  LDI r8, 2
  STORE r8, r22
  LOAD r5, r8
  XOR r7, r19, r14
  AND r14, r13, r10
  ADD r3, r10, r5
  LDI r11, 1
  LDI r12, 489
  LDI r29, 128
  TEXT r11, r12, r29, "HELLO"
  LDI r12, 4036
  STORE r12, r4
  LOAD r14, r12
  LDI r4, 2301
  STORE r4, r6
  LOAD r5, r4
  LDI r0x20880, 0x20886
  STORE r10, r12
  LOAD r14, r10
  LDI r3, 256
  STORE r3, r12
  LOAD r9, r3
main_1:
  IKEY r1
  CMPI r1, 0x1F231E
  JNZ r1, key_2
  LDI r12, 2
  LDI r5, 32
  LDI r1, 0xEDD9C2
  PSET r12, r5, r1
  ANDI r15, r4, 0x0F3889
  FRAME
  JMP main_1
