; Synthetic GeOS Program
; initialization
LDI r30, 239
LDI r4, 278
LDI r16, 526
; arithmetic section
LDI r15, 729
LDI r7, 900
ADD r3, r5, r27
; main loop
loop_0:
  LDI r26, 65280
  FILL r26
LINE r27, r4, r14, r29, r17
CIRCLE r14, r20, r24, r25
  FRAME
  JMP loop_0