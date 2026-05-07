; drawing loop program
; initialization
  LDI r21, 0x2BBD99
  LDI r9, 64
  LDI r10, 0xA90314
  LDI r1, 2289
  LDI r5, 0x7A29C2
  LDI r4, 3751
main_0:
  CMPI r8, 8
  CMP r11, r1
  IKEY r5
  CMPI r5, 32
  JNZ r5, key_1
  FRAME
  JMP main_0
