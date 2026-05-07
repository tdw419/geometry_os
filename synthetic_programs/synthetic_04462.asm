; drawing loop program
; initialization
  LDI r31, 8
  LDI r13, 2820
  LDI r0, 0xE34514
  LDI r6, 3779
  LDI r15, 1
  LDI r7, 0xDED9D9
  LDI r2, 8
main_0:
  LDI r12, 64
  LDI r7, 128
  LDI r13, 1683
  TEXT r12, r7, r13, "HELLO"
  LDI r12, 0xCA06CA
  LDI r13, 332
  LDI r8, 0
  TEXT r12, r13, r8, "HELLO"
  IKEY r6
  CMPI r6, 0x11DF25
  JNZ r6, key_1
  SAR r13, r4, r1
  SHR r12, r2, r13
  SHLI r11, r6, 0xF1B2A2
  FRAME
  JMP main_0
