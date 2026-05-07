; mixed program
; initialization
  LDI r4, 128
  LDI r0, 255
  LDI r21, 914
; palette
  LDI r3, 0x5053
  LDI r10, 1
  LDI r4, 0xFF0000
  STORE r3, r4
  ADD r3, r3, r10
  LDI r4, 0x550077
  STORE r3, r4
  ADD r3, r3, r10
  LDI r4, 0xAAAAAA
  STORE r3, r4
  ADD r3, r3, r10
  LDI r4, 0x8800FF
  STORE r3, r4
  ADD r3, r3, r10
  LDI r4, 0x880088
  STORE r3, r4
  ADD r3, r3, r10
  LDI r4, 0x44FF00
  STORE r3, r4
  ADD r3, r3, r10
  LDI r4, 0xDD0044
  STORE r3, r4
  ADD r3, r3, r10
  LDI r4, 0x8800FF
  STORE r3, r4
  ADD r3, r3, r10
  LDI r4, 0x0044FF
  STORE r3, r4
  ADD r3, r3, r10
  LDI r4, 0x0044FF
  STORE r3, r4
  ADD r3, r3, r10
  PUSH r2
  PUSH r3
  PUSH r2
  PUSH r7
  DIV r2, r6, r3
  XOR r0, r3, r15
  MUL r3, r9, r14
  POP r7
  POP r2
  POP r3
  POP r2
  CMP r4, r10
  MOD r2, r1, r3
main_0:
  SHL r10, r11, r1
  SHL r13, r8, r1
  SAR r11, r10, r8
  SHL r2, r0, r7
  SAR r14, r20, r12
  SHR r12, r19, r14
  SAR r12, r8, r10
  SHR r9, r0, r12
  CMPI r11, r1, 64
  CMPI r1, 0x346A99
  SHL r13, r5, r7
  SHLI r9, r1, 4
  IKEY r9
  CMPI r9, 150
  JNZ r9, key_1
  FRAME
  JMP main_0
