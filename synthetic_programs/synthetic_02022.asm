; input driven program
; initialization
  LDI r11, 0
  LDI r7, 63
main_0:
  XOR r7, r11, r15
  AND r6, r3, r1
  AND r9, r8, r5
  IKEY r3
  CMPI r3, 0xB75FD9
  JNZ r3, key_1
  CMP r3, r12
  LDI r7, 0x398F3A
  LDI r4, 3663
  LDI r11, 256
  DRAWTEXT r7, r4, r11, "WORLD"
  CMPI r8, 256
  OR r11, r5, r8
  XOR r6, r12, r7
  XOR r8, r10, r1
  AND r15, r9, r7
  FRAME
  JMP main_0
