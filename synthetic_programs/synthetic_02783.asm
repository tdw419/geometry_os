; mixed program
; initialization
  LDI r6, 10
  LDI r10, 34
; palette
  LDI r26, 0x6026
  LDI r4, 1
  LDI r9, 0x0044FF
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0xFF8800
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0x00FFFF
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0x880088
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0xFFFF00
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0xAA00AA
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0xAAFF00
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0x000000
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0x00FF00
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0x550077
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0xFF4400
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0x0044FF
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0xAAAAAA
  STORE r26, r9
  ADD r26, r26, r4
  LDI r9, 0xAA00AA
  STORE r26, r9
  ADD r26, r26, r4
  LDI r15, 0x05BF1A
  FILL r15
  OR r11, r8, r12
  XOR r6, r15, r11
  PUSH r22
  PUSH r2
  PUSH r8
  PUSH r12
  XOR r7, r12, r0
  ADD r12, r15, r13
  SHL r7, r10, r3
  OR r5, r1, r9
  SUB r8, r4, r7
  POP r12
  POP r8
  POP r2
  POP r22
main_0:
  SAR r15, r4, r3
  SHLI r8, r3, 3
  SHLI r8, r4, 0x12BBBC
  LDI r4, 2417
  LDI r2, 0x6056A6
  LDI r7, 3761
  DRAWTEXT r4, r2, r7, "WORLD"
  FRAME
  JMP main_0
