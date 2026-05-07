; simple draw program
; initialization
  LDI r5, 1960
  LDI r14, 256
  LDI r12, 1
  LDI r29, 3677
  LDI r8, 2865
  WPIXEL
  LDI r7, 37
  LDI r15, 1
  LDI r24, 3125
  LDI r4, 0x9BA810
  LDI r7, 0x4299EF
  LINE r7, r15, r24, r4, r7
  LDI r6, 0x527A4A
  LDI r5, 852
  LDI r6, 16
  PSETI
  HALT
