; mixed program
; initialization
  LDI r3, 128
  LDI r6, 1
  LDI r2, 1512
; palette
  LDI r0, 0x5079
  LDI r30, 1
  LDI r10, 0x00FFAA
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0xDD0044
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0xFFFFFF
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0xAA00AA
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0x00FF44
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0xAAAAAA
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0xFFEE00
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0x000066
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0x00AAFF
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0xFFEE00
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0x444444
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0x0044FF
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0xDD0044
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0x00FF44
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0xFFAA00
  STORE r0, r10
  ADD r0, r0, r30
  LDI r10, 0x0044FF
  STORE r0, r10
  ADD r0, r0, r30
  CALL func_0
func_0:
  MOD r20, r8, r2
  MOD r12, r15, r11
  SUB r15, r10, r29
  DIV r9, r12, r6
  RET
  DIV r26, r10, r4
  SAR r6, r5, r3
  SAR r7, r2, r17
  SHL r14, r6, r5
  SHL r15, r5, r8
  DIV r21, r10, r5
  LDI r11, 32
  STORE r11, r3
  LOAD r5, r11
  LDI r4, 32
  STORE r4, r9
  LOAD r6, r4
  CALL func_1
func_1:
  SHL r9, r14, r8
  MUL r3, r1, r15
  RET
  OR r30, r8, r14
  XOR r31, r1, r2
  CMP r8, r14
  HALT
