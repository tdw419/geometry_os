; Synthetic GeOS Program
; initialization
LDI r29, 811
LDI r7, 1017
; arithmetic section
ADD r3, r9, r8
SUB r22, r17, r27
SUB r31, r24, r8
ADD r11, r31, r6
; main loop
loop_0:
  LDI r17, 0
  FILL r17
LINE r9, r4, r13, r8, r6
CIRCLE r14, r10, r26, r27
LINE r29, r25, r4, r2, r26
  FRAME
  JMP loop_0