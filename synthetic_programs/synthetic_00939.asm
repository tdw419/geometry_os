; input driven program
; initialization
  LDI r15, 1745
  LDI r4, 0x405105
  LDI r2, 2086
  LDI r11, 0x48151F
main_0:
  CMP r4, r10
  SHLI r0, r7, 0x5F4935
  SHR r1, r15, r8
  SHL r0, r6, r7
  SAR r7, r5, r10
  SUB r2, r4, r10
  LDI r12, 0xCEC740
  LDI r6, 0xBBB142
  LDI r13, 16
  DRAWTEXT r12, r6, r13, "WORLD"
  LDI r14, 1797
  LDI r30, 4
  LDI r12, 992
  TEXT r14, r30, r12, "HELLO"
  FRAME
  JMP main_0
