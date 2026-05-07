; Synthetic GeOS Program
; initialization
LDI r11, 0x888888
LDI r4, 579
; arithmetic section
LDI r0, 884
SUB r26, r30, r13
LDI r28, 0x888888
; main loop
loop_0:
  LDI r5, 8947848
  FILL r5
RECTF r10, r1, r23, r5, r3
  FRAME
  JMP loop_0