; mixed program
; initialization
  LDI r28, 16
  LDI r4, 256
; palette
  LDI r3, 0x8052
  LDI r8, 1
  LDI r13, 0x0044FF
  STORE r3, r13
  ADD r3, r3, r8
  LDI r13, 0xFFEE00
  STORE r3, r13
  ADD r3, r3, r8
  LDI r13, 0x000000
  STORE r3, r13
  ADD r3, r3, r8
  LDI r13, 0xDD0044
  STORE r3, r13
  ADD r3, r3, r8
  LDI r13, 0x00AAFF
  STORE r3, r13
  ADD r3, r3, r8
  LDI r13, 0xFF00FF
  STORE r3, r13
  ADD r3, r3, r8
  LDI r13, 0xFFEE00
  STORE r3, r13
  ADD r3, r3, r8
  LDI r13, 0xFFFF00
  STORE r3, r13
  ADD r3, r3, r8
  LDI r13, 0x444444
  STORE r3, r13
  ADD r3, r3, r8
  LDI r1, 256
  LDI r3, 1643
  LDI r7, 64
  LDI r13, 0
  LDI r3, 0x5BEED4
  LINE r1, r3, r7, r13, r3
  SHL r3, r15, r4
  SHLI r11, r13, 0
  SHR r10, r8, r9
  CALL func_0
func_0:
  ADD r0, r6, r2
  MUL r11, r4, r21
  MOD r10, r4, r9
  DIV r2, r9, r15
  ADD r1, r13, r3
  SHL r1, r3, r6
  RET
  CALL func_1
func_1:
  OR r0, r15, r12
  DIV r5, r10, r4
  SUB r4, r7, r10
  SHL r10, r7, r4
  RET
main_2:
  OR r8, r3, r1
  XOR r10, r8, r9
  CMP r7, r1
  ADD r14, r5, r0
  IKEY r3
  CMPI r3, 248
  JNZ r3, key_3
  FRAME
  JMP main_2
