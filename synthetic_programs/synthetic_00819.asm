; mixed program
; initialization
  LDI r3, 0xE5A7F5
  LDI r5, 3715
  LDI r8, 64
  SAR r7, r3, r9
  SHL r10, r7, r0
  SAR r6, r9, r7
  SHLI r6, r3, 1
  SHLI r1, r14, 128
  SHLI r14, r8, 4
  SHR r5, r3, r6
  OR r7, r11, r9
  SHLI r10, r11, 0
  SHR r1, r10, r3
  SHLI r2, r3, 8
  SHL r1, r4, r5
  HALT
