; drawing loop program
; initialization
  LDI r11, 130
  LDI r25, 0xECBDA4
main_0:
  SUBI r2, r1, 0
  LDI r28, 3015
  LDI r10, 417
  LDI r5, 3357
  WPIXEL
  SUB r26, r5, r10
  LDI r6, 0xAC4BE4
  LDI r0, 0xCC6A23
  LDI r2, 0xCE3505
  WPIXEL
  FRAME
  JMP main_0
