; Synthetic GeOS Program
; initialization
LDI r9, 509
LDI r6, 350
; arithmetic section
ADD r10, r14, r31
SUB r5, r16, r21
ADD r27, r5, r18
; main loop
loop_0:
  LDI r21, 16711680
  FILL r21
LINE r21, r23, r20, r16, r0
RECTF r7, r1, r11, r4, r18
RECTF r27, r17, r28, r17, r30
  FRAME
  JMP loop_0