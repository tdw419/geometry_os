; DESCRIPTION: Draws a magenta rectangle at (378, 187) with width 112 and height 66.
; PLAN: r0=378(x), r1=187(y), r2=112(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 187
LDI r2, 112
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
