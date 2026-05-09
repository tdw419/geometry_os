; DESCRIPTION: Draws a magenta rectangle at (180, 52) with width 100 and height 14.
; PLAN: r0=180(x), r1=52(y), r2=100(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 52
LDI r2, 100
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
