; mixed program
; initialization
  LDI r9, 0xC4D146
  LDI r22, 255
  SHR r3, r6, r4
  SHR r11, r2, r7
  SAR r15, r9, r19
  SHL r10, r13, r6
  LDI r28, 682
  LDI r7, 2261
  LDI r3, 4
  LDI r5, 2
  LDI r14, 3407
  RECTF r28, r7, r3, r5, r14
  SHLI r13, r6, 0xABC235
  SHLI r11, r10, 5
  SHL r14, r15, r17
  SHL r2, r7, r1
  CMPI r27, 2
  SAR r0, r19, r27
  SHL r8, r4, r10
  MOD r11, r0, r12
  LDI r1, 0x0028A2
  LDI r8, 1669
  LDI r10, 3733
  TEXT r1, r8, r10, "HELLO"
  HALT
