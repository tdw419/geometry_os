; mixed program
; initialization
  LDI r16, 0
  LDI r2, 1019
  LDI r19, 3707
  LDI r11, 0xE945B7
  STORE r11, r14
  LOAD r10, r11
  LDI r15, 0x69D7C3
  STORE r15, r11
  LOAD r7, r15
  LDI r7, 0xAC36E0
  STORE r7, r11
  LOAD r9, r7
  LDI r7, 0xF4EFDC
  STORE r7, r6
  LOAD r8, r7
  CMPI r4, 0x18C668
  SHL r9, r4, r7
  OR r4, r2, r5
  OR r1, r8, r7
  CMP r2, r10
  LDI r10, 2013
  LDI r9, 3752
  LDI r1, 0x731D45
  DRAWTEXT r10, r9, r1, "WORLD"
  HALT
