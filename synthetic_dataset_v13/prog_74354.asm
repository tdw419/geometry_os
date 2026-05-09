; DESCRIPTION: Draws a blue rectangle at (100, 43) with width 115 and height 39.
; PLAN: r0=100(x), r1=43(y), r2=115(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 43
LDI r2, 115
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
