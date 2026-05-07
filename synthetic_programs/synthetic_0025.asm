; Synthetic GeOS Program
; initialization
LDI r14, 635
LDI r6, 758
LDI r15, 0x0000FF
; arithmetic section
ADD r7, r10, r6
ADD r11, r29, r10
SUB r8, r1, r25
; main loop
loop_0:
  LDI r8, 8947848
  FILL r8
LINE r4, r25, r9, r29, r19
PSET r26, r27, r17
  FRAME
  JMP loop_0