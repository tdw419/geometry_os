; input driven program
; initialization
  LDI r8, 2000
  LDI r0, 255
main_0:
  LDI r11, 2900
  LDI r3, 32
  LDI r8, 256
  TEXT r11, r3, r8, "HELLO"
  IKEY r0
  CMPI r0, 2
  JNZ r0, key_1
  FRAME
  JMP main_0
