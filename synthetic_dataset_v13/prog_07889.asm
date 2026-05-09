; DESCRIPTION: Draws a blue rectangle at (306, 60) with width 29 and height 115.
; PLAN: r0=306(x), r1=60(y), r2=29(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 60
LDI r2, 29
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
