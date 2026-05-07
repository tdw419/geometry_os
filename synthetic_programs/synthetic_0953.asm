; Synthetic GeOS Program
; initialization
LDI r18, 376
LDI r13, 472
; main loop
loop_0:
  LDI r29, 0
  FILL r29
RECTF r3, r9, r22, r20, r2
CIRCLE r18, r6, r4, r17
LINE r0, r11, r22, r26, r29
  FRAME
  JMP loop_0