; Synthetic GeOS Program
; initialization
LDI r15, 0xFF0000
LDI r4, 868
; arithmetic section
ADD r24, r8, r20
ADD r4, r16, r25
LDI r9, 749
LDI r16, 0x000000
SUB r29, r22, r22
; main loop
loop_0:
  LDI r22, 16711935
  FILL r22
PSET r1, r11, r1
  FRAME
  JMP loop_0