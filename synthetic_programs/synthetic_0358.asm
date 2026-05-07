; Synthetic GeOS Program
; initialization
LDI r4, 422
LDI r13, 0x00FFFF
; main loop
loop_0:
  LDI r24, 16711935
  FILL r24
PSET r11, r14, r28
PSET r30, r11, r2
  FRAME
  JMP loop_0