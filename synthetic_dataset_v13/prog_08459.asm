; DESCRIPTION: Draws a magenta rectangle at (54, 11) with width 52 and height 120.
; PLAN: r0=54(x), r1=11(y), r2=52(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 11
LDI r2, 52
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
