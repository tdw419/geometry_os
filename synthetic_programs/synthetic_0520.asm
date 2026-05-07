; Synthetic GeOS Program
; initialization
LDI r24, 800
LDI r1, 0x00FF00
LDI r5, 327
LDI r12, 134
LDI r11, 235
LDI r0, 343
; main loop
loop_0:
  LDI r5, 16777215
  FILL r5
PSET r9, r1, r25
PSET r11, r1, r0
  FRAME
  JMP loop_0