; DESCRIPTION: Draws a magenta rectangle at (157, 145) with width 108 and height 111.
; PLAN: r0=157(x), r1=145(y), r2=108(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 145
LDI r2, 108
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
