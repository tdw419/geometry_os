; Synthetic GeOS Program
; initialization
LDI r28, 111
LDI r24, 823
LDI r4, 251
LDI r4, 902
; arithmetic section
LDI r10, 165
LDI r9, 762
LDI r2, 278
ADD r0, r4, r14
LDI r11, 0xFF00FF
ADD r19, r5, r1
ADD r9, r11, r27
; main loop
loop_0:
  LDI r30, 65280
  FILL r30
RECTF r19, r9, r20, r22, r10
  FRAME
  JMP loop_0