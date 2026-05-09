; DESCRIPTION: Draws a magenta rectangle at (199, 91) with width 78 and height 53.
; PLAN: r0=199(x), r1=91(y), r2=78(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 91
LDI r2, 78
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
