; DESCRIPTION: Draws a blue rectangle at (277, 84) with width 73 and height 47.
; PLAN: r0=277(x), r1=84(y), r2=73(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 84
LDI r2, 73
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
