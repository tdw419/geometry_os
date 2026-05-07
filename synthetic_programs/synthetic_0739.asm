; Synthetic GeOS Program
; initialization
LDI r6, 955
LDI r0, 851
; arithmetic section
SUB r28, r23, r29
SUB r29, r14, r22
ADD r29, r0, r11
ADD r3, r17, r4
LDI r13, 513
SUB r12, r24, r13
SUB r14, r2, r4
; main loop
loop_0:
  LDI r12, 255
  FILL r12
CIRCLE r23, r3, r11, r17
LINE r23, r12, r23, r8, r4
  FRAME
  JMP loop_0