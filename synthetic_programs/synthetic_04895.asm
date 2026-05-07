; drawing loop program
; initialization
  LDI r5, 0x1A0A7F
  LDI r13, 0xBC2260
  LDI r0, 3219
  LDI r6, 0x33233F
  LDI r4, 128
  LDI r9, 32
main_0:
  LDI r0, 0
  FILL r0
  LDI r7, 1420
  LDI r11, 3120
  LDI r2, 0x5AF355
  TEXT r7, r11, r2, "HELLO"
  LDI r7, 0xAAB0DB
  LDI r30, 0x840B49
  LDI r7, 32
  PSET r7, r30, r7
  IKEY r10
  CMPI r10, 256
  JNZ r10, key_1
  IKEY r4
  CMPI r4, 128
  JNZ r4, key_2
  FRAME
  JMP main_0
