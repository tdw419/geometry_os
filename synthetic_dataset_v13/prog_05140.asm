; DESCRIPTION: Draws a magenta rectangle at (140, 183) with width 117 and height 11.
; PLAN: r0=140(x), r1=183(y), r2=117(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 183
LDI r2, 117
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
