; mixed program
; initialization
  LDI r0, 3230
  LDI r2, 0x472504
  LDI r4, 2670
  LDI r7, 0
  LDI r8, 16
  LDI r11, 0x2F14B0
  LDI r1, 406
  LDI r9, 0xCA09AE
  XOR r9, r11, r12
  AND r8, r11, r12
  OR r8, r11, r13
  XOR r1, r3, r5
  XOR r3, r15, r1
  OR r8, r14, r9
  XOR r1, r6, r14
  PUSH r10
  PUSH r5
  PUSH r14
  PUSH r10
  AND r6, r3, r11
  MOD r15, r7, r9
  POP r10
  POP r14
  POP r5
  POP r10
  OR r8, r1, r14
  OR r24, r5, r7
  XOR r9, r4, r3
  LDI r6, 0
  STORE r6, r6
  LOAD r7, r6
  LDI r5, 256
  STORE r5, r3
  LOAD r15, r5
  LDI r2, 3398
  STORE r2, r8
  LOAD r22, r2
  LDI r3, 255
  STORE r3, r14
  LOAD r4, r3
  LDI r7, 0x4036xC0x40364E23
  STORE r7, r7
  LOAD r19, r7
  LDI r15, 0x919614
  STORE r15, r10
  LOAD r3, r15
  LDI r5, 1103
  LDI r4, 4
  LDI r4, 2
  TEXT r5, r4, r4, "HELLO"
main_0:
  SHLI r4, r0, 6
  SHL r11, r4, r8
  SHL r12, r15, r9
  LDI r8, 464
  LDI r1, 0x4EC24A
  LDI r4, 3516
  DRAWTEXT r8, r1, r4, "WORLD"
  AND r2, r7, r8
  XOR r2, r11, r5
  FRAME
  JMP main_0
