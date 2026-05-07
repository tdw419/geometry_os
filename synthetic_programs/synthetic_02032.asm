; drawing loop program
; initialization
  LDI r22, 3026
  LDI r29, 0x0730E1
  LDI r2, 959
  LDI r3, 0x0AE00D
  LDI r5, 1368
main_0:
  SHL r16, r4, r22
  SHLI r12, r10, 4
  SHL r8, r0, r6
  SHR r14, r7, r13
  LDI r2, 16
  LDI r4, 10
  LDI r3, 3535
  DRAWTEXT r2, r4, r3, "WORLD"
  OR r11, r4, r5
  FRAME
  JMP main_0
