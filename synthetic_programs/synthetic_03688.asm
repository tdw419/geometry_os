; drawing loop program
; initialization
  LDI r2, 0xBF332F
  LDI r4, 2243
  LDI r6, 16
  LDI r0, 2904
  LDI r9, 2
  LDI r5, 0x639E06
  LDI r3, 0x872CA9
main_0:
  LDI r0, 16
  LDI r2, 0
  LDI r11, 4
  DRAWTEXT r0, r2, r11, "WORLD"
  OR r9, r6, r16
  OR r7, r10, r9
  XOR r13, r30, r0
  ADDI r12, r9, 8
  FRAME
  JMP main_0
