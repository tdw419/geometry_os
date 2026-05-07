; math computation
; initialization
  LDI r10, 0x412012
  LDI r12, 8
  LDI r4, 0xE7472B
  LDI r3, 0x15512A
  LDI r2, 0x1FB00E
  OR r3, r29, r9
  OR r7, r0, r11
  XOR r7, r9, r12
  MOD r4, r8, r1
  CMPI r7, r10, 44
  ADD r17, r5, r0
  ANDI r5, r14, 128
  OR r13, r2, r11
  OR r4, r1, r15
  SHL r12, r0, r4
  AND r0, r13, r9
  XOR r11, r12, r3
  SUBI r4, r10, 64
  SHR r14, r4, r10
  SAR r2, r6, r9
  SHR r2, r5, r4
  SAR r12, r5, r2
  SHLI r11, r4, 2
  HALT
