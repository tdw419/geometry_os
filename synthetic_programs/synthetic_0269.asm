; Synthetic GeOS Program
; initialization
LDI r15, 0xFF0000
LDI r24, 0x888888
LDI r29, 173
; arithmetic section
ADD r3, r26, r26
SUB r11, r8, r4
LDI r10, 709
; main loop
loop_0:
  LDI r29, 16711935
  FILL r29
PSET r23, r18, r25
  FRAME
  JMP loop_0