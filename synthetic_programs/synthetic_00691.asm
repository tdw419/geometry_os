; drawing loop program
; initialization
  LDI r9, 128
  LDI r10, 32
  LDI r14, 0x778FBC
  LDI r6, 0xF06665
  LDI r4, 0
  LDI r11, 2556
main_0:
  CMPI r1, r9, 256
  CMPI r15, 128
  OR r13, r3, r2
  FRAME
  JMP main_0
