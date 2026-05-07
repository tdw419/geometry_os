; drawing loop program
; initialization
  LDI r11, 10
  LDI r10, 1
main_0:
  LDI r13, 2600
  LDI r14, 2309
  LDI r14, 2816
  TEXT r13, r14, r14, "HELLO"
  LDI r6, 2003
  LDI r6, 330
  LDI r3, 0xD16B1F
  DRAWTEXT r6, r6, r3, "WORLD"
  LDI r11, 0x43515A
  LDI r7, 0x02EDF0
  LDI r20, 255
  LDI r13, 0x0B4CB2
  LDI r9, 0x16E9EE
  LINE r11, r7, r20, r13, r9
  FRAME
  JMP main_0
