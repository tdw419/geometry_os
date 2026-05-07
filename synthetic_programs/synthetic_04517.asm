; math computation
; initialization
  LDI r7, 0xA5BE41
  LDI r15, 0x52FEAB
  LDI r5, 10
  LDI r8, 0x8FED57
  LDI r9, 3306
  SHLI r12, r1, 8
  SHLI r0, r20, 4
  SHLI r15, r31, 7
  SHL r11, r7, r6
  SHL r13, r5, r6
  SHLI r9, r3, 255
  SHR r3, r11, r15
  OR r0, r13, r4
  XOR r3, r0, r12
  AND r9, r7, r2
  AND r15, r14, r13
  MOD r8, r1, r14
  AND r15, r3, r2
  XOR r13, r0, r11
  OR r8, r11, r12
  SUBI r6, r27, 2
  SHL r15, r21, r10
  SHR r6, r15, r1
  ANDI r8, r10, 96
  HALT
