; drawing loop program
; initialization
  LDI r0, 255
  LDI r15, 0x915F09
  LDI r13, 0x9ADBD2
  LDI r8, 0xB51F9D
  LDI r1, 668
main_0:
  IKEY r3
  CMPI r3, 0x29BCF4
  JNZ r3, key_1
  LDI r11, 3427
  LDI r15, 1320
  LDI r12, 0xF07979
  LDI r4, 894
  LDI r4, 0x7E6AB2
  RECTF r11, r15, r12, r4, r4
  SHLI r12, r3, 0xF49B35
  SHLI r10, r11, 6
  SAR r10, r8, r5
  AND r0, r11, r25
  OR r10, r6, r2
  AND r9, r17, r12
  FRAME
  JMP main_0
