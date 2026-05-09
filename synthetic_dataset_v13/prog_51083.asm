; DESCRIPTION: Draws a magenta rectangle at (349, 6) with width 11 and height 22.
; PLAN: r0=349(x), r1=6(y), r2=11(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 6
LDI r2, 11
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
