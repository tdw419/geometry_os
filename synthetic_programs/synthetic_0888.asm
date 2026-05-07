; Synthetic GeOS Program
; initialization
LDI r20, 0x000000
LDI r26, 313
LDI r29, 117
; arithmetic section
LDI r0, 673
ADD r27, r25, r2
ADD r3, r10, r5
SUB r6, r28, r19
LDI r6, 484
; main loop
loop_0:
  LDI r7, 65280
  FILL r7
LINE r18, r25, r26, r5, r10
  CMP r20, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0