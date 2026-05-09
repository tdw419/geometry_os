; DESCRIPTION: Draws a magenta rectangle at (276, 17) with width 36 and height 36.
; PLAN: r0=276(x), r1=17(y), r2=36(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 17
LDI r2, 36
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
