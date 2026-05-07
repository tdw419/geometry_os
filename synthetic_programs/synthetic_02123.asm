; input driven program
; initialization
  LDI r11, 798
  LDI r13, 16
  LDI r6, 3914
  LDI r5, 896
  LDI r3, 0x4B88EA
  LDI r4, 10
  LDI r1, 32
  LDI r9, 2822
main_0:
  CMP r1, r4
  ANDI r0, r4, 223
  LDI r15, 1859
  LDI r7, 16
  LDI r6, 32
  TEXT r15, r7, r6, "HELLO"
  IKEY r1
  CMPI r1, 8
  JNZ r1, key_1
  FRAME
  JMP main_0
