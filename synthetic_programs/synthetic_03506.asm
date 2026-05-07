; drawing loop program
; initialization
  LDI r11, 0x1A01B0
  LDI r18, 225
  LDI r7, 3374
  LDI r12, 1257
  LDI r9, 0xB2C290
  LDI r3, 0x90A69B
main_0:
  LDI r7, 32
  LDI r0, 0xDC3EB5
  LDI r5, 64
  WPIXEL
  IKEY r8
  CMPI r8, 0
  JNZ r8, key_1
  SAR r1, r15, r20
  SHLI r9, r3, 128
  SHR r29, r5, r15
  FRAME
  JMP main_0
