; DESCRIPTION: Draws a magenta rectangle at (172, 148) with width 97 and height 57.
; PLAN: r0=172(x), r1=148(y), r2=97(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 148
LDI r2, 97
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
