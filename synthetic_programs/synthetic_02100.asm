; drawing loop program
; initialization
  LDI r7, 1120
  LDI r10, 255
  LDI r0, 120
  LDI r4, 0xEA84CF
  LDI r11, 255
  LDI r5, 1763
main_0:
  CMP r10, r0
  SHLI r12, r0, 1
  SAR r0, r4, r13
  SHLI r5, r1, 10
  SHLI r7, r6, 5
  CMPI r15, 0
  IKEY r1
  CMPI r1, 0xF2544B
  JNZ r1, key_1
  SHLI r6, r11, 1
  SHLI r11, r5, 32
  IKEY r8
  CMPI r8, 0x896252
  JNZ r8, key_2
  FRAME
  JMP main_0
