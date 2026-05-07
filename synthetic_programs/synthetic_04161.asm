; drawing loop program
; initialization
  LDI r13, 128
  LDI r9, 1567
  LDI r5, 1407
main_0:
  SAR r14, r0, r1
  SHLI r12, r14, 32
  SHLI r8, r1, 8
  SHLI r3, r14, 0xCE0E1C
  LDI r6, 128
  LDI r6, 32
  LDI r4, 1097
  WPIXEL
  FRAME
  JMP main_0
