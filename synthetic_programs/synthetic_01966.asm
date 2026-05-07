; drawing loop program
; initialization
  LDI r9, 32
  LDI r11, 1507
  LDI r2, 0x0C9018
  LDI r5, 0x559967
  LDI r3, 1650
main_0:
  OR r3, r4, r6
  XOR r3, r9, r12
  SHLI r15, r0, 0x5D122E
  SHLI r4, r8, 0xAF470E
  SHL r6, r10, r12
  SHR r1, r3, r5
  SHR r1, r0, r31
  SAR r9, r14, r13
  OR r6, r15, r5
  AND r14, r15, r9
  CMP r3, r4
  FRAME
  JMP main_0
