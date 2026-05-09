; DESCRIPTION: Draws a blue rectangle at (165, 174) with width 115 and height 59.
; PLAN: r0=165(x), r1=174(y), r2=115(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 174
LDI r2, 115
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
