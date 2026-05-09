; DESCRIPTION: Draws a magenta rectangle at (391, 43) with width 43 and height 100.
; PLAN: r0=391(x), r1=43(y), r2=43(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 43
LDI r2, 43
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
