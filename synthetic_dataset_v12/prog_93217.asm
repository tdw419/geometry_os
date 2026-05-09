; DESCRIPTION: Draws a magenta rectangle at (75, 83) with width 52 and height 47.
; PLAN: r0=75(x), r1=83(y), r2=52(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 83
LDI r2, 52
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
