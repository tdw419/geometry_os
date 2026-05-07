; input driven program
; initialization
  LDI r1, 0x7BBD46
  LDI r11, 0x7AAA38
  LDI r12, 3161
  LDI r5, 1
  LDI r7, 0xB9030A
main_0:
  CMP r8, r14
  LDI r4, 10
  LDI r9, 2015
  LDI r4, 3714
  DRAWTEXT r4, r9, r4, "WORLD"
  IKEY r5
  CMPI r5, 256
  JNZ r5, key_1
  LDI r10, 897
  LDI r1, 0x64FB47
  LDI r11, 0xAE452D
  DRAWTEXT r10, r1, r11, "WORLD"
  ANDI r13, r7, 1
  FRAME
  JMP main_0
