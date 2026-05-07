; drawing loop program
; initialization
  LDI r9, 0x8A83AA
  LDI r1, 10
  LDI r14, 1975
  LDI r4, 2373
  LDI r6, 0x6E87D3
  LDI r28, 16
  LDI r10, 0xA6A049
  LDI r11, 0xF09971
main_0:
  CMPI r4, 0x80D5D6
  MUL r11, r10, r4
  ANDI r5, r2, 0xB4FA37
  OR r1, r14, r9
  AND r4, r9, r0
  LDI r25, 0x4A154C
  LDI r2, 1763
  LDI r11, 3568
  DRAWTEXT r25, r2, r11, "WORLD"
  IKEY r2
  CMPI r2, 0x7BC99D
  JNZ r2, key_1
  FRAME
  JMP main_0
