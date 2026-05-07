; mixed program
; initialization
  LDI r10, 0x09B39D
  LDI r9, 2481
  LDI r16, 4
  LDI r7, 364
  LDI r0, 1277
  AND r2, r4, r0
  XOR r11, r12, r20
  OR r1, r12, r9
  AND r11, r6, r9
  LDI r12, 1420
  LDI r7, 0x8565F0
  LDI r0, 2369
  PSET r12, r7, r0
  OR r12, r15, r5
  IKEY r20
  CMPI r20, 0x92613E
  JNZ r20, key_0
  LDI r13, 10
  STORE r13, r0
  LOAD r3, r13
  LDI r6, 0xF8D3E2
  STORE r6, r4
  LOAD r21, r6
  LDI r0, 0
  STORE r0, r3
  LOAD r23, r0
  IKEY r0
  CMPI r0, 0xCE405A
  JNZ r0, key_1
  LDI r10, 3609
  LDI r14, 3758
  LDI r15, 1799
  LDI r9, 2574
  CIRCLE r10, r14, r15, r9
  HALT
