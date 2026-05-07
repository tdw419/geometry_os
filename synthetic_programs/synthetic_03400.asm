; drawing loop program
; initialization
  LDI r1, 0x0A4F98
  LDI r6, 0x7EF17B
  LDI r5, 0
main_0:
  LDI r15, 0x301CEF
  LDI r2, 10
  LDI r1, 3038
  DRAWTEXT r15, r2, r1, "WORLD"
  IKEY r1
  CMPI r1, 0x340674
  JNZ r1, key_1
  CMPI r0, 170
  SUBI r2, r13, 167
  SHR r13, r4, r8
  SHLI r15, r10, 256
  LDI r8, 4
  LDI r7, 2747
  LDI r11, 2129
  TEXT r8, r7, r11, "HELLO"
  FRAME
  JMP main_0
