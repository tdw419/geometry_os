; mixed program
; initialization
  LDI r4, 0
  LDI r2, 64
  LDI r10, 16
  CMP r3, r0
  SAR r5, r2, r15
  SHL r13, r14, r15
  CMPI r3, 8
  LDI r9, 255
  STORE r9, r1
  LOAD r21, r9
  LDI r1, 354
  STORE r1, r24
  LOAD r10, r1
  LDI r11, 2986
  STORE r11, r11
  LOAD r8, r11
  HALT
