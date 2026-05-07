; mixed program
; initialization
  LDI r15, 2
  LDI r12, 2
  LDI r8, 0xA4E438
  LDI r1, 2126
  LDI r14, 3879
; palette
  LDI r3, 0x40F9
  LDI r10, 1
  LDI r14, 0xFFEE00
  STORE r3, r14
  ADD r3, r3, r10
  LDI r14, 0xAAFF00
  STORE r3, r14
  ADD r3, r3, r10
  LDI r14, 0x0000CC
  STORE r3, r14
  ADD r3, r3, r10
  LDI r14, 0x44FF00
  STORE r3, r14
  ADD r3, r3, r10
  LDI r14, 0x8800FF
  STORE r3, r14
  ADD r3, r3, r10
  IKEY r15
  CMPI r15, 0x837A8D
  JNZ r15, key_0
  MUL r8, r12, r6
  LDI r2, 32
  LDI r9, 255
  LDI r9, 782
  TEXT r2, r9, r9, "HELLO"
  DIV r5, r0, r9
  HALT
