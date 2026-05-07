; Synthetic GeOS Program
; initialization
LDI r7, 402
LDI r12, 100
LDI r16, 0x00FF00
LDI r29, 0xFF00FF
; main loop
loop_0:
  LDI r12, 16776960
  FILL r12
CIRCLE r20, r11, r30, r12
PSET r6, r3, r20
RECTF r17, r14, r23, r9, r2
  FRAME
  JMP loop_0