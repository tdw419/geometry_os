; Synthetic GeOS Program
; initialization
LDI r22, 738
LDI r2, 809
LDI r8, 502
; arithmetic section
LDI r31, 735
ADD r12, r3, r28
LDI r6, 31
SUB r9, r24, r23
; main loop
loop_0:
  LDI r29, 255
  FILL r29
RECTF r11, r3, r24, r20, r28
PSET r8, r19, r9
RECTF r21, r31, r9, r21, r27
  FRAME
  JMP loop_0