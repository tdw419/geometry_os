; drawing loop program
; initialization
  LDI r2, 4
  LDI r9, 0x4410FA
  LDI r6, 1242
  LDI r8, 1
  LDI r1, 0xF71FCF
  LDI r7, 4042
  LDI r14, 256
  LDI r31, 64
main_0:
  AND r8, r7, r0
  OR r10, r9, r12
  AND r25, r8, r4
  XOR r7, r4, r11
  CMPI r10, r7, 0xF65C65
  SHL r1, r13, r15
  LDI r3, 32
  LDI r12, 4
  LDI r5, 3087
  PSET r3, r12, r5
  FRAME
  JMP main_0
