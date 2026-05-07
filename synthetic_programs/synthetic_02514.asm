; drawing loop program
; initialization
  LDI r6, 0x935B19
  LDI r3, 125
main_0:
  CMPI r6, r13, 152
  CMPI r0, 255
  AND r11, r3, r13
  FRAME
  JMP main_0
