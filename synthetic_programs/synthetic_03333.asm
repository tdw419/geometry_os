; mixed program
; initialization
  LDI r7, 2
  LDI r2, 255
  LDI r11, 2475
  LDI r16, 0
  LDI r3, 265
  LDI r13, 0
; palette
  LDI r17, 0x300B
  LDI r3, 1
  LDI r11, 0xAA00AA
  STORE r17, r11
  ADD r17, r17, r3
  LDI r11, 0xFF0000
  STORE r17, r11
  ADD r17, r17, r3
  LDI r11, 0x44FF00
  STORE r17, r11
  ADD r17, r17, r3
  LDI r11, 0x44FF00
  STORE r17, r11
  ADD r17, r17, r3
  LDI r11, 0xFF0000
  STORE r17, r11
  ADD r17, r17, r3
  LDI r11, 0xAA00AA
  STORE r17, r11
  ADD r17, r17, r3
  CMP r15, r10
  JNZ r15, else_0
  XOR r15, r0, r24
  AND r3, r14, r15
  JMP endif_1
else_0:
  LDI r10, 0xA46B0A
  FILL r10
  LDI r10, 238
  LDI r8, 0x0FBE38
  LDI r8, 1382
  PSET r10, r8, r8
endif_1:
  CMPI r15, 183
  SAR r13, r2, r0
  SHR r8, r0, r13
  SHLI r10, r9, 0xAF488F
  SHR r0, r6, r2
  IKEY r3
  CMPI r3, 0x4278D2
  JNZ r3, key_2
  OR r13, r9, r5
  IKEY r6
  CMPI r6, 0xD70D21
  JNZ r6, key_3
  IKEY r5
  CMPI r5, 32
  JNZ r5, key_4
main_5:
  IKEY r15
  CMPI r15, 0
  JNZ r15, key_6
  CMP r2, r0
  IKEY r8
  CMPI r8, 97
  JNZ r8, key_7
  IKEY r2
  CMPI r2, 164
  JNZ r2, key_8
  FRAME
  JMP main_5
