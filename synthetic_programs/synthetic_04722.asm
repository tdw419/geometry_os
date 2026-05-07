; drawing loop program
; initialization
  LDI r10, 1
  LDI r0, 0x51974B
main_0:
  LDI r5, 10
  LDI r11, 3245
  LDI r8, 2200
  DRAWTEXT r5, r11, r8, "WORLD"
  SHLI r3, r0, 0x9023C5
  SAR r6, r15, r10
  SHL r0, r6, r7
  LDI r5, 0x067125
  FILL r5
  MUL r2, r15, r4
  CMP r17, r4
  FRAME
  JMP main_0
