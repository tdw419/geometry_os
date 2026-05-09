; DESCRIPTION: Draws a blue rectangle at (220, 119) with width 60 and height 112.
; PLAN: r0=220(x), r1=119(y), r2=60(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 119
LDI r2, 60
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
