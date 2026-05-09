; DESCRIPTION: Draws a magenta rectangle at (296, 78) with width 100 and height 35.
; PLAN: r0=296(x), r1=78(y), r2=100(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 78
LDI r2, 100
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
