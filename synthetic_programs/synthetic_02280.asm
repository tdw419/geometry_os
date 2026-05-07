; input driven program
; initialization
  LDI r4, 64
  LDI r11, 0x424CE4
  LDI r1, 0xA7AD0B
main_0:
  MOD r10, r15, r9
  LDI r5, 649
  LDI r12, 0x6BA98B
  LDI r9, 33
  WPIXEL
  LDI r11, 702
  LDI r4, 0x566712
  LDI r15, 32
  DRAWTEXT r11, r4, r15, "WORLD"
  LDI r12, 128
  LDI r7, 0x6F0031
  LDI r5, 0x76CC51
  LDI r7, 128
  LDI r8, 2240
  RECTF r12, r7, r5, r7, r8
  IKEY r9
  CMPI r9, 255
  JNZ r9, key_1
  SHLI r7, r12, 255
  SHL r12, r13, r2
  SAR r9, r24, r13
  SHLI r11, r8, 1
  FRAME
  JMP main_0
