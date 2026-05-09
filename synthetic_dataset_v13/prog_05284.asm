; DESCRIPTION: Draws a magenta rectangle at (265, 97) with width 44 and height 39.
; PLAN: r0=265(x), r1=97(y), r2=44(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 97
LDI r2, 44
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
