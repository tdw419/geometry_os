; drawing loop program
; initialization
  LDI r2, 101
  LDI r1, 1274
  LDI r12, 3731
  LDI r5, 3336
main_0:
  SHR r12, r14, r29
  SHR r23, r1, r8
  SHR r6, r2, r0
  SAR r5, r14, r0
  LDI r2, 0x0A8E46
  LDI r7, 0x3F6784
  LDI r8, 128
  DRAWTEXT r2, r7, r8, "WORLD"
  LDI r13, 725
  LDI r14, 44
  LDI r2, 0x0D0873
  TEXT r13, r14, r2, "HELLO"
  FRAME
  JMP main_0
