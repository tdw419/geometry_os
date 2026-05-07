; drawing loop program
; initialization
  LDI r6, 256
  LDI r8, 0x67D104
  LDI r11, 0x369FFA
  LDI r2, 54
  LDI r1, 10
  LDI r4, 0xD8AA81
  LDI r12, 3745
main_0:
  LDI r0, 0x6BE7BC
  LDI r3, 2127
  LDI r8, 0xF1542D
  DRAWTEXT r0, r3, r8, "WORLD"
  AND r6, r11, r12
  OR r4, r23, r8
  AND r12, r4, r0
  CMP r10, r9
  SHL r5, r8, r3
  SHLI r8, r13, 0x65DDD6
  SHR r25, r15, r14
  SHL r9, r4, r10
  CMPI r2, r10, 0xA23DDD
  SAR r12, r14, r11
  SHLI r5, r4, 1
  SHR r3, r15, r0
  SHLI r2, r4, 0xC799EC
  FRAME
  JMP main_0
