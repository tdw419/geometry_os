; DESCRIPTION: Draws a magenta rectangle at (18, 52) with width 85 and height 17.
; PLAN: r0=18(x), r1=52(y), r2=85(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 52
LDI r2, 85
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
