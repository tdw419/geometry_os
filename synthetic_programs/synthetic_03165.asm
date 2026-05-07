; drawing loop program
; initialization
  LDI r6, 0xE4AD09
  LDI r1, 0xDA090C
  LDI r10, 1654
  LDI r8, 1643
  LDI r5, 0x85BC71
  LDI r0, 2242
main_0:
  CMPI r30, r12, 93
  IKEY r13
  CMPI r13, 179
  JNZ r13, key_1
  SHR r12, r0, r2
  SHLI r13, r5, 0x5F90F9
  SHLI r13, r0, 4
  ANDI r3, r8, 256
  LDI r0, 0xF36DE3
  LDI r15, 0x76D7C8
  LDI r8, 911
  TEXT r0, r15, r8, "HELLO"
  FRAME
  JMP main_0
