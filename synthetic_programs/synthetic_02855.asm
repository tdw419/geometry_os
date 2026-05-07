; mixed program
; initialization
  LDI r0, 10
  LDI r1, 2587
  LDI r2, 764
  LDI r9, 0x89F024
  LDI r12, 64
  LDI r10, 256
  LDI r11, 0xF3F3AC
  LDI r6, 2578
; palette
  LDI r6, 0x50E5
  LDI r10, 1
  LDI r0, 0x00FF00
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0xFF00FF
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0xDD0044
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0x000066
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0xFFEE00
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0x0000CC
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0x880088
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0x444444
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0xFFAA00
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0x550077
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0x0044FF
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0x000066
  STORE r6, r0
  ADD r6, r6, r10
  LDI r0, 0x00AAFF
  STORE r6, r0
  ADD r6, r6, r10
  XOR r9, r4, r3
  AND r12, r9, r0
  PUSH r1
  PUSH r14
  PUSH r15
  MUL r2, r15, r9
  MOD r3, r13, r6
  SUB r0, r14, r13
  POP r15
  POP r14
  POP r1
  LDI r0, 0x8E1A71
  LDI r4, 0
  LDI r15, 1221
  TEXT r0, r4, r15, "HELLO"
main_0:
  IKEY r1
  CMPI r1, 0xFE78C5
  JNZ r1, key_1
  LDI r3, 1412
  LDI r15, 0x58D11A
  LDI r29, 1
  TEXT r3, r15, r29, "HELLO"
  CMPI r14, r11, 10
  FRAME
  JMP main_0
