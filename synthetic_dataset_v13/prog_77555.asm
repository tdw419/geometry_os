; DESCRIPTION: Draws a blue rectangle at (53, 113) with width 85 and height 13.
; PLAN: r0=53(x), r1=113(y), r2=85(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 113
LDI r2, 85
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
