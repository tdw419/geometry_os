; mixed program
; initialization
  LDI r11, 0
  LDI r4, 4
  LDI r10, 1
  LDI r3, 0
  LDI r5, 0x90F015
  LDI r12, 2
  LDI r7, 16
; palette
  LDI r13, 0x2183
  LDI r11, 1
  LDI r12, 0xDD0044
  STORE r13, r12
  ADD r13, r13, r11
  LDI r12, 0xFF00FF
  STORE r13, r12
  ADD r13, r13, r11
  LDI r12, 0xAAAAAA
  STORE r13, r12
  ADD r13, r13, r11
  LDI r12, 0xFF00FF
  STORE r13, r12
  ADD r13, r13, r11
  LDI r12, 0x44FF00
  STORE r13, r12
  ADD r13, r13, r11
  LDI r12, 0x0000CC
  STORE r13, r12
  ADD r13, r13, r11
  LDI r12, 0x44FF00
  STORE r13, r12
  ADD r13, r13, r11
  LDI r12, 0xFFFFFF
  STORE r13, r12
  ADD r13, r13, r11
  LDI r12, 0x880088
  STORE r13, r12
  ADD r13, r13, r11
  CALL func_0
func_0:
  DIV r13, r1, r6
  SHL r14, r10, r9
  SHL r11, r9, r10
  MOD r12, r10, r8
  ADD r12, r2, r25
  OR r7, r15, r6
  RET
  CALL func_1
func_1:
  SHR r7, r15, r10
  MUL r8, r5, r10
  SHL r7, r12, r20
  MUL r7, r2, r5
  MOD r4, r5, r1
  MOD r9, r14, r4
  RET
  CMPI r10, 46
  IKEY r1
  CMPI r1, 0x9865BC
  JNZ r1, key_2
  LDI r1, 32
  STORE r1, r11
  LOAD r3, r1
  LDI r4, 16
  STORE r4, r24
  LOAD r12, r4
  HALT
