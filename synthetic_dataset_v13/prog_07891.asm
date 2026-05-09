; DESCRIPTION: Draws a blue rectangle at (28, 62) with width 115 and height 84.
; PLAN: r0=28(x), r1=62(y), r2=115(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 62
LDI r2, 115
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
