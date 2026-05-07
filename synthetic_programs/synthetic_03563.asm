; mixed program
; initialization
  LDI r10, 32
  LDI r0, 2305
  LDI r3, 16
  LDI r13, 0x57D075
  LDI r2, 32
  LDI r14, 4
  LDI r19, 0
  LDI r3, 0x4A0524
  LDI r7, 0xD5B19C
  LDI r4, 0
  PSET r3, r7, r4
  LDI r15, 0xEF44E6
  FILL r15
  SHR r4, r13, r9
  SHL r1, r7, r5
  LDI r1, 128
  LDI r5, 2953
  LDI r13, 64
  TEXT r1, r5, r13, "HELLO"
  LDI r7, 64
  STORE r7, r2
  LOAD r6, r7
  LDI r9, 128
  STORE r9, r13
  LOAD r4, r9
  LDI r10, 593
  STORE r10, r8
  LOAD r7, r10
  LDI r11, 128
  STORE r11, r12
  LOAD r15, r11
  HALT
