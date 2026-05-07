; Synthetic GeOS Program
; initialization
LDI r23, 202
LDI r1, 21
LDI r0, 897
; arithmetic section
ADD r31, r6, r28
LDI r20, 677
ADD r9, r6, r3
ADD r29, r10, r23
; main loop
loop_0:
  LDI r8, 16711935
  FILL r8
LINE r6, r10, r16, r9, r28
CIRCLE r29, r13, r7, r18
CIRCLE r7, r3, r3, r27
  FRAME
  JMP loop_0