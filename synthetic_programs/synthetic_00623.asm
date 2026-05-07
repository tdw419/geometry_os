; drawing loop program
; initialization
  LDI r2, 1906
  LDI r3, 0xF00191
  LDI r11, 631
  LDI r0, 1318
  LDI r9, 0xC067ED
  LDI r13, 1289
main_0:
  SUB r0, r1, r3
  CMPI r13, r1, 2
  SAR r2, r1, r11
  SHLI r11, r7, 7
  SHR r8, r2, r0
  FRAME
  JMP main_0
