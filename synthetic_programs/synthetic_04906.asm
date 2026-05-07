; input driven program
; initialization
  LDI r29, 2995
  LDI r1, 1936
  LDI r2, 0xC2B2CA
main_0:
  LDI r5, 0x592172
  LDI r6, 0x330010
  LDI r21, 255
  WPIXEL
  SHLI r13, r18, 128
  SHL r12, r11, r9
  SAR r13, r0, r1
  CMPI r0, 0x332D9A
  LDI r7, 8
  LDI r0, 32
  LDI r1, 1336
  DRAWTEXT r7, r0, r1, "WORLD"
  IKEY r10
  CMPI r10, 0xCB20E6
  JNZ r10, key_1
  FRAME
  JMP main_0
