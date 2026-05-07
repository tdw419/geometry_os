; input driven program
; initialization
  LDI r3, 0x12DF0B
  LDI r6, 20
main_0:
  OR r1, r6, r13
  LDI r11, 2689
  LDI r2, 0
  LDI r15, 0
  WPIXEL
  ANDI r3, r1, 213
  LDI r3, 228
  LDI r15, 0xB46038
  LDI r2, 4
  TEXT r3, r15, r2, "HELLO"
  FRAME
  JMP main_0
