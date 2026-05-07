; Synthetic GeOS Program
; initialization
LDI r19, 522
LDI r24, 53
LDI r17, 47
; arithmetic section
SUB r8, r18, r3
LDI r4, 635
ADD r10, r24, r22
; main loop
loop_0:
  LDI r12, 255
  FILL r12
LINE r4, r6, r17, r12, r11
  FRAME
  JMP loop_0