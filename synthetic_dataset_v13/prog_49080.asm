; DESCRIPTION: Draws a magenta rectangle at (391, 102) with width 66 and height 112.
; PLAN: r0=391(x), r1=102(y), r2=66(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 102
LDI r2, 66
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
