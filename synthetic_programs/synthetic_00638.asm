; mixed program
; initialization
  LDI r4, 0x80402E
  LDI r8, 1541
; palette
  LDI r9, 0x40F9
  LDI r7, 1
  LDI r0, 0x00AAFF
  STORE r9, r0
  ADD r9, r9, r7
  LDI r0, 0xFFAA00
  STORE r9, r0
  ADD r9, r9, r7
  LDI r0, 0x008888
  STORE r9, r0
  ADD r9, r9, r7
  LDI r0, 0x0000FF
  STORE r9, r0
  ADD r9, r9, r7
  LDI r0, 0x888800
  STORE r9, r0
  ADD r9, r9, r7
  LDI r0, 0x0044FF
  STORE r9, r0
  ADD r9, r9, r7
  LDI r0, 0xFFFF00
  STORE r9, r0
  ADD r9, r9, r7
  LDI r0, 0xFF8800
  STORE r9, r0
  ADD r9, r9, r7
  LDI r0, 0xAA00AA
  STORE r9, r0
  ADD r9, r9, r7
  CMPI r15, 22
  PUSH r8
  PUSH r0
  PUSH r13
  PUSH r4
  AND r9, r11, r1
  SHL r3, r31, r15
  OR r2, r7, r14
  POP r4
  POP r13
  POP r0
  POP r8
  SHR r1, r2, r13
  SHR r7, r5, r14
  SHLI r14, r6, 1
  IKEY r12
  CMPI r12, 228
  JNZ r12, key_0
  LDI r7, 0x44A5BF
  LDI r13, 3289
  LDI r2, 300
  TEXT r7, r13, r2, "HELLO"
  DIV r1, r3, r13
  SUB r11, r5, r2
  HALT
