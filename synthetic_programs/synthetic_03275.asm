; mixed program
; initialization
  LDI r2, 4021
  LDI r9, 4
  LDI r15, 1037
  LDI r8, 1
  LDI r1, 4
; palette
  LDI r12, 0x8090
  LDI r6, 1
  LDI r10, 0x00FF00
  STORE r12, r10
  ADD r12, r12, r6
  LDI r10, 0x44FF00
  STORE r12, r10
  ADD r12, r12, r6
  LDI r10, 0x00FF44
  STORE r12, r10
  ADD r12, r12, r6
  LDI r10, 0x008888
  STORE r12, r10
  ADD r12, r12, r6
  LDI r10, 0x880088
  STORE r12, r10
  ADD r12, r12, r6
  LDI r10, 0x888800
  STORE r12, r10
  ADD r12, r12, r6
  LDI r10, 0xFF00FF
  STORE r12, r10
  ADD r12, r12, r6
  LDI r10, 0xAAFF00
  STORE r12, r10
  ADD r12, r12, r6
  LDI r8, 4
  LDI r2, 0x282391
  LDI r12, 8
  TEXT r8, r2, r12, "HELLO"
  CMP r10, r2
  LDI r14, 1
loop_0:
  SUBI r24, r1, 10
  CMPI r9, r7, 190
  ANDI r4, r1, 0x70066D
  LDI r26, 1
  SUB r14, r14, r26
  JNZ r14, loop_0
  HALT
