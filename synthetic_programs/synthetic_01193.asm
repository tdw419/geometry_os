; drawing loop program
; initialization
  LDI r12, 0xB4DEA6
  LDI r13, 0x74C6AE
  LDI r2, 2447
  LDI r8, 8
  LDI r5, 10
  LDI r11, 1
  LDI r0, 64
  LDI r1, 8
main_0:
  LDI r4, 0xB81218
  FILL r4
  SAR r13, r1, r0
  SHLI r6, r15, 32
  SHR r12, r8, r7
  SAR r6, r10, r15
  FRAME
  JMP main_0
