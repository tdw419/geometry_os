; memory operations
; initialization
  LDI r0, 10
  LDI r8, 128
  LDI r10, 0xF5C99F
  LDI r13, 3622
  LDI r9, 0xD8132A
  LDI r11, 16
  LDI r6, 32
  STORE r6, r8
  LOAD r1, r6
  LDI r11, 3519
  STORE r11, r7
  LOAD r8, r11
  LDI r5, 10
  STORE r5, r2
  LOAD r13, r5
  LDI r5, 2877
  STORE r5, r1
  LOAD r8, r5
  HALT
