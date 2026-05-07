; Synthetic GeOS Program
; initialization
LDI r18, 232
LDI r5, 667
LDI r2, 101
LDI r7, 80
LDI r23, 868
LDI r16, 616
; arithmetic section
ADD r2, r14, r9
LDI r18, 405
ADD r30, r1, r18
ADD r6, r9, r25
; main loop
loop_0:
  LDI r14, 16711935
  FILL r14
CIRCLE r8, r18, r11, r6
RECTF r5, r19, r20, r21, r9
  FRAME
  JMP loop_0