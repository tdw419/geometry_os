; DESCRIPTION: Draws a magenta rectangle at (391, 112) with width 107 and height 77.
; PLAN: r0=391(x), r1=112(y), r2=107(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 112
LDI r2, 107
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
