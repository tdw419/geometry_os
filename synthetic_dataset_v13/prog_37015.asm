; DESCRIPTION: Draws a magenta rectangle at (184, 78) with width 71 and height 108.
; PLAN: r0=184(x), r1=78(y), r2=71(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 78
LDI r2, 71
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
