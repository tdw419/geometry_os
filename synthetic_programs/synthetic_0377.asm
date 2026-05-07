; Synthetic GeOS Program
; initialization
LDI r25, 0x000000
LDI r14, 1016
LDI r11, 0x00FFFF
LDI r5, 0x888888
LDI r4, 455
LDI r9, 185
; arithmetic section
SUB r25, r11, r11
SUB r9, r9, r30
SUB r5, r9, r30
; main loop
loop_0:
  LDI r6, 16776960
  FILL r6
PSET r1, r22, r9
  CMP r16, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0