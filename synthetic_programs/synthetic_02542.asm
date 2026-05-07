; math computation
; initialization
  LDI r11, 4
  LDI r8, 1
  LDI r15, 0x871905
  LDI r13, 0xFA4E89
  ADD r4, r7, r10
  SHLI r5, r14, 255
  SHR r5, r2, r0
  SHLI r9, r2, 128
  SHR r6, r9, r8
  AND r12, r7, r0
  OR r7, r2, r10
  AND r1, r10, r9
  ANDI r0, r8, 0
  SHR r3, r2, r9
  SHLI r27, r6, 8
  SHLI r3, r26, 4
  SHL r1, r7, r19
  DIV r10, r5, r6
  CMPI r2, r11, 0x69126E
  HALT
