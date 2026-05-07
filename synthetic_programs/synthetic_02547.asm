; drawing loop program
; initialization
  LDI r14, 1066
  LDI r11, 3653
  LDI r12, 0x3074FF
  LDI r7, 256
  LDI r6, 2451
  LDI r10, 1
  LDI r9, 1
  LDI r8, 3442
main_0:
  IKEY r15
  CMPI r15, 10
  JNZ r15, key_1
  SHR r15, r12, r22
  SHL r8, r26, r15
  SAR r4, r0, r9
  SHLI r9, r14, 3
  LDI r2, 0x6291F7
  LDI r15, 16
  LDI r9, 1861
  TEXT r2, r15, r9, "HELLO"
  LDI r1, 0x37CF81
  LDI r11, 128
  LDI r5, 0
  WPIXEL
  FRAME
  JMP main_0
