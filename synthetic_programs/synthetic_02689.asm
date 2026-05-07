; conditional logic
; initialization
  LDI r1, 255
  LDI r7, 2669
  LDI r12, 0xFEF477
  LDI r0, 0x50BEE3
  LDI r15, 1961
  LDI r11, 0xD3D3E1
  LDI r14, 449
  LDI r4, 3035
  CMP r8, r6
  JZ r8, else_0
  XOR r1, r5, r3
  JMP endif_1
else_0:
  LDI r1, 0x91C45C
  LDI r3, 685
  LDI r5, 3246
  PSET r1, r3, r5
  LDI r2, 386
  FILL r2
  LDI r11, 1553
  LDI r15, 2757
  LDI r7, 159
  PSET r11, r15, r7
endif_1:
  CMP r1, r7
  JZ r1, else_2
  MOD r9, r10, r0
  JMP endif_3
else_2:
  LDI r14, 3986
  LDI r9, 70
  LDI r3, 64
  PSETI
  LDI r3, 128
  LDI r28, 0x5BF980
  LDI r2, 64
  PSETI
endif_3:
  CMP r15, r1
  JZ r15, else_4
  SHR r6, r8, r1
  ADD r14, r4, r12
  ADD r2, r10, r12
  XOR r13, r5, r12
  JMP endif_5
else_4:
  LDI r6, 56
  LDI r6, 3581
  LDI r1, 0xADF0CA
  LDI r15, 447
  LDI r9, 32
  LINE r6, r6, r1, r15, r9
  LDI r9, 0x23E595
  FILL r9
  LDI r10, 0x861165
  LDI r8, 4
  LDI r8, 0xCF465B
  LDI r24, 0xFA5B0D
  LDI r10, 0xBDFFE9
  RECTF r10, r8, r8, r24, r10
endif_5:
  HALT
