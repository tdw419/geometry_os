; mixed program
; initialization
  LDI r29, 0
  LDI r7, 1844
  LDI r9, 0xFF0C3E
  LDI r12, 324
  IKEY r11
  CMPI r11, 255
  JNZ r11, key_0
  IKEY r9
  CMPI r9, 8
  JNZ r9, key_1
  LDI r9, 128
  LDI r9, 128
  LDI r7, 255
  DRAWTEXT r9, r9, r7, "WORLD"
  LDI r5, 0xD8EC3E
loop_2:
  SUB r0, r6, r10
  ANDI r0, r28, 8
  SUB r0, r8, r10
  LDI r7, 1
  SUB r5, r5, r7
  JNZ r5, loop_2
  HALT
