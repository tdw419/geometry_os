; drawing loop program
; initialization
  LDI r6, 3571
  LDI r9, 256
  LDI r13, 64
  LDI r14, 0x3B903D
  LDI r2, 0xDD1BC7
main_0:
  IKEY r0
  CMPI r0, 0x92D2B7
  JNZ r0, key_1
  CMPI r5, 2
  SAR r14, r7, r8
  SHL r14, r7, r8
  LDI r5, 2673
  LDI r1, 0x50A2E2
  LDI r4, 1121
  DRAWTEXT r5, r1, r4, "WORLD"
  CMP r14, r12
  SHL r0, r4, r3
  SHL r1, r8, r13
  SAR r2, r13, r4
  SHL r6, r14, r9
  FRAME
  JMP main_0
