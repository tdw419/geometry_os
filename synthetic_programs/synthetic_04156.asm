; drawing loop program
; initialization
  LDI r6, 64
  LDI r4, 992
  LDI r2, 16
  LDI r10, 0x658050
main_0:
  LDI r14, 0x85C994
  LDI r5, 64
  LDI r13, 1485
  DRAWTEXT r14, r5, r13, "WORLD"
  IKEY r8
  CMPI r8, 0xB9BF92
  JNZ r8, key_1
  LDI r9, 3000
  LDI r7, 0
  LDI r11, 0xBDE6DD
  TEXT r9, r7, r11, "HELLO"
  LDI r5, 863
  LDI r4, 0x165AE2
  LDI r3, 696
  LDI r0, 128
  CIRCLE r5, r4, r3, r0
  SHR r13, r12, r8
  SAR r2, r4, r9
  SHL r15, r13, r1
  SHLI r1, r7, 0xBE9E78
  LDI r16, 865
  LDI r12, 2462
  LDI r14, 793
  TEXT r16, r12, r14, "HELLO"
  FRAME
  JMP main_0
