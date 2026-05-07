; Synthetic GeOS Program
; initialization
LDI r2, 0x00FF00
LDI r2, 0x0000FF
LDI r9, 958
LDI r27, 645
LDI r30, 112
LDI r1, 0x888888
; arithmetic section
LDI r22, 0x000000
SUB r6, r25, r4
SUB r31, r5, r2
; main loop
loop_0:
  LDI r29, 16711935
  FILL r29
RECTF r20, r16, r8, r13, r1
  FRAME
  JMP loop_0