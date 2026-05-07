; mixed program
; initialization
  LDI r3, 2964
  LDI r8, 64
  LDI r7, 0x400D3C
  LDI r2, 0x01A4FB
  LDI r10, 1400
  LDI r5, 0x667D5D
  LDI r9, 0xAAE9CC
loop_0:
  DIV r7, r8, r13
  LDI r6, 1
  SUB r9, r9, r6
  JNZ r9, loop_0
  CMP r7, r9
  DIV r1, r15, r5
main_1:
  CMPI r0, r8, 4
  LDI r8, 0x47BAE1
  LDI r11, 2189
  LDI r7, 0xC7A9A9
  WPIXEL
  LDI r1, 0x14D95F
  LDI r15, 3556
  LDI r20, 3211
  LDI r9, 3294
  LDI r11, 32
  LINE r1, r15, r20, r9, r11
  FRAME
  JMP main_1
