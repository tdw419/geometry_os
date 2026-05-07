; mixed program
; initialization
  LDI r3, 730
  LDI r4, 219
  LDI r15, 8
  LDI r12, 64
  MOD r10, r4, r14
  SHL r3, r13, r5
  SHR r3, r10, r1
  SHL r13, r4, r1
  LDI r5, 1156
  STORE r5, r7
  LOAD r25, r5
  LDI r15, 0xF400DD
  STORE r15, r14
  LOAD r5, r15
  LDI r6, 0x007F93
  STORE r6, r5
  LOAD r12, r6
  LDI r8, 0xC6B256
  STORE r8, r11
  LOAD r9, r8
  LDI r12, 0xFA36FE
  STORE r12, r13
  LOAD r15, r12
  ADD r2, r0, r5
  ADD r15, r12, r0
main_0:
  SUBI r1, r13, 0x444CEF
  MOD r11, r4, r9
  ADDI r9, r11, 165
  IKEY r5
  CMPI r5, 4
  JNZ r5, key_1
  FRAME
  JMP main_0
