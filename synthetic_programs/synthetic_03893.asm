; mixed program
; initialization
  LDI r6, 0x25AF83
  LDI r7, 0x438E12
  LDI r1, 256
  PUSH r0
  SUB r9, r5, r1
  SUB r1, r12, r15
  SUB r4, r5, r10
  OR r10, r13, r6
  POP r0
  CMPI r1, 95
  LDI r12, 3588
  STORE r12, r3
  LOAD r8, r12
  LDI r2, 1698
  STORE r2, r14
  LOAD r6, r2
  LDI r14, 3230
  STORE r14, r4
  LOAD r15, r14
  LDI r11, 91
  STORE r11, r0
  LOAD r15, r11
  LDI r6, 966
  STORE r6, r6
  LOAD r15, r6
  PUSH r13
  AND r4, r7, r0
  DIV r8, r12, r20
  SHR r15, r12, r4
  ADD r11, r14, r9
  AND r5, r12, r0
  POP r13
  LDI r9, 32
  STORE r9, r15
  LOAD r12, r9
  LDI r6, 256
  STORE r6, r11
  LOAD r10, r6
  LDI r7, 0xD348E4
  STORE r7, r9
  LOAD r10, r7
  LDI r2, 199
  LDI r13, 16
  LDI r0, 64
  DRAWTEXT r2, r13, r0, "WORLD"
  IKEY r12
  CMPI r12, 0
  JNZ r12, key_0
  SAR r12, r0, r4
  SHLI r5, r0, 0
  HALT
