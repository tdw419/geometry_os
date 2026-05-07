; Synthetic GeOS Program
; initialization
LDI r3, 649
LDI r5, 0x00FF00
LDI r5, 322
LDI r14, 299
LDI r23, 44
; arithmetic section
SUB r29, r18, r6
LDI r25, 881
LDI r4, 502
ADD r29, r25, r27
LDI r6, 0x00FFFF
ADD r15, r21, r6
; main loop
loop_0:
  LDI r10, 16711680
  FILL r10
LINE r6, r18, r14, r6, r29
CIRCLE r29, r18, r26, r0
  FRAME
  JMP loop_0