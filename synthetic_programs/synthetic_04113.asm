; mixed program
; initialization
  LDI r18, 256
  LDI r12, 4083
  LDI r5, 3412
  LDI r0, 0x1209D2
  LDI r6, 64
  LDI r3, 1200
  LDI r7, 10
  LDI r10, 2
  LDI r8, 0x5F2470
  LDI r2, 0x80B17F
  LDI r6, 230
  DRAWTEXT r8, r2, r6, "WORLD"
  SHR r28, r15, r11
  SHLI r0, r5, 2
  SHLI r7, r15, 1
  SHR r12, r4, r10
  LDI r8, 255
  STORE r8, r1
  LOAD r0, r8
  LDI r7, 3755
  STORE r7, r13
  LOAD r21, r7
  LDI r5, 0xD6311F
  STORE r5, r31
  LOAD r3, r5
  LDI r11, 296
  STORE r11, r9
  LOAD r4, r11
  LDI r11, 10
  STORE r11, r9
  LOAD r4, r11
main_0:
  CMPI r12, 0x06AAF1
  CMPI r0, 29
  LDI r3, 417
  LDI r6, 0xA673AD
  LDI r2, 2
  DRAWTEXT r3, r6, r2, "WORLD"
  LDI r2, 3953
  LDI r2, 3998
  LDI r13, 1669
  PSET r2, r2, r13
  SUBI r9, r13, 229
  FRAME
  JMP main_0
