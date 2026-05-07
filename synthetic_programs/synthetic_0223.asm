; Synthetic GeOS Program
; initialization
LDI r12, 0x00FFFF
LDI r20, 50
; main loop
loop_0:
  LDI r24, 16711680
  FILL r24
CIRCLE r4, r14, r30, r11
PSET r27, r25, r11
  FRAME
  JMP loop_0