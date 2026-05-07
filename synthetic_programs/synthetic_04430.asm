; drawing loop program
; initialization
  LDI r4, 10
  LDI r10, 3148
  LDI r11, 0x8E0AC5
  LDI r3, 4
  LDI r12, 504
  LDI r13, 0xE3C851
main_0:
  IKEY r1
  CMPI r1, 2
  JNZ r1, key_1
  LDI r9, 64
  LDI r12, 255
  LDI r0, 2925
  PSET r9, r12, r0
  OR r1, r10, r11
  AND r5, r4, r7
  OR r4, r15, r9
  AND r3, r11, r12
  SHLI r5, r4, 2
  SHL r11, r3, r4
  SHLI r12, r2, 2
  FRAME
  JMP main_0
