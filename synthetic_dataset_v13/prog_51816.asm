; DESCRIPTION: Draws a magenta rectangle at (251, 38) with width 105 and height 31.
; PLAN: r0=251(x), r1=38(y), r2=105(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 38
LDI r2, 105
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
