; Synthetic GeOS Program
; initialization
LDI r27, 550
LDI r26, 24
; arithmetic section
LDI r19, 124
ADD r9, r21, r5
ADD r0, r19, r11
LDI r5, 362
; main loop
loop_0:
  LDI r5, 255
  FILL r5
PSET r15, r12, r25
  FRAME
  JMP loop_0