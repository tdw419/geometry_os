; conditional logic
; initialization
  LDI r7, 0x8B0836
  LDI r14, 3292
  LDI r3, 32
  LDI r1, 0x62656C
  LDI r6, 3247
  LDI r12, 0xE2BE0B
  CMP r0, r8
  JZ r0, else_0
  OR r5, r4, r15
  SHL r12, r8, r4
  SUB r1, r5, r13
  OR r3, r15, r0
  JMP endif_1
else_0:
  LDI r10, 3329
  LDI r8, 1986
  LDI r11, 0
  PSETI
  LDI r11, 0
  LDI r12, 255
  LDI r13, 0xAA475A
  PSET r11, r12, r13
endif_1:
  CMP r9, r5
  JZ r9, else_2
  AND r14, r1, r0
  JMP endif_3
else_2:
  LDI r22, 0x8CCD3A
  FILL r22
  LDI r0, 32
  FILL r0
  LDI r12, 1468
  FILL r12
  LDI r0, 3054
  LDI r15, 2207
  LDI r12, 2659
  WPIXEL
endif_3:
  HALT
