; DESCRIPTION: Draws a magenta rectangle at (159, 188) with width 66 and height 65.
; PLAN: r0=159(x), r1=188(y), r2=66(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 188
LDI r2, 66
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
