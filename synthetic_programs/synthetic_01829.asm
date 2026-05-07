; input driven program
; initialization
  LDI r3, 0xAA798B
  LDI r14, 2533
  LDI r4, 8
  LDI r7, 0
  LDI r11, 645
  LDI r10, 0xA6D7D6
main_0:
  CMPI r0, 195
  LDI r1, 0x0A6CB0
  LDI r7, 0xE9DCC8
  LDI r4, 32
  DRAWTEXT r1, r7, r4, "WORLD"
  OR r17, r7, r1
  OR r1, r9, r12
  XOR r6, r8, r1
  CMPI r14, r9, 2
  FRAME
  JMP main_0
