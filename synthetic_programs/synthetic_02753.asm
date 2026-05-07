; mixed program
; initialization
  LDI r7, 0x7F33CC
  LDI r29, 81
  LDI r4, 1695
; palette
  LDI r5, 0x5003
  LDI r12, 1
  LDI r6, 0xFFFFFF
  STORE r5, r6
  ADD r5, r5, r12
  LDI r6, 0x0000FF
  STORE r5, r6
  ADD r5, r5, r12
  LDI r6, 0x00FFFF
  STORE r5, r6
  ADD r5, r5, r12
  LDI r6, 0x44FF00
  STORE r5, r6
  ADD r5, r5, r12
  LDI r6, 0x44FF00
  STORE r5, r6
  ADD r5, r5, r12
  LDI r6, 0x00FFAA
  STORE r5, r6
  ADD r5, r5, r12
  LDI r6, 0x000066
  STORE r5, r6
  ADD r5, r5, r12
  LDI r6, 0x00AAFF
  STORE r5, r6
  ADD r5, r5, r12
  MUL r1, r15, r11
  SAR r10, r9, r7
  SAR r6, r10, r12
  SHL r2, r1, r11
  SHLI r4, r7, 8
  XOR r7, r14, r2
  OR r13, r0, r3
  OR r7, r14, r13
  LDI r12, 230
  LDI r9, 3065
  LDI r6, 1464
  LDI r8, 0
  LDI r3, 0x6085AA
  LINE r12, r9, r6, r8, r3
  CALL func_0
func_0:
  DIV r8, r4, r10
  MOD r13, r11, r9
  ADD r2, r7, r10
  RET
  SHR r10, r0, r4
  HALT
