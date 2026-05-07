; mixed program
; initialization
  LDI r8, 256
  LDI r2, 1858
; palette
  LDI r6, 0x222E
  LDI r9, 1
  LDI r15, 0x0000CC
  STORE r6, r15
  ADD r6, r6, r9
  LDI r15, 0x00FF00
  STORE r6, r15
  ADD r6, r6, r9
  LDI r15, 0xFFEE00
  STORE r6, r15
  ADD r6, r6, r9
  LDI r15, 0x00AAFF
  STORE r6, r15
  ADD r6, r6, r9
  LDI r15, 0x888800
  STORE r6, r15
  ADD r6, r6, r9
  LDI r15, 0x44FF00
  STORE r6, r15
  ADD r6, r6, r9
  CALL func_0
func_0:
  DIV r6, r7, r5
  MUL r15, r8, r14
  RET
  CALL func_1
func_1:
  AND r14, r11, r4
  SHR r15, r7, r11
  RET
  IKEY r0
  CMPI r0, 128
  JNZ r0, key_2
main_3:
  SUBI r7, r15, 0xC3DBB7
  SHR r10, r14, r7
  SHL r14, r10, r2
  SHL r11, r15, r20
  SHLI r12, r8, 1
  SHL r5, r14, r3
  SHL r17, r1, r14
  LDI r8, 0xA91D49
  LDI r12, 1971
  LDI r4, 64
  LDI r10, 4
  CIRCLE r8, r12, r4, r10
  MOD r0, r13, r3
  IKEY r11
  CMPI r11, 236
  JNZ r11, key_4
  FRAME
  JMP main_3
