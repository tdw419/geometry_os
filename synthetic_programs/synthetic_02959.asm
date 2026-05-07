; drawing loop program
; initialization
  LDI r6, 2141
  LDI r10, 966
  LDI r0, 1258
  LDI r16, 0x18A44E
  LDI r11, 884
  LDI r14, 32
  LDI r2, 0xBFDE00
main_0:
  LDI r1, 1881
  LDI r10, 0x3B1022
  LDI r13, 128
  WPIXEL
  OR r8, r15, r13
  OR r0, r3, r12
  OR r8, r1, r12
  AND r14, r12, r8
  CMPI r8, 0x21BAE5
  FRAME
  JMP main_0
