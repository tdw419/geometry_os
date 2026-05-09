; DESCRIPTION: Draws a magenta rectangle at (18, 80) with width 99 and height 52.
; PLAN: r0=18(x), r1=80(y), r2=99(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 80
LDI r2, 99
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
