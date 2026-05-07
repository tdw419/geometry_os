; mixed program
; initialization
  LDI r1, 0xC49A42
  LDI r11, 10
  LDI r0, 4
  LDI r9, 3984
; palette
  LDI r10, 0x22E9
  LDI r12, 1
  LDI r28, 0x888800
  STORE r10, r28
  ADD r10, r10, r12
  LDI r28, 0x00AAFF
  STORE r10, r28
  ADD r10, r10, r12
  LDI r28, 0xDD0044
  STORE r10, r28
  ADD r10, r10, r12
  LDI r28, 0xFFAA00
  STORE r10, r28
  ADD r10, r10, r12
  LDI r28, 0x8800FF
  STORE r10, r28
  ADD r10, r10, r12
  LDI r28, 0x888800
  STORE r10, r28
  ADD r10, r10, r12
  LDI r28, 0x008888
  STORE r10, r28
  ADD r10, r10, r12
  PUSH r4
  PUSH r5
  PUSH r7
  PUSH r0
  SHL r3, r7, r1
  OR r15, r1, r12
  MUL r1, r27, r13
  OR r6, r8, r26
  POP r0
  POP r7
  POP r5
  POP r4
  LDI r14, 1170
  LDI r4, 3534
  LDI r3, 0x0CCE49
  LDI r7, 1661
  LDI r7, 1
  LINE r14, r4, r3, r7, r7
  LDI r11, 1970
  LDI r3, 256
  LDI r11, 0x8D1C37
  DRAWTEXT r11, r3, r11, "WORLD"
  MOD r7, r27, r11
  IKEY r10
  CMPI r10, 2
  JNZ r10, key_0
  XOR r5, r10, r6
  XOR r10, r8, r15
  AND r8, r5, r10
  XOR r11, r12, r4
  PUSH r15
  PUSH r14
  PUSH r7
  MOD r20, r11, r1
  MOD r4, r23, r1
  POP r7
  POP r14
  POP r15
  HALT
