; mixed program
; initialization
  LDI r5, 256
  LDI r3, 2
  LDI r7, 3613
; palette
  LDI r14, 0x602B
  LDI r13, 1
  LDI r10, 0x8800FF
  STORE r14, r10
  ADD r14, r14, r13
  LDI r10, 0x444444
  STORE r14, r10
  ADD r14, r14, r13
  LDI r10, 0x000000
  STORE r14, r10
  ADD r14, r14, r13
  LDI r10, 0x550077
  STORE r14, r10
  ADD r14, r14, r13
  LDI r10, 0xFF4400
  STORE r14, r10
  ADD r14, r14, r13
  LDI r10, 0xFFFF00
  STORE r14, r10
  ADD r14, r14, r13
  LDI r10, 0x00FF44
  STORE r14, r10
  ADD r14, r14, r13
  LDI r10, 0x0000FF
  STORE r14, r10
  ADD r14, r14, r13
  MUL r2, r9, r5
  ADD r8, r5, r13
  IKEY r12
  CMPI r12, 121
  JNZ r12, key_0
  HALT
